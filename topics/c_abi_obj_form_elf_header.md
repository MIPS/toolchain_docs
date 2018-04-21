# ELF header

This section covers nanoMIPS specific variations in the header fields. The
remaining fields take the usual values and meanings from the gABI
specification.

## ELF machine, e_machine

| Name | Value |
|----------|---------|
| EM_NANOMIPS | 249 |

## Processor specific flags, e_flags

| Name                  | Mask       | Description                  |
|-----------------------|-----------:|------------------------------|
| EF_NANOMIPS_LINKRELAX | 0x00000001 | Control link-time relaxation |
| EF_NANOMIPS_PIC       | 0x00000002 | Position independent code    |
| EF_NANOMIPS_32BITMODE | 0x00000004 | Indicates 32-bit object for 64-bit architecture |
| EF_NANOMIPS_PID       | 0x00000008 | Position independent data    |
| EF_NANOMIPS_PCREL     | 0x00000010 | PC-relative mode, trivially position independent |
| EF_NANOMIPS_ABI       | 0x0000F000 | nanoMIPS ABI |
| EF_NANOMIPS_MACH      | 0x00FF0000 | Machine variant |
| EF_NANOMIPS_ARCH      | 0xF0000000 | nanoMIPS architecture  |

### nanoMIPS ABI bits, EF_NANOMIPS_ABI

| Name                  | Value | Description         |
|-----------------------|------:|---------------------|
| E_NANOMIPS_ABI_P32    | 1     | 32-bit nanoMIPS ABI |
| E_NANOMIPS_ABI_P64    | 2     | 64-bit nanoMIPS ABI |

### nanoMIPS architecture bits, EF_NANOMIPS_ARCH

| Name                  | Value | Description         |
|-----------------------|------:|---------------------|
| E_NANOMIPS_ARCH_32R6  | 0     | 32-bit nanoMIPS Release 6 ISA |
| E_NANOMIPS_ARCH_64R6  | 1     | 64-bit nanoMIPS Release 6 ISA |

## Section types

| Name                  | Value      |
|-----------------------|-----------:|
| SHT_NANOMIPS_ABIFLAGS | 0x70000000 |

## Program header types

| Name                 | Value      |
|----------------------|-----------:|
| PT_NANOMIPS_ABIFLAGS | 0x70000000 |
