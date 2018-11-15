# ENABLE_PREFETCH_CHECK

| Values | Default |
|--------|---------|
| 0 or 1 | 0 (disabled) |

## Description
 
Pre-fetching data beyond the requested (source + length) region can cause
memory exceptions. The MIPS memcpy implementation is deliberately conservative
in its approach. It will restrict prefetch requests to the memory region being
operated upon, even at the cost of fore-going the prefetch of the last cache
line in some cases.

Enabling this option will raise an assert if a prefetch is issued on a cache
line outside the region being operated upon. It is provided only as a
debugging aid so that future changes to the algorithm can be verified.

*Warning*: This option is not thread-safe!
