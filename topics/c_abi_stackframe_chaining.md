# Frame chaining

The p32 ABI allows more efficient stack backtracing compared to older MIPS ABIs as the frame pointers form a chain. To achieve this there is a fixed offset from any frame-pointer to the parent frame-pointer save location. In other words, there is no need to scan instructions to find the location of the parent frame pointer. The frame pointer, however, is now biased by 4096 bytes to enable full use of the unsigned 12-bit offsets in memory instructions when using the frame pointer as a base.

Stack backtracing requires the frame pointer/return address registers saved just below the logical frame pointer in the aforementioned order.

We can calculate the addresses needed for correct stack unwinding as follows:

```
logical frame pointer = (FP + 4096)
caller's frame pointer = *(int32_t *)(FP + 4096 - 4)
return address = *(int32_t *)(FP + 4096 - 8)
```

Note: The frame pointer is not mandatory. However, if the supporting tools enable the frame pointer then the location of the frame pointer is guaranteed and the return address is guaranteed for non-leaf functions at the specified location.
