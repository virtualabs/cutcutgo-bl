/* 
 * File:   fat12.h
 * Author: virtualabs
 *
 * Created on 17 août 2023, 22:08
 */

#ifndef FAT12_H
#define	FAT12_H

#include "peripheral/nvm/plib_nvm.h"

#ifdef	__cplusplus
extern "C" {
#endif

typedef SYS_MEDIA_EVENT_HANDLER   DRV_MEMORY_TRANSFER_HANDLER;
typedef uintptr_t DRV_HANDLE;
typedef SYS_MEDIA_BLOCK_COMMAND_HANDLE  DRV_MEMORY_COMMAND_HANDLE;

#define UF2_MAGIC0      0x0A324655
#define UF2_MAGIC1      0x9E5D5157
#define UF2_MAGICEND    0x0AB16F30

DRV_HANDLE DRV_FAT12_Open
(
    const SYS_MODULE_INDEX drvIndex,
    const DRV_IO_INTENT ioIntent
);

void DRV_FAT12_Close
(
    const DRV_HANDLE handle
);

void DRV_FAT12_AsyncRead
(
    const DRV_HANDLE handle,
    DRV_MEMORY_COMMAND_HANDLE *commandHandle,
    void *targetBuffer,
    uint32_t blockStart,
    uint32_t nBlock
);

void DRV_FAT12_AsyncWrite
(
    const DRV_HANDLE handle,
    DRV_MEMORY_COMMAND_HANDLE *commandHandle,
    void *sourceBuffer,
    uint32_t blockStart,
    uint32_t nBlock
);

void DRV_FAT12_AsyncErase
(
    const DRV_HANDLE handle,
    DRV_MEMORY_COMMAND_HANDLE *commandHandle,
    uint32_t blockStart,
    uint32_t nBlock
);

void DRV_FAT12_AsyncEraseWrite
(
    const DRV_HANDLE handle,
    DRV_MEMORY_COMMAND_HANDLE *commandHandle,
    void *sourceBuffer,
    uint32_t blockStart,
    uint32_t nBlock
);

void DRV_FAT12_TransferHandlerSet
(
    const DRV_HANDLE handle,
    const void * transferHandler,
    const uintptr_t context
);

SYS_MEDIA_GEOMETRY * DRV_FAT12_GeometryGet
(
    const DRV_HANDLE handle
);

bool DRV_FAT12_IsAttached
(
    const DRV_HANDLE handle
);

bool DRV_FAT12_IsWriteProtected
(
    const DRV_HANDLE handle
);

uintptr_t DRV_FAT12_AddressGet
(
    const DRV_HANDLE handle
);

#ifdef	__cplusplus
}
#endif

#endif	/* FAT12_H */

