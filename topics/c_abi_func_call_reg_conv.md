# Register conventions
* `$zero` (`$r0`) - hardware zero i.e. always read as zero. It can also be
used as a destination register, however, the result is lost.
* `$AT` (`$r1`) - the register is reserved for the assembler or linker and is
used as a temporary register e.g. for expansions of pseudo instructions.
* `$t0-$t3`,`$t4-$t5`,`$t8-$t9` (`$r12-$r15`,`$r2-$r3`,`$r24-$r25`) - by
convention, these registers can be used by subroutines without preserving
their contents. However, the registers must be saved before invoking
subroutines as there is no guarantee that any of the registers are not
destroyed by a subroutine call. The missing `$t6-$t7` in the naming convention
is intentional to keep `$t8-$t9` tied to registers `$r24-$r25` for minimal
porting effort of MIPS code to nanoMIPS as these registers are likely to be
used in many places.
* `$a0-$a7` (`$r4-$r11`) - used to pass up to 8 arguments to a subroutine.
The first two argument registers are dual-purpose: they are used to pass
argument and used as return registers. Unused argument registers can be used
as temporaries. If the return value is too large to fit into two registers,
the compiler will pass a pointer as an invisible first argument.
* `$s0-$s7` (`$r16-$r23`) - by convention, these registers must be saved and
restored by subroutines that use them i.e. the contents at the exit must be
the same as on the entry to a subroutine.
* `$k0-$k1` (`$r26-$r27`) - reserved by the OS/exception handler. These are
used as temporaries with original values not restored.
* `$gp` (`$r28`) - used as global pointer. Typically can be used in embedded
applications to provide efficient access to C static/extern data.
The addressable range for this area is 2MiB (note: the classic MIPS could only
access 64KiB of memory).
* `$sp` (`$r29`) - used as stack pointer.  It takes explicit instructions to
raise and lower the stack pointer, so MIPS code usually adjusts the stack only
on subroutine entry and exit; and it is the responsibility of the subroutine
being called to do this. `$sp` is normally adjusted, on entry, to the lowest
point that the stack will need to reach at any point in the subroutine. It
must maintain quadword alignment (16-bytes) and grow toward the lower
addresses.
* `$fp` (`$r30`) - useds a frame pointer to keep track of the stack if it's
impossible to determine the stack adjustment at the compile time e.g. when the
amount is determined at run-time; this may happen for things like variable
sized arrays placed on the stack (allowed in C99 standard). The frame pointer,
if needed, is initialized to a constant position relative to the function's
stack frame with a bias of 4096 bytes. The bias causes `$fp` to point 4096
bytes below the function's top of the current stack frame (toward the lower
addresses). If the `$fp` is not used then it can be used as a saved temporary.
* `$ra` (`$r31`) - return address. The register holds the address to which
control should be returned at the end of a subroutine. The register must be
saved if a subroutine calls another subroutine and restored before the exit.
 
Note that the use of named registers is now mandatory which is a deviation
from the original MIPS. The format `$N` where `N` is the register number has
been deprecated. Alternatively, `$rN` can be used as a substitute for the old
format and the number directly maps to the register number.
