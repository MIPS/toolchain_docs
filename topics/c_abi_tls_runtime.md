# TLS Runtime Handling

The runtime TLS layout has been redesigned to take advantage of the unsigned
offset `LW[U12]` nanoMIPS instruction, thus extending the possible range of
symbols inside the TLS block.

This means that the implicit offsets of 0x7000 for the TP and 0x8000 for the
DTV pointers have been removed. The TP now points to the end of the TCB and
the DTV pointers to the start of their TLS blocks.

Note that the nanoMIPS TLS ABI is based on Variant 1 from Ulrich Drepper's
"ELF Handling for Thread-Local Storage" paper.
