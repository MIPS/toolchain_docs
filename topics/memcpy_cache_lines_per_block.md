# CACHE_LINES_PER_BLOCK

This is the number of cache lines copied in one iteration of the core loop. It
is calculated as:

		CACHE_LINES_PER_BLOCK = ceil (BLOCK_SIZE in bytes / CACHE_LINE)

This is also the number of prefetch requests issued per iteration of the core
loop. For efficiency of the pipe-lined prefetch logic, the amount of data
prefetched in each iteration must match the amount of data copied in that
iteration.

If the cache-line is greater than the unroll factor of the core loop, this
parameter is set to 1 and at least one prefetch is issues in each
iteration. As a consequence, 2 or 4 iterations consecutive iterations of
the core loop will issue prefetches on the same cache line. An example of
this is an o32 build for Octeon boards with 128-byte cache lines.

If the cache-line is smaller than the unroll factor of the core
loop, then multiple prefetches must be issued in each iteration to keep the
pipe-line full. An example of this case is the n32/n64 build for P6600. The
cache line for P6600 is 32 bytes, but the block size of 8 along with 64-bit
loads/stores mean that 64 bytes are copied in one iteration. To compensate for
the mismatch, each iteration issues 2 cache prefetches.