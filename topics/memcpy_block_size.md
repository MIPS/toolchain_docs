# BLOCK_SIZE

| Values | Default value |
|--------|---------------|
| 8 or 16 | 16 when cache-line size is 128 bytes |
|        | 8 otherwise |

## Description

The BLOCK_SIZE parameter indirectly controls the unroll-factor of the core
loop. Block size is the number of words copied in one iteration of the core
loop. Increasing the unroll factor increases code size and hampers cache
locality. Reducing the unroll factor means more cycles wasted on loop-overhead
instructions. The defaults provided give the best balance of code size and
performance. The implementation could be extended to support smaller or larger
powers of 2, but it is unlikely to yield any significant benefit.

Typically the block size must be at least as large as the [cache line
size][CACHE_LINE], otherwise the core loop will issue multiple prefetch
requests on the same cache line. An example of the latter case is an o32 build
for I6400/I6500. In this case, the cache line is 64-bytes which can support
a block size of 16. The provided implementation trades performance for code
size, by restricting block size to 8 words. One may rebuild memcpy for o32 on
I6400/I6500 with \```-mtune=i6400 -DBLOCK_SIZE=16``\` for best performance.