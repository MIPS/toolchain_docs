# Assembly code compatibility with previous MIPS ABIs

The `.cpadd`, `.cpreturn` and `.cprestore` assembler directives are ignored
for nanoMIPS. The `.cpsetup` and `.cpload` directives have been kept, but they
are now used only for generating the `$gp` setup instruction. `.cpsetup` is
preferred over `.cpload`, which has been kept only for the sake of
compatibility.

The following relocation operands from previous MIPS ABIs have been repurposed
for nanoMIPS:

* `%got_page`, `%got_ofst`: are now fake relocations which enable the linker
to perform relaxations
* `%got_disp`: is now 21 bits (19-bits scaled) instead of 16 bits
* `%got`: is now treated in the same way as `%got_disp`; this means that
adding `%lo` to a `%got` will corrupt the address being calculated
* `%hi`, `%lo`: are now 20 and 12 bits, respectively
