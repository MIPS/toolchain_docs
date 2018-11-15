# PREF_AHEAD

Prefetching in memcpy is pipe-lined operation. Prefetch requests are
interleaved with the actual copying task. Prefetch request on a cache line
must be raised sufficiently in advance of the copying step for that line so
that the data is already in cache, when it is needed. PREF_AHEAD specifies the
delay or difference between raising a prefetch request on a cache line and
copying data from that line. This delay can be interpreted either as the
number of iterations of the core loop or as multiples of the [block
cycle][BLOCK_CYCLES].

It is calculated as:

		PREF_AHEAD = ceil ( LATENCY_CYCLES / BLOCK_CYCLES )

In order to avoid issuing prefetches beyond the operable memory region, memcpy
does not issue prefetches in the final PREF_AHEAD iterations of the core
loop. The prefetch ahead window can be manipulated by specifying a lower than
actual [latency][LATENCY_CYCLES]. For example, using L2 latency, which is
typically much lower than external memory has the effect of tuning the code
for L2 access, to the detriment of external access. Because one is trading
relatively cheap prefetch instructions for expensive cache misses, the
performance gain for L2 access from such an optimization will be much smaller
than the corresponding performance degradation when copying from external
memory.
