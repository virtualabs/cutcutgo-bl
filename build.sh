#!/bin/bash
# Command-line build of cutcutgo-bl (no MPLAB X needed).
# Usage (Git Bash):
#   ./build.sh          Maker 3 / Explore 3 (PIC32MK1024MCF100) -> build/cutcutgo_bl_pic32mk1024mcf100.hex
#   ./build.sh maker    original Cricut Maker (PIC32MX470F512L)  -> build/cutcutgo_bl_pic32mx470f512l.hex
# Override tool locations with XC32_DIR / DFP_DIR if yours differ.
set -euo pipefail

BOARD="${1:-maker3}"
PACKS="/c/Program Files/Microchip/MPLABX/v6.20/packs/Microchip"
XC32_DIR="${XC32_DIR:-/c/Program Files/Microchip/xc32/v5.10}"
case "$BOARD" in
  maker3|explore3)
    DFP_DIR="${DFP_DIR:-$PACKS/PIC32MK-MC_DFP/1.11.151}"
    CPU=32MK1024MCF100; CFG_NAME=pic32mk_mcf100; LD=p32MK1024MCF100.ld
    NAME="cutcutgo_bl_pic32mk1024mcf100" ;;
  maker)
    DFP_DIR="${DFP_DIR:-$PACKS/PIC32MX_DFP/1.5.259}"
    CPU=32MX470F512L; CFG_NAME=pic32mx470_curiosity; LD=p32MX470F512H.ld   # as in virtualabs/cutcutgo-bl
    NAME="cutcutgo_bl_pic32mx470f512l" ;;
  *) echo "usage: $0 [maker3|explore3|maker]" >&2; exit 1 ;;
esac
CC="$XC32_DIR/bin/xc32-gcc"
BIN2HEX="$XC32_DIR/bin/xc32-bin2hex"

ROOT="$(cd "$(dirname "$0")" && pwd)"
PRJ="$ROOT/cutcutgo_bl.X"
CFG="src/config/$CFG_NAME"
OUT="$ROOT/build"
OBJ="$OUT/obj/$CFG_NAME"   # one object folder per chip: the shared sources compile differently
mkdir -p "$OBJ"

COMMON=(-mprocessor=$CPU "-mdfp=$DFP_DIR")
CFLAGS=("${COMMON[@]}" -g -O2 -fno-common -ffunction-sections -fdata-sections
        -I"$PRJ/src" -I"$PRJ/$CFG" -Werror-implicit-function-declaration)

SRCS=(
  $CFG/driver/memory/src/drv_memory_nvm.c
  $CFG/driver/memory/src/drv_memory.c
  $CFG/driver/usb/usbfs/src/drv_usbfs.c
  $CFG/driver/usb/usbfs/src/drv_usbfs_device.c
  $CFG/peripheral/clk/plib_clk.c
  $CFG/peripheral/evic/plib_evic.c
  $CFG/peripheral/gpio/plib_gpio.c
  $CFG/peripheral/nvm/plib_nvm.c
  $CFG/stdio/xc32_monitor.c
  $CFG/system/int/src/sys_int.c
  $CFG/usb/src/usb_device_msd.c
  $CFG/usb/src/usb_device.c
  $CFG/initialization.c
  $CFG/interrupts.c
  $CFG/exceptions.c
  $CFG/usb_device_init_data.c
  $CFG/tasks.c
  src/main.c src/app.c src/buttons.c src/led.c src/reset.c src/fat32.c
)

OBJS=()
cd "$PRJ"
for s in "${SRCS[@]}"; do
  o="$OBJ/$(echo "$s" | tr '/' '_' ).o"
  echo "CC  $s"
  "$CC" "${CFLAGS[@]}" -c "$s" -o "$o"
  OBJS+=("$o")
done

# Note: xc32-gcc -mdfp links the device's interrupt vector offset (OFFxxx)
# initialisation automatically; the linker's "Optional file
# vector_offset_init.o not found" message is harmless.
ELF="$OUT/$NAME.elf"
echo "LD  $ELF"
"$CC" "${COMMON[@]}" -o "$ELF" "${OBJS[@]}" \
  -Wl,--script="$PRJ/$CFG/$LD" \
  -Wl,--defsym=_min_heap_size=512,--gc-sections,-Map="$OUT/$NAME.map"
"$BIN2HEX" "$ELF"
echo "HEX ${ELF%.elf}.hex"
