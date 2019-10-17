# BLOCK_CYCLES_UA

| Configuration | Default value |
|------|---------------|
| I7200 (nanoMIPS) | 16 |
| otherwise | same as [BLOCK_CYCLES][BLOCK_CYCLES] |

## Description

This is the number of CPU cycles needed to execute one iteration of the core
loop for unaligned access, where it differs from the aligned copy loop. See
the description of [BLOCK_CYCLES][BLOCK_CYCLES] for details.
