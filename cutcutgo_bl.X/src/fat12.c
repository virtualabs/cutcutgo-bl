
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "system/system_media.h"
#include "system/system_module.h"
#include "driver/driver_common.h"
#include "fat12.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global objects
// *****************************************************************************
// *****************************************************************************

/*************************************************
 * Hardware instance objects
 *************************************************/
#define DRV_MEMORY_DEVICE_START_ADDRESS      0x9d010000

typedef struct uf2_block {
    // 32 byte header
    uint32_t magicStart0;
    uint32_t magicStart1;
    uint32_t flags;
    uint32_t targetAddr;
    uint32_t payloadSize;
    uint32_t blockNo;
    uint32_t numBlocks;
    uint32_t fileSize; // or familyID;
    uint8_t data[476];
    uint32_t magicEnd;
} uf2_block_t;

typedef struct {
    uint8_t flags;
    uint8_t first_block_chs[3];
    uint8_t type;
    uint8_t last_block_chs[3];
    uint32_t lba;
    uint32_t num_blocks;
} fat12_mbr_part_info_t;

typedef struct __attribute__((packed)) {
    uint8_t reserved[446];
    fat12_mbr_part_info_t partitions[4];
    uint8_t signature[2];
} fat12_mbr_t;


typedef struct __attribute__((packed)) {
    uint8_t     jump[3];
    uint8_t     oem_name[8];
    uint16_t    bytes_per_sector;
    uint8_t     sectors_per_cluster;
    uint16_t    reserved_sector_count;
    uint8_t     num_fats;
    uint16_t    num_root_entries_max;
    uint16_t    total_sectors;
    uint8_t     media_desc;
    uint16_t    sectors_per_fat;
    uint16_t    sectors_per_track;
    uint16_t    num_heads;
    uint32_t    hidden_sectors;
    uint32_t    total_sectors_32;
    
    uint8_t     bios_int13;
    uint8_t     reserved;
    uint8_t     extended_boot_sig;
    uint32_t    volume_serial;
    uint8_t     volume_name[11];
    uint8_t     fs_type[8];
    
    uint8_t     padding[448];
    uint8_t     signature[2];
    
} fat12_vbr_t;

typedef struct __attribute__((packed)) {
    uint8_t     dos_name[8];
    uint8_t     dos_ext[3];
    uint8_t     attributes;
    uint8_t     reserved;
    uint8_t     c_time_ms;
    uint16_t    c_time_hms;
    uint16_t    c_date;
    uint16_t    a_date;
    uint16_t    ea_index;
    uint16_t    m_time;
    uint16_t    m_date;
    uint16_t    first_cluster;
    uint32_t    file_size;
} fat12_rootdir_t;

static unsigned char *fat12_volume = (unsigned char *)DRV_MEMORY_DEVICE_START_ADDRESS;
//static unsigned char sector[512];

//static DRV_MEMORY_OBJECT gDrvFat12Obj[DRV_MEMORY_INSTANCES_NUMBER];

static DRV_MEMORY_TRANSFER_HANDLER gFat12_TransferHandler = NULL;
static uintptr_t gFat12_TransferHandlerContext = 0;
static uintptr_t gFat12_BlockStartAddress = 0;

static uint8_t page_buffer[4096];

static uint8_t g_fake_fat[512] = {
    0xF8, 0xFF, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
    0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 
};

static SYS_MEDIA_REGION_GEOMETRY gFat12_GeometryTable[] = {
    {
        .blockSize = 512,
        .numBlocks = 1024,
    },
    {
        .blockSize = 512,
        .numBlocks = 1024,
    }
};

static SYS_MEDIA_GEOMETRY gFat12_MediaGeometry = {
    .mediaProperty = SYS_MEDIA_READ_IS_BLOCKING | SYS_MEDIA_WRITE_IS_BLOCKING,
    .numReadRegions = 1,
    .numWriteRegions = 0,
    .numEraseRegions = 1,
    .geometryTable = gFat12_GeometryTable,
};

/***
 * FAT12 metadata generation routines
 ***/

void DRV_FAT12_GenerateMBR(unsigned char *buffer)
{
    fat12_mbr_t *p_mbr = (fat12_mbr_t *)buffer;
    
    /* Fill buffer with the correct values. */
    memset(buffer, 0, 512);
    
    p_mbr->partitions[0].flags = 0x80;
    p_mbr->partitions[0].lba = 1;
    p_mbr->partitions[0].num_blocks = 0x36f;  /* A ajuster en fonction de la taille */
    p_mbr->partitions[0].type= 1; 
    p_mbr->signature[0] = 0x55;
    p_mbr->signature[1] = 0xAA;
}

