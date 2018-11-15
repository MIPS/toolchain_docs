# LATENCY_CYCLES

| Configuration | Default value |
|-------|---------------|
| Octeon II, Octeon III | 150 |
| else (Boston FPGA) | 63 |

## Description

This is the number of cycles needed to fetch data from external RAM. It
represents the maximum memory latency of the system. L1 and L2 latencies are
typically less than this. If the provided defaults are inapplicable, this
parameter should be configured according to the specifications of the system
under consideration. Having a correct estimate of latency is essential for
proper prefetching. Over-estimating latency is safe but sub-optimal - it
causes memcpy to prefetching data much earlier than needed. Underestimating
latency will cause the prefetch logic to miss cache lines -- this can be
extremely detrimental to performance, especially when copying large blocks.
