# HW_UNALIGNED_SUPPORT

| Values | Default value |
|--------|---------------|
| 0 or 1 | 1 (enabled) for MIPSR6 |
|        | 0 (disabled) for everything else, including nanoMIPS |

## Description

This indicates whether the ISA supports unaligned memory access at the hardware
level. Currently this is only supported for MIPS32r6 and MIPS64r6 cores. The
defaults do not warrant changing.
