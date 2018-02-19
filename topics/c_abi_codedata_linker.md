# Linker behaviour

A linker can expand code sequences when a symbol is out of range of the instructions used and it can relax code sequences if it is possible to use a more compact sequence for a symbol.

A linker can delete the `$gp` setup instruction if it manages to eliminate all other references to `$gp` from a function. This instruction can be found by looking for a `R_NANOMIPS_PC_HI20` relocation applied to the `_gp` symbol. If all references to `$gp` have been eliminated from a function, then the `$gp` register can be removed from the function's `SAVE` and `RESTORE` instructions, which may enable the use of their 16-bit variants. SAVE and RESTORE instructions which have `$gp` in their list can be found by looking for the `R_NANOMIPS_SAVERESTORE` relocation.

A linker can find the information it needs for making decisions about relaxations and expansions by looking at the input objects' ELF header flags and through its command-line options.

A linker must check the `PCREL` ELF header flag to find out if it must emit PC-relative or is allowed to emit absolute sequences when doing transformations. It must also check the `PID` ELF header flag to find out whether it must enforce position-independent addressing for non-pre-emptible data symbols, and the nanoMIPS ABI flags to find out whether it is restricted to using nanoMIPS subset instructions.

It is advisable to give end users a command-line option which turns off linker expansions and relaxations, so that they can have more control over the link.

A linker does not need to know which model was explicitly chosen by the user at compile-time.

A linker must give an error if it finds any absolute sequences in position-independent code objects.

A simple linker, which does not support any relaxations and expansions, must give an error if it comes across automatic model sequences that it can not relax or expand.

