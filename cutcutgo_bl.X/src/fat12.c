
#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>

#include "system/system_media.h"
#include "system/system_module.h"
#include "driver/driver_common.h"
#include "fat12.h"
#include "led.h"
#include "reset.h"

// *****************************************************************************
// *****************************************************************************
// Section: Global objects
// *****************************************************************************
// *****************************************************************************

/*************************************************
 * Hardware instance objects
 *************************************************/
#define DRV_MEMORY_DEVICE_START_ADDRESS      0x9d010000

/**
 * UF2 structures.
 */

typedef struct uf2_block {
    // 32 byte header
    uint32_t magicStart0;
    uint32_t magicStart1;
    uint32_t flags;
    uint32_t targetAddr;
    uint32_t payloadSize;
    uint32_t blockNo;
    uint32_t numBlocks;
    uint32_t familyID; // or fileSize
    uint8_t data[476];
    uint32_t magicEnd;
} uf2_block_t;

/**
 * FAT12 emulation
 */

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
    
    /* FAT12/FAT16 custom structure. */
#if 0
    uint8_t     bios_int13;
    uint8_t     reserved;
    uint8_t     extended_boot_sig;
    uint32_t    volume_serial;
    uint8_t     volume_name[11];
    uint8_t     fs_type[8];
#endif
    
    /* FAT32 custom structure (offset 36) */
    uint32_t    fat_sz32;
    uint16_t    ext_flags;
    uint16_t    fs_ver;
    uint32_t    root_cluster;
    uint16_t    fs_info;
    uint16_t    backup_boot;
    uint8_t     reserved[12];
    uint8_t     drive_num;
    uint8_t     reserved1;
    uint8_t     extended_boot_sig;
    uint32_t    volume_serial;
    uint8_t     volume_name[11];
    uint8_t     fs_type[8];
    
    /* offset 36 + 54 */
    
    
    uint8_t     padding[420];
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

typedef struct __attribute__((packed)) {
    uint32_t    lead_sig;
    uint8_t     reserved1[480];
    uint32_t    struct_sig;
    uint32_t    free_count;
    uint32_t    next_free;
    uint8_t     reserved2[12];
    uint32_t    trail_sig;
} fat32_fsinfo_t;

/**
 * Globals
 */

static unsigned char *fat12_volume = (unsigned char *)DRV_MEMORY_DEVICE_START_ADDRESS;

static DRV_MEMORY_TRANSFER_HANDLER gFat12_TransferHandler = NULL;
static uintptr_t gFat12_TransferHandlerContext = 0;
static uintptr_t gFat12_BlockStartAddress = 0;

static uint8_t page_buffer[4096];

/* UF2 block tracking. */
static uint32_t g_blocks_written = 0;
static uint32_t g_nb_blocks_expected = 0;

/**
 * This is a fake directory sector used as a read/write region. The remote host can write
 * any file/directory metadata without raising any error and being persistent (well, kind of,
 * only when the device is powered up).
 * 
 * This small trick allows the UF2 flash routine to focus on UF2 block erase/write operations and
 * not to care about FAT-related writes.
 */

