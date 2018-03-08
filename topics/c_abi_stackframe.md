# nanoMIPS Stack Frame

Each subroutine allocates a stack frame on the runtime stack, as required. A frame is allocated for each non-leaf function and for each leaf function that requires stack storage.

A non-leaf function is one that calls other function(s); a leaf function is one that does not itself make any function calls.

Stack frames are allocated on the runtime stack; the stack grows downward from high addresses to low addresses. The stack frame may have a fixed or dynamically extendable size.