void DRV_FAT12_GenerateVolumeRecord(unsigned char *buffer)
{
    fat12_vbr_t *p_vbr = (fat12_vbr_t *)buffer;
    
    /* Fill buffer with the correct values. */
    memset(buffer, 0, 36);
    
    p_vbr->jump[0] = 0x90;
    p_vbr->jump[1] = 0x90;
    p_vbr->jump[2] = 0x90;
    memcpy(p_vbr->oem_name, "MSDOS5.0", 8);
    p_vbr->bytes_per_sector = 512;
    p_vbr->sectors_per_cluster = 4;
    p_vbr->reserved_sector_count = 1;
    p_vbr->num_fats = 1;
    p_vbr->num_root_entries_max = 16;
    p_vbr->total_sectors = 0x36F;
    p_vbr->media_desc = 0xF8;
    p_vbr->sectors_per_fat = 1;
    p_vbr->sectors_per_track = 0x20;
    p_vbr->num_heads = 0x40;
    p_vbr->hidden_sectors = 0;
    p_vbr->total_sectors_32 = 0; /* A adapter en fonction de la taille globale. */
    
    p_vbr->bios_int13 = 0x80;
    p_vbr->reserved = 0;
    memset(p_vbr->volume_name, 0x20, 11);
    memcpy(p_vbr->volume_name, "NO NAME    ", 11);
    p_vbr->volume_serial = 0xBADF00D;
    p_vbr->extended_boot_sig = 0x29;
    memcpy(p_vbr->fs_type, "FAT12   ", 8);
    p_vbr->signature[0] = 0x55;
    p_vbr->signature[1] = 0xAA;
}

void DRV_FAT12_GenerateRootDirectory(unsigned char *buffer)
{
    fat12_rootdir_t *p_rootdir = (fat12_rootdir_t *)buffer;
    
    /* Reset root directory. */
    memset(buffer, 0, 512);
    
    /* Create volume label. */
    memcpy(p_rootdir->dos_name, "Cutcutgo   ", 11);
    p_rootdir->attributes = 0x08; /* Volume label. */        
}


// *****************************************************************************
// *****************************************************************************
// Section: MEMORY Driver Client Routines
// *****************************************************************************
// *****************************************************************************

DRV_HANDLE DRV_FAT12_Open
(
    const SYS_MODULE_INDEX drvIndex,
    const DRV_IO_INTENT ioIntent
)
{
    /* Fake driver handle. */
    return 0x4242424;
}

void DRV_FAT12_Close
(
    const DRV_HANDLE handle
)
{
}

void DRV_FAT12_AsyncRead
(
    const DRV_HANDLE handle,
    DRV_MEMORY_COMMAND_HANDLE *commandHandle,
    void *targetBuffer,
    uint32_t blockStart, /* Bloc de d?part */
    uint32_t nBlock      /* Nombre de blocs */
)
{
    int offset = 0;
    
    if ((blockStart == 0) && (nBlock > 0))
    {
        /* Generate MBR */
        DRV_FAT12_GenerateMBR(targetBuffer);
        blockStart++;
        nBlock--;
        offset += 512;
    }
    
    if ((blockStart == 1) && (nBlock > 0))
    {
        /* Generate Volume Boot Record*/
        DRV_FAT12_GenerateVolumeRecord(&((unsigned char *)targetBuffer)[offset]);
        blockStart++;
        nBlock--;
        offset += 512;
    }
    
    if ((blockStart == 2) && (nBlock > 0))
    {
        /* Generate a fake FAT sector. */
        //DRV_FAT12_GenerateFATSector(&((unsigned char *)targetBuffer)[offset]);
        memcpy(&((unsigned char *)targetBuffer)[offset], g_fake_fat, 512);
    }
    
    if ((blockStart == 3) && (nBlock > 0))
    {
        /* Generate root directory. */
        DRV_FAT12_GenerateRootDirectory(&((unsigned char *)targetBuffer)[offset]);
        blockStart++;
        nBlock--;
        offset += 512;
    }

    if (nBlock > 0)
    {
        /* Handle block read. */
        //memcpy(&((unsigned char *)targetBuffer)[offset], &fat12_volume[blockStart*512], nBlock*512);
        memset(&((unsigned char *)targetBuffer)[offset], 0, nBlock*512);
    }
    
    *commandHandle = 0x42;
        
    if (gFat12_TransferHandler != NULL)
    {
        gFat12_TransferHandler(
            SYS_MEDIA_EVENT_BLOCK_COMMAND_COMPLETE,
            0x42,
            gFat12_TransferHandlerContext
        );
    }
}

