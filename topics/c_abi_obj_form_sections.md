# Sections

## Section types

| Name                    | Value      |
|-------------------------|-----------:|
| `SHT_NANOMIPS_ABIFLAGS` | 0x70000000 |

`SHT_NANOMIPS_ABIFLAGS`
: The type of the section for the nanoMIPS specific ABI flags structure.


## Special sections

### These section names are specific to nanoMIPS:

| Name                | Type                    | Attributes              |
|---------------------|-------------------------|-------------------------|
|`.ssdata`            | `SHT_PROGBITS`          | `SHF_ALLOC + SHF_WRITE` |
|`.ssbss`             | `SHT_NOBITS`            | `SHF_ALLOC + SHF_WRITE` |
|`.nanoMIPS.abiflags` | `SHT_NANOMIPS_ABIFLAGS` | `SHF_ALLOC`             |

`.nanoMIPS.abiflags`
: This section contains the nanoMIPS specific ABI flags structure.

`.ssdata`
: This section holds initialized data of type byte, short, float, and double
that contribute to the program's memory image. It must be placed within 256KiB
positive range of the Global Pointer (GP).

`.ssbss`
: This section holds uninitialized data of type byte, short, float, and
double. It must be placed within 256KiB positive range of GP. By definition,
the system initializes the data with zeros when the program begins to run. The
section occupies no file space, as indicated by the section type,
`SHT_NOBITS`.

### The meaning of these section names from gABI is specialized for nanoMIPS:

| Name    | Type           | Attributes              |
|---------|----------------|-------------------------|
|`.sdata` | `SHT_PROGBITS` | `SHF_ALLOC + SHF_WRITE` |
|`.sbss`  | `SHT_NOBITS`   | `SHF_ALLOC + SHF_WRITE` |
|`.got`   | `SHT_PROGBITS` | `SHF_ALLOC` |


`.sdata`
: This section holds initialized data of type word and, only for 64-bit,
double-word that contribute to the program's memory image. It must be placed
within 2MiB positive range of GP.

`.sbss`
: This section holds uninitialized data of type word and, only for 64-bit,
double-word. It must be placed within 2MiB positive range of GP. By
definition, the system initializes the data with zeros when the program begins
to run. The section occupies no file space, as indicated by the section type,
`SHT_NOBITS`.

`.got`
: This section holds the global offset table consising of relocated address
entries. It must be placed in positive range of GP.

## The small data area

The small data area is a region of 2MiB starting at the Global Pointer (GP)
which contains the small data sections and the GOT. These sections may be
placed in any order, as long as the placement constraints of each individual
section are satisfied. The recommended ordering to best exploit GP-relative
addressing capabilities, is as follows:

GP =>
: `.got`
: `.ssdata`
: `.ssbss`
: `.sdata`
: `.sbss`
