# Referring to the GP in code sequences

Both GP-relative and GOT-dependent addressing refer to the GP (Global Pointer) in code sequences and need to have the address of the GP loaded into the `$gp` register.

The `$gp` register is callee-saved in dynamically linked environments, so it needs to be saved, set up with the address of GP, and restored before returning in every function which uses it.

The `$gp` register does not need to be set up if the function is local, all of its callers are local, and all of its callers are guaranteed to have a correct `$gp`. It needs to be set up for all functions which can be called externally.

GP must be 4KiB-aligned for dynamically linked environments, enabling the `$gp` register to be set up using only one instruction:

`` aluipc $gp, %pcrel_hi(_gp) ``

This requirement does not exist for bare metal environments because doing so would waste too much space in smaller applications. Dynamically linked environments do not have this problem because they are likely to support having separate pages for data and text, which would nullify the size increase caused in the bare metal case.

The `$gp` register must be set up by early initialisation code in bare metal environments and does not need to be set up in every function. 