static uint8_t g_fake_fat[512] = {
    0xF8, 0xFF, 0xFF, 0x0F, 0xFF, 0xFF, 0xFF, 0x0F, 0xF8, 0xFF, 0xFF, 0x0F, 0x00, 0x00, 0x00, 0x00, 
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

/**
 * Our emulated disk geometry (512 KB).
 */

static SYS_MEDIA_REGION_GEOMETRY gFat12_GeometryTable[] = {
    {
        .blockSize = 512,
        .numBlocks = 0x208000,
    },
    {
        .blockSize = 512,
        .numBlocks = 0x208000,
    }
};


/**
 * We don't support asynchronous read/write.
 */

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

/**
 * FAT12 MBR generation
 * 
 * Fill the provided buffer with our fake MBR.
 * 
 * @param buffer    Buffer corresponding to the MBR sector that is read
 */

void DRV_FAT12_GenerateMBR(unsigned char *buffer)
{
    fat12_mbr_t *p_mbr = (fat12_mbr_t *)buffer;
    
    /* Fill buffer with the correct values. */
    memset(buffer, 0, 512);
    
    p_mbr->partitions[0].flags = 0x80;
    p_mbr->partitions[0].first_block_chs[0] = 0;
    p_mbr->partitions[0].first_block_chs[1] = 2;
    p_mbr->partitions[0].first_block_chs[2] = 0;
    p_mbr->partitions[0].last_block_chs[0] = 161;
    p_mbr->partitions[0].last_block_chs[1] = 58;
    p_mbr->partitions[0].last_block_chs[2] = 32;
    p_mbr->partitions[0].lba = 1;
    p_mbr->partitions[0].num_blocks = 0x200000;  /* A ajuster en fonction de la taille */
    p_mbr->partitions[0].type= 0x0C;
    p_mbr->signature[0] = 0x55;
    p_mbr->signature[1] = 0xAA;
}

/**
 * FAT12 Volmume Record generation
 * 
 * Fill the provided buffer with our fake volume record
 * 
 * @param buffer    Buffer corresponding to the volume record sector that is read
 */

void DRV_FAT12_GenerateVolumeRecord(unsigned char *buffer)
{
    fat12_vbr_t *p_vbr = (fat12_vbr_t *)buffer;
    
    /* Fill buffer with the correct values. */
    memset(buffer, 0, 90);
    
    p_vbr->jump[0] = 0xEB;
    p_vbr->jump[1] = 0x58;
    p_vbr->jump[2] = 0x90;
    memcpy(p_vbr->oem_name, "MSDOS5.0", 8);
    p_vbr->bytes_per_sector = 512;
    p_vbr->sectors_per_cluster = 8;     /* Allows us to have a single sector FAT table. */
    p_vbr->reserved_sector_count = 32;   /* FAT12: 1*/
    p_vbr->num_fats = 2;                /* NumFAT MUST be 2 (old FAT12 code: 1) */
    p_vbr->num_root_entries_max = 0;    /* FAT12: 16 */
    p_vbr->total_sectors = 0;           /* FAT32: must be 0 */
    p_vbr->media_desc = 0xF8;           /* F8: non-removable media | F0: removable media */
    p_vbr->sectors_per_fat = 0;         /* FAT12: 1 | FAT32: must be 0 */
    p_vbr->sectors_per_track = 63;
    p_vbr->num_heads = 64;
    p_vbr->hidden_sectors = 0;
    p_vbr->total_sectors_32 = 0x1ff000;    /* TODO: total number of sectors for FAT32 */
    
#if 0
    /* FAT12 specific code*/
    p_vbr->bios_int13 = 0x80;
    p_vbr->reserved = 0;
    memset(p_vbr->volume_name, 0x20, 11);
    memcpy(p_vbr->volume_name, "NO NAME    ", 11);
    p_vbr->volume_serial = 0xBADF00D;
    p_vbr->extended_boot_sig = 0x29;
    memcpy(p_vbr->fs_type, "FAT12   ", 8);
    p_vbr->signature[0] = 0x55;
    p_vbr->signature[1] = 0xAA;
#endif
    
    /* FAT32 specific code. */
    p_vbr->fat_sz32 = 2048;        /* Number of sectors per FAT table. */
    p_vbr->ext_flags = 0;       /* runtime FAT mirroring. */
    p_vbr->fs_ver = 0;          /* Version is 0:0 */
    p_vbr->root_cluster = 2;    /* Root directory cluster number. */
    p_vbr->fs_info = 1;         /* FSInfo sector number.  */
    p_vbr->backup_boot = 6;     /* Sector #6 is used to mirror sector #0 */
    p_vbr->drive_num = 0x80;
    p_vbr->reserved1 = 0;
    memset(p_vbr->volume_name, 0x20, 11);
    memcpy(p_vbr->volume_name, "NO NAME    ", 11);
    p_vbr->volume_serial = 0xBADF00D;
    p_vbr->extended_boot_sig = 0x29;
    memcpy(p_vbr->fs_type, "FAT32   ", 8);
    p_vbr->signature[0] = 0x55;
    p_vbr->signature[1] = 0xAA;
}


void DRV_FAT32_GenerateFSInfo(unsigned char *buffer)
{
    fat32_fsinfo_t *p_fsinfo = (fat32_fsinfo_t *)buffer;
    
    /* Fill buffer with the correct values. */
    memset(buffer, 0, sizeof(fat32_fsinfo_t));
    
    /* Set signatures */
    p_fsinfo->lead_sig = 0x41615252;
    p_fsinfo->struct_sig = 0x61417272;
    p_fsinfo->trail_sig = 0xAA550000;
    
    /* Set fields. */
    p_fsinfo->free_count = 261626;
    p_fsinfo->next_free = 2;
}


/**
 * FAT12 Root directory generation
 * 
 * Fill the provided buffer with our fake root directory.
 * 
 * @param buffer    Buffer corresponding to the root directory sector that is read
 */

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


/**
 * Asynchronous sector read
 * 
 * @param handle        Driver handle (emulated, we don't care :P )
 * @param commandHandle Required to handle async operations (we don't care too :P)
 * @param targetBuffer  Buffer that will receive the data
 * @param blockStart    Block number the host wants to read from
 * @param nBlock        Number of blocks to read (basically, 1)
 */

void DRV_FAT12_AsyncRead
(
    const DRV_HANDLE handle,
    DRV_MEMORY_COMMAND_HANDLE *commandHandle,
    void *targetBuffer,
    uint32_t blockStart, /* Bloc de départ */
    uint32_t nBlock      /* Nombre de blocs */
)
{
    int offset = 0;
    
    /* If the host tries to read our MBR, generate it on-the-fly. */
    if ((blockStart == 0) && (nBlock > 0))
    {
        /* Generate MBR */
        DRV_FAT12_GenerateMBR(targetBuffer);
        blockStart++;
        nBlock--;
        offset += 512;
    }
    
    /* If the host tries to read our Volume Record, generate it on-the-fly. */
    if ((blockStart == 1) && (nBlock > 0))
    {
        /* Generate Volume Boot Record*/
        DRV_FAT12_GenerateVolumeRecord(&((unsigned char *)targetBuffer)[offset]);
        blockStart++;
        nBlock--;
        offset += 512;
    }
    
    /* If the host tries to read our FSInfo sector.  */
    if ((blockStart == 2) && (nBlock > 0))
    {
        /* Generate a fake FSInfo sector. */
        DRV_FAT32_GenerateFSInfo(&((unsigned char *)targetBuffer)[offset]);
        blockStart++;
        nBlock--;
        offset += 512;
    }
    
    /* If the host tries to read our root directory, generate on-the-fly. */
    if ((blockStart == 7) && (nBlock > 0))
    {
        /* Generate a backup Volume Boot Record*/
        DRV_FAT12_GenerateVolumeRecord(&((unsigned char *)targetBuffer)[offset]);
        blockStart++;
        nBlock--;
        offset += 512;
    }

    /* If the host tries to read our root directory, generate on-the-fly. */
    if ((blockStart == 8) && (nBlock > 0))
    {
        /* Generate a fake backup FSInfo sector. */
        DRV_FAT32_GenerateFSInfo(&((unsigned char *)targetBuffer)[offset]);
        blockStart++;
        nBlock--;
        offset += 512;
    }
    
    /* If the host tries to read our root directory, generate on-the-fly. */
    if ((blockStart == 9+24) && (nBlock > 0))
    {
        /* Generate fake FAT. */
        memcpy(&((unsigned char *)targetBuffer)[offset], g_fake_fat, 512);
        blockStart++;
        nBlock--;
        offset += 512;
    }
    
    if ((blockStart == 2057+24) && (nBlock > 0))
    {
        /* Generate fake FAT (copy). */
        memcpy(&((unsigned char *)targetBuffer)[offset], g_fake_fat, 512);
        blockStart++;
        nBlock--;
        offset += 512;
    }

    if ((blockStart == 4105+24) && (nBlock > 0))
    {
        /* Generate fake FAT (copy). */
        DRV_FAT12_GenerateRootDirectory(&((unsigned char *)targetBuffer)[offset]);
        blockStart++;
        nBlock--;
        offset += 512;
    }   
    
    /* If the host tries to read any other block, return a buffer full of zeroes =) . */
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

/**
 * Handle an asynchronous write.
 * 
 * In fact, this function is never called, because most systems prefer using
 * an AsyncEraseWrite rather than AsyncWrite alone.
 * 
 * @param handle
 * @param commandHandle
 * @param sourceBuffer
 * @param blockStart
 * @param nBlock
 */

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

/**
 * Handle asynchronous block erase.
 * 
 * Well, we don't need that. Really.
 * 
 * @param handle
 * @param commandHandle
 * @param blockStart
 * @param nBlock
 */

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

/**
 * Handle an asynchronous erase-then-write operation.
 * 
 * This function is used to erase a 512-byte block and then write into it
 * directly. This function is called each time the FAT is modified or when
 * any file sector is written.
 * 
 * We expect UF2 blocks to be written through this function call, and handle
 * Flash reprogramming for each of them.
 * 
 * @param handle            Driver handle (we don't care, remember ? :P )
 * @param commandHandle     Command handle for asynchronous operation (don't care !)
 * @param sourceBuffer      A 512 bytes buffer with the data we need to write to Flash
 * @param blockStart        Block number to write
 * @param nBlock            Number of blocks to write (basically, 1)
 */

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
    if ((blockStart == 9) || (blockStart == 73))
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
            (uf2_block->magicEnd == UF2_MAGICEND) &&
            (uf2_block->familyID == UF2_FAMILYID)
        ) {
            /* Track UF2 blocks. */
            if (g_nb_blocks_expected == 0)
            {
                g_nb_blocks_expected = uf2_block->numBlocks;
                g_blocks_written = 0;
            }
            
            /* Make sure we are going to overwrite the application memory. */
            if ((uf2_block->targetAddr >= 0x1D010000) && (uf2_block->targetAddr < 0x1D080000))
            {

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

                /* Make updown LED blink and set power to purple. */
                led_toggle_updown();
                led_set_power(true, false, true);
            }

            /* Are we done ? */
            g_blocks_written++;
            if (g_blocks_written >= g_nb_blocks_expected)
            {
                /* We wrote all the blocks, restart ! */
                led_set_power(false, false, true);
                led_set_updown(true);

                reset_soft();
            }
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

/**
 * Set the transfer handler callback.
 * 
 * This function is required to register a specific callback that must be called
 * once a write/read operation has been done.
 * 
 * So since we are doing synchronous writes/reads, we just need to store this
 * callback in a global variable.
 * 
 * @param handle
 * @param transferHandler
 * @param context
 */

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

/**
 * Return the drive geometry.
 */

SYS_MEDIA_GEOMETRY * DRV_FAT12_GeometryGet
(
    const DRV_HANDLE handle
)
{
    return &gFat12_MediaGeometry;
}

/**
 * Detect if the drive is attached (by default, always)
 */

bool DRV_FAT12_IsAttached
(
    const DRV_HANDLE handle
)
{
   return true;
}

/**
 * Detect if the drive is write-protected (by default, never)
 */

bool DRV_FAT12_IsWriteProtected
(
    const DRV_HANDLE handle
)
{
    /* This function always returns false */
    return false;
}

/**
 * Return the Start block address.
 */

uintptr_t DRV_FAT12_AddressGet
(
    const DRV_HANDLE handle
)
{
    return gFat12_BlockStartAddress;
}


/**
 * Check if an application upgrade is in progress.
 * 
 * @return true if we are writing an application into flash, false otherwise.
 */
bool is_fat12_upload_started(void)
{
    return (g_nb_blocks_expected != 0);
}