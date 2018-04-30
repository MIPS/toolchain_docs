# Relocations

The following relocations are only used in the automatic model:

* `%got_page`, `%got_ofst`: together they tell the linker that this is a data
access (either a load or a store); these are fake relocations and their only
purpose is to enable the linker to perform relaxations
* `%got_call`: tells the linker that the address being loaded is a text
address which will be used to call a function
* `R_NANOMIPS_JALR16, R_NANOMIPS_JALR32`: tells the linker that it can relax
this JALRC16 or JALRC32 to a BALC, if the symbol is non-pre-emptible.
	
The following relocations are used in both the automatic and the medium code
model:

* `%got_disp`: 21-bit (19-bit scaled) GOT displacement pointing to the
symbol's GOT entry

The following relocations are only used in the large code model:

* `%gprel_hi`: 20-bit high part of a 32-bit GP displacement
* `%gprel_lo`: 12-bit low part of a 32-bit GP displacement
* `%got_pcrel32`: 32-bit PC displacement pointing to the symbol's GOT entry
* `%got_pcrel_hi`: 20-bit high part of a 32-bit PC displacement pointing to
the symbol's GOT entry
* `%got_lo`: 12-bit low part of the address of the symbol's GOT entry.

The following relocations are used in all models:

* `%gprel`: 18 or 21-bit GP displacement for auto and medium, and 32-bit GP
displacement for large
* `%pcrel_hi`: 20-bit high part of a 32-bit PC displacement
* `%lo`: 12-bit low part of a 32-bit address

`%got_pcrel32` can only be used when targeting the full nanoMIPS ISA.

`%lo` is used in both absolute and PC-relative addressing because the upper
part of the address will always end up at a 4KiB boundary.

`%got_call` is different from `%call16` (found in other MIPS ABIs) in that
`%call16` is used to indicate where a lazy evaluation stub can be introduced,
while `%got_call` only indicates that the address being loaded is a text
address and is subsequently used to call a function.
