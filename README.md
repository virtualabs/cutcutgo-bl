# cutcutgo-bl: an opensource bootloader for Cricut Maker

## Bootloader features

This bootloader is designed for Cricut Maker only (for now), and allows firmware flashing through USB.
When enabled, the bootloader will spawn a mass-storage device onto the computer and the user simply has
to drag and drop a compatible firmware file (UF2 format).

By default, when no application has been installed the bootloader automatically spawns a mass-storage device
and awaits for a UF2 file to be written to the mounted device.

Only UF2 firmware files are supported by this bootloader, see (TODO) for official releases.

## How to build this bootloader

The `cutcutgo_bl.X` folder contains a MPLABX project that can be used to build and program the bootloader.

## How to download latest build

You can found a up-to-date pre-compiled version of the bootloader on this [Release page](https://github.com/virtualabs/cutcutgo-bl/releases/tag/latest)
