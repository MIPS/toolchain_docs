# BLOCK_CYCLES

| Configuration | Default value |
|------|---------------|
| Octeon II, Octeon III | 30 |
| I6400, I6500 | 15 |
| P6600 | 15 |
| Interaptiv, Interaptiv-MR2 | 30 |
| I7200 (nanoMIPS) | 20 |
| generic | 11 |

## Description

This is the number of CPU cycles needed to execute one iteration of the core
loop. The default cycle values indicated here correspond to the default [block
size][BLOCK_SIZE] values specified above. Changing block size will invariably
change block cycles and require the value to be measured again. A correct
measurement of block is essential for proper prefetching.

Underestimating block cycles is safe but sub-optimal -- it causes memcpy to
prefetching data earlier than needed. Over-estimating it will cause the
prefetch logic to miss cache lines and can be extremely detrimental to
performance, especially when copying large blocks. The default value for the
generic build is the lowest common denominator selected to avoid cache misses
on most MIPS cores.
