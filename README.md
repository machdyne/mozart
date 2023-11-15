# Mozart Motherboard

Mozart is a motherboard that when paired with a [Sechzig](https://github.com/machdyne/sechzig) compute module can function as a computer.

![Mozart Motherboard](https://github.com/machdyne/mozart/blob/f5a1b275e8dc324be2206cd35ae61664bfe08e8c/mozart.png)

This repo contains schematics, PCB layouts, pinouts and documentation.

Find more information on the [Mozart product page](https://machdyne.com/product/mozart-motherboard/).

## Using Mozart

Mozart requires a Sechzig module to power on. **When inserting a Sechzig module, make sure that pin 2 on Mozart and pin 2 on the module are both on the same side.**

## Firmware

Mozart has a JTAG and USB CDC interface that are both accessible on the USB-C port. These interfaces are provided by a [fork of pico-dirtyJtag](https://github.com/machdyne/mozart/tree/main/firmware). You can update the RP2040 firmware by holding down the BOOT button and then applying power.

To build the firmware from source:

```
$ cd firmware/pico-dirtyJtag
$ mkdir build
$ cmake .. -DPICO_DEFAULT_BOOT_STAGE2_FILE=/your-pico-sdk-directory/pico-sdk/src/rp2_common/boot_stage2/boot2_generic_03h.S
$ make
```

## Programming

Program the configuration SRAM of a Sechzig module:

```
sudo openFPGALoader -c dirtyJtag image.bit
```

Program the configuration flash on a Sechzig module:

```
sudo openFPGALoader -f -c dirtyJtag image.bit
```

## Linux

See the [Kakao Linux](https://github.com/machdyne/kakao) repo for the latest instructions.

## Pinouts

### LVDS Port

Mozart has an experimental SATA-style LVDS port. SATA is not supported.

| Pin | Signal |
| --- | ------ |
| 1 | GND |
| 2 | DS2\_P |
| 3 | DS2\_N |
| 4 | GND |
| 5 | DS1\_P |
| 6 | DS1\_N |
| 7 | GND |

### Audio Jack

Mozart has line-level audio output via a 3.5mm jack.

| Pin | Signal |
| --- | ------ |
| S | GND |
| R2 | NC |
| R1 | AUDIO\_R |
| T | AUDIO\_L |

### Audio Amp Port

Mozart has a socket for an optional audio amplifier, so that speakers
can be connected to the DAC output.

| Pin | Signal |
| --- | ------ |
| 1 | 5V0 |
| 2 | AUDIO\_L |
| 3 | AUDIO\_R |
| 4 | GND |

### DDMI Port

See the [DDMI repo](https://github.com/machdyne/ddmi) for details.

## License

The contents of this repo are released under the [Lone Dynamics Open License](LICENSE.md) with the following exceptions:

- The KiCad design files contain parts of the [kicad-pmod](https://github.com/mithro/kicad-pmod) library which is released under the [Apache License, Version 2.0](https://www.apache.org/licenses/LICENSE-2.0.html).

- The KiCad design files may contain symbols and footprints released under other licenses; please contact us if we've failed to give proper attribution.

Note: You can use these designs for commercial purposes but we ask that instead of producing exact clones, that you either replace our trademarks and logos with your own or add your own next to ours.