void DRV_FAT12_AsyncWrite
(
    const DRV_HANDLE handle,
    DRV_MEMORY_COMMAND_HANDLE *commandHandle,
    void *sourceBuffer,
    uint32_t blockStart,
    uint32_t nBlock
)
{
    /* Consider our buffer as a UF2 block. */
    uf2_block_t *uf2_block = (uf2_block_t *)sourceBuffer;
    
    /* Make sure we have an UF2 block. */
    if ((uf2_block->magicStart0 == UF2_MAGIC0) && 
        (uf2_block->magicStart1 == UF2_MAGIC1) && 
        (uf2_block->magicEnd == UF2_MAGICEND)
    ) {
        uf2_block = NULL;
    }
    
    
    /* Handle block write. */
    *commandHandle = 0x42;
    
    if (gFat12_TransferHandler != NULL)
    {
        gFat12_TransferHandler(
            SYS_MEDIA_EVENT_BLOCK_COMMAND_COMPLETE,
            0x42,
            gFat12_TransferHandlerContext
        );
    }
}

void DRV_FAT12_AsyncErase
(
    const DRV_HANDLE handle,
    DRV_MEMORY_COMMAND_HANDLE *commandHandle,
    uint32_t blockStart,
    uint32_t nBlock
)
{
    /* Handle erase. */
    *commandHandle = 0x42;
    
    if (gFat12_TransferHandler != NULL)
    {
        gFat12_TransferHandler(
            SYS_MEDIA_EVENT_BLOCK_COMMAND_COMPLETE,
            0x42,
            gFat12_TransferHandlerContext
        );
    }
}

void DRV_FAT12_AsyncEraseWrite
(
    const DRV_HANDLE handle,
    DRV_MEMORY_COMMAND_HANDLE *commandHandle,
    void *sourceBuffer,
    uint32_t blockStart,
    uint32_t nBlock
)
{
    int i;
    uint32_t page_number, block_offset, block_addr, target_addr;
    
    /* Are we writing to the FAT ? */
    if (blockStart == 2)
    {
        memcpy(g_fake_fat, sourceBuffer, 512);
    }
    else
    {
        /* Consider our buffer as a UF2 block. */
        uf2_block_t *uf2_block = (uf2_block_t *)sourceBuffer;

        /* Make sure we have an UF2 block. */
        if ((uf2_block->magicStart0 == UF2_MAGIC0) && 
            (uf2_block->magicStart1 == UF2_MAGIC1) && 
            (uf2_block->magicEnd == UF2_MAGICEND)
        ) {
            /* Write the UF2 block in flash memory (synchronous). */
            target_addr = uf2_block->targetAddr - 0x1D010000;
            
            page_number = target_addr / 4096;
            block_addr = page_number * 4096; /* Compute flash address */
            block_offset = target_addr & 0x00000FFF;

            while(NVM_IsBusy());

            /* Read 4096 bytes at address `block_addr`. */
            NVM_Read((uint32_t *)page_buffer, 4096, 0x9d010000 + block_addr);
            while(NVM_IsBusy());

            /* Update page buffer with our data. */
            memcpy(&page_buffer[block_offset], uf2_block->data, 256);

            NVM_PageErase(0x9d010000 + block_addr);
            while(NVM_IsBusy());

            /* Write modified page buffer to Flash. */
            for (i=0; i<8; i++)
            {
                NVM_RowWrite((uint32_t *)&page_buffer[i*512], 0x9d010000 + block_addr + i*512);
                while (NVM_IsBusy());
            }

            /* Wait for page to be written. */
            while (NVM_IsBusy());

            /* Read 4096 bytes at address `block_addr`. */
            NVM_Read((uint32_t *)page_buffer, 512, 0x9d010000 + block_addr);
            while(NVM_IsBusy());

        }
    }
    
    /* Handle erase + write. */
    *commandHandle = 0x42;
    
    if (gFat12_TransferHandler != NULL)
    {
        gFat12_TransferHandler(
            SYS_MEDIA_EVENT_BLOCK_COMMAND_COMPLETE,
            0x42,
            gFat12_TransferHandlerContext
        );
    }
}

void DRV_FAT12_TransferHandlerSet
(
    const DRV_HANDLE handle,
    const void * transferHandler,
    const uintptr_t context
)
{   
    /* Set the event handler */
    gFat12_TransferHandler = (DRV_MEMORY_TRANSFER_HANDLER)transferHandler;
    gFat12_TransferHandlerContext = context;
}

SYS_MEDIA_GEOMETRY * DRV_FAT12_GeometryGet
(
    const DRV_HANDLE handle
)
{
    return &gFat12_MediaGeometry;
}

bool DRV_FAT12_IsAttached
(
    const DRV_HANDLE handle
)
{
   return true;
}

bool DRV_FAT12_IsWriteProtected
(
    const DRV_HANDLE handle
)
{
    /* This function always returns false */
    return false;
}

uintptr_t DRV_FAT12_AddressGet
(
    const DRV_HANDLE handle
)
{
    return gFat12_BlockStartAddress;
}
