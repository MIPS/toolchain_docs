# CACHE_LINE

| Core | Default value |
|------|---------------|
| Octeon II, Octeon III | 128 |
| I6400, I6500 | 64 |
| P6600 | 32 |
| Interaptiv, Interaptiv-MR2 | 32 |
| I7200 (nanoMIPS) | 32 |
| generic | 32 |

## Description

This parameter defines the cache line size for a CPU configuration. Selecting
the correct cache line is important for performance. Underestimating this
value is safe but sub-optimal. If the selected value is lower than the actual
value on the target, then memcpy will do multiple prefetch requests on the
same cache line. If it is higher than actual, memcpy will skip prefetches on
intervening lines and cause cache misses.