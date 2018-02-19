# Sections

## The small data area

The small data area is a region of 2MiB starting at the Global Pointer (GP) which contains the small data sections and the GOT, in the following order:

* `.got`: relocated address entries; in 2MiB positive range of GP.
* `.ssdata`: initialized data of type byte, short, float, and double; in 256KiB positive range of GP.
* `.ssbss`: zero-initialized data of type byte, short, float, and double; in 256KiB positive range of GP.
* `.sdata`: initialized data of type word and, only for 64-bit, dword; in 2MiB positive range of GP.
* `.sbss`: zero-initialized data of type word and, only for 64-bit, dword; in 2MiB positive range of GP.
