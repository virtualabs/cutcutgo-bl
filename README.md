# cutcutgo-bl: an open-source bootloader for Cricut Maker 3, Explore 3 and the original Maker

## Bootloader features

This bootloader lets you flash [custom firmware](https://github.com/DnG-Crafts/cutcutgo) to the Cricut Maker 3, Explore 3 or original Maker over USB. When it runs, it appears on the computer as a mass-storage drive, and you drag and drop a compatible firmware file (UF2 format) onto it.

When no application is installed, the bootloader starts the drive automatically and waits for a UF2 file.

Only UF2 firmware files are supported.

This branch is a port to the **Cricut Maker 3** (main board SCM-84-100-X7, **PIC32MK1024MCF100**) and **Cricut Explore 3** (main board VLD-84-100-X5, **PIC32MK1024MCF100**). It is built and tested on those machines. The same source also builds the bootloader for the original **Cricut Maker** (PIC32MX470F512L), tested on that machine: see [Original Cricut Maker build](#original-cricut-maker-build). The original project is [virtualabs/cutcutgo-bl](https://github.com/virtualabs/cutcutgo-bl).

## Using it on the Maker 3 or Explore 3

| Action | How |
|---|---|
| Power on | Hold **Power** for about 1 s. |
| Enter update mode | Hold **Pause** while powering on. Update mode also starts by itself when no firmware is installed. |
| Update the firmware | Copy a `.uf2` file onto the drive that appears. |
| Leave update mode without updating | Hold **Power** for about 4 s (only while no upload is in progress). |

The **Power** ring shows what is happening:

| Power ring | Meaning |
|---|---|
| Red | Waiting for a file |
| Purple | Firmware blocks being written |
| Red | All blocks written; the bootloader restarts into the new firmware about a second later |


## How to build

Two ways, both producing a `.hex` file that you program into the chip with a PIC programmer (ICSP):

- **Command line:** `./build.sh` (Git Bash). Needs XC32 (tested with v5.10) and the `PIC32MK-MC_DFP` pack (tested with 1.11.151). Set `XC32_DIR` and `DFP_DIR` if they are not in the default MPLAB X locations. The output is `build/cutcutgo_bl_pic32mk1024mcf100.hex`.
- **Original Cricut Maker:** `./build.sh maker` (needs the `PIC32MX_DFP` pack, tested with 1.5.259). The output is `build/cutcutgo_bl_pic32mx470f512l.hex`.
- **MPLAB X:** open the `cutcutgo_bl.X` project. The GitHub Actions workflow (`.github/workflows/build.yml`) builds it the same way and publishes the hex as a pre-release named `latest`.

`tools/hex2uf2.py` converts an application `.hex` into a `.uf2` the bootloader accepts. Add `--maker` to make one for the original Maker build.

## Application requirements

- Link the application to start at `0x9D010000`: the bootloader jumps there.
- Do not use the first 64 KB of program flash.
- Build the UF2 with family ID **`0x4d4b4d43`** ("MKMC").

Firmware built for the original Maker's PIC32MX uses a different family ID (`0x4d414b52`) and is rejected. The original Maker build of this bootloader accepts only that ID, so each chip only takes its own firmware.

## PIC32MK1024MCF100 port

### What changed from the PIC32MX build

| Area | PIC32MX (original) | PIC32MK1024MCF100 |
|---|---|---|
| Config folder | `src/config/pic32mx470_curiosity` | `src/config/pic32mk_mcf100` |
| Clocks | PLL and USB PLL set by config bits | SYSCLK 120 MHz from config bits; USB PLL (48 MHz) set at run time in `UPLLCON` |
| Oscillator | fixed in config bits | set in `clock_config.h` (`BOARD_POSC_MHZ` = 8/12/24, crystal or EC). Default: 12 MHz crystal |
| Flash ops | NVMOP codes for MX, `NVMDATA` | MK NVMOP codes, `NVMDATA0`. Page 4 KB / row 512 B (same as MX) |
| Interrupts | `_FCE_VECTOR`, IRQ map for MX | `_FLASH_CONTROL_VECTOR` (31), `_USB_1_VECTOR` (34), MK IRQ map |
| Linker | `p32MX470F512H.ld` | `p32MK1024MCF100.ld`, bootloader limited to 64 KB |
| App flash window | `0x1D010000`-`0x1D080000` | `0x1D010000`-`0x1D100000` (1 MB part) |
| UF2 family ID | `0x4d414b52` ("MAKR") | `0x4d4b4d43` ("MKMC") |
| Button hold timing | busy-loop counts | core timer (1 s at boot, 4 s to reset) |
| End of upload | reset straight after the last block | waits for the last block to be acknowledged and the PC to stop writing |

### Pins (Cricut Maker 3 main board SCM-84-100-X7 | Explore 3 main board VLD-84-100-X5)

Buttons (all active low, with pull-ups on the board):

| Button | Pin |
|---|---|
| Power | RF13 |
| Load/Unload | RF12 |
| Play | RE15 |
| Pause | RE14 |

LEDs (all active high):

| LED | Pin |
|---|---|
| Power ring, white | RB7 |
| Power ring, red | RC10 |
| Power ring, blue | RD15 |
| Load/Unload, white | RD12 |
| Play, white | RD13 |
| Pause, blue | RD14 |


USB uses the USB1 module (D1+/D1-, pins 57/56), with VBUS sensing on pin 54. On this chip the USB PLL "ready" flag (`CLKSTAT.UPLLRDY`) never sets, even though USB works, so the clock code gives the PLLs a fixed time to lock rather than waiting for it.

## Original Cricut Maker build

`./build.sh maker` builds this bootloader for the original Cricut Maker (PIC32MX470F512L), from the original project's chip setup in `src/config/pic32mx470_curiosity`. The shared code (`src/*.c`) is the same for both chips. Each config folder has a `board.h` with what differs: button and LED pins, the UF2 family ID, the application flash window and the power-on hold time. The original Maker build therefore also gets this port's fixes: core-timer button timing, and the restart after an upload waiting until the PC has finished writing.

| Item | Original Cricut Maker |
|---|---|
| Chip, clock | PIC32MX470F512L, 16 MHz crystal, SYSCLK 96 MHz |
| Power-on | hold **Power** for about 3 s, as in the original bootloader |
| Update mode | hold **Pause** while powering on, or no firmware installed; copy a `.uf2` onto the drive. Hold **Power** about 4 s to leave without updating |
| UF2 family ID | `0x4d414b52` ("MAKR"), as in the original bootloader, so existing Maker firmware `.uf2` files still flash |
| App flash window | `0x1D010000`-`0x1D080000`; the app starts at `0x9D010000`, as on the Maker 3 |
| Buttons (active low) | Power RF3, Pause RB12, Logo RB13 |
| LEDs (active high) | Power ring white RF4, red RF5, blue RE4; Logo RB11; Pause RB10; Load/Unload RF13 |

The original Maker build is **tested on an original Maker**: it has flashed every cutcutgo build for that machine (`build_maker/cutcutgo_maker.uf2` in the firmware repository). The MPLAB X project and the GitHub Actions workflow build only the Maker 3 / Explore 3 version; build the original Maker version with `./build.sh maker`.

## Download Boolloader
The latest pre-compiled compatible bootloader is available on this [Release page](https://github.com/DnG-Crafts/cutcutgo-bl/releases)


## Download Firmware
The latest pre-compiled compatible firmware is available on this [Release page](https://github.com/DnG-Crafts/cutcutgo/releases)


## Download CutCraft
The latest pre-compiled design and send software with cutcutgo support is available on this [Release page](https://github.com/DnG-Crafts/CutCraft/releases)

