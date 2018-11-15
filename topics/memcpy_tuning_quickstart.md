# Quickstart Guide for Tuning memcpy()

1. Override the default external memory [latency][LATENCY_CYCLES] by adding
\``-DLATENCY_CYCLES=<value>`\` to the compiler flags, with the value obtained from
target specifications.

2. If the target CPU is already listed in the [block cycles
table][BLOCK_CYCLES] and the [cache line table][CACHE_LINE], then simply add
\``-mtune=<cpu>`\` to the compiler flags

3. If block cycles for target CPU are not listed, measure the actual
block-cycles as described [here][BLOCK_CYCLES_MEASUREMENT] and add
\``-DBLOCK_CYCLES=<value>`\` to the compiler flags.

4. If cache line for the target CPU is not listed and is not the default
(32-bytes), add \``-DCACHE_LINE=<value>`\` to the compiler flags.

5. If the block size in bytes is less than the cache line size and performance is
preferred over code size, then override the block size with \``-DBLOCK_SIZE=16`\`.

6. Rebuild \``memcpy.c`\` with the flags from steps 1-5 and other optimization
options as required.
