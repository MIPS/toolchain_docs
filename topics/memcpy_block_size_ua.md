# BLOCK_SIZE_UA

| Values | Default value |
|--------|---------------|
| 4, 8 or 16 | Defaults to 4 for nanoMIPS |
|        | same as BLOCK_SIZE otherwise |

## Description

The BLOCK_SIZE_UA parameter indirectly controls the unroll-factor of
the core loop for unaligned copies using the ALIGN instruction. This is
only relevant when [ISA_HAS_ALIGN][ISA_HAS_ALIGN] is true and
[HW_UNALIGNED_SUPPORT][HW_UNALIGNED_SUPPORT] is false. Refer to
the description of [BLOCK_SIZE][BLOCK_SIZE] for further details.