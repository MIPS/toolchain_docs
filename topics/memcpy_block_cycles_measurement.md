# Measurement

The block cycle count depends on many things including the [block size]
[BLOCK_SIZE], ISA, pipe-line model and ABI. While the value could be
worked out by hand with sufficient knowledge, it is safest to use a MIPS
target to measure the actual cycle count. The measurement is done in 3 steps:

1. Do a memcpy of twice the block-size. This is intended to prime the
instruction and data caches for the following steps.
2. Do a memcpy of block-size on the same addresses as step 1 and measure the
number of cycles required.
3. Do a memcpy of twice the block-size on the same addresses as step 1 and
measure the number of cycles required.

The difference of the measurements from step 2 and step 3 is the block cycle
count. Measuring this way ensures that the overheads of loop-setup and
measurement, which are common for both steps, get discounted from the
difference. Typically we would do each step multiple times and average the
readings to build confidence. If averaging yields fractional values,
it is recommended to round down, due to the reasons mentioned in the previous
section.

The most straight-forward method of counting cycles is using the Read Hardware
Register interface. Refer to the appropriate ISA Reference Manual for the
details of the `RDHWR` instruction. We need to read the cycle count both
before and after the call to memcpy, take the difference and scale it by the
cycle resolution.
