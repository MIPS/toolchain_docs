# nanoMIPS ABI flags

ABI flags is a MIPS specific structure encapsulated in the `.MIPS.abiflags`
section. The structure for nanoMIPS is identical to MIPS, except that it is
created within a section named `.nanoMIPS.abiflags`. Most of the fields for
nanoMIPS take identical values and meanings as MIPS. The exceptions are the
processor specific ISA extensions and the Application Specific Extension
(ASE) flags.

## ABIFlags structure

| Field Name   | Type	      | Comments                   |
|--------------|----------------|----------------------------|
| `version`    | unsigned short | Version of flags structure |
| `isa_level`  | unsigned char  | Level of the ISA: 32, 64   |
| `isa_rev`    | unsigned char  | Revision of the ISA: 6-n   |
| `gpr_size`   | unsigned char  | Size of general purpose registers |
| `cpr1_size`  | unsigned char  | Size of co-processor 1 registers |
| `cpr2_size`  | unsigned char  | Size of co-processor 2 registers |
| `fp_abi`     | unsigned char  | Floating-point ABI |
| `isa_ext`    | unsigned long  | Processor specific extension |
| `ases`       | unsigned long  | Mask of ASEs used |
| `flags1`     | unsigned long  | Mask of general flags |
| `flags2`     | unsigned long  | Mask of general flags |

### Values for the `xxx_size` bytes of an ABI flags structure

| Name           | Value | Description |
|----------------|------:|-------------|
| `AFL_REG_NONE` | 0x00  | No registers |
| `AFL_REG_32`   | 0x01  | 32-bit registers |
| `AFL_REG_64`   | 0x02  | 64-bit registers |
| `AFL_REG_128`  | 0x03  | 128-bit registers |

### Values for the ASEs field of an ABI flags structure

| Name                     | Value      | Description |
|--------------------------|-----------:|-------------|
| `NANOMIPS_ASE_TLB`       | 0x00000001 | TLB control |
| `NANOMIPS_ASE_EVA`       | 0x00000004 | Enhanced VA Scheme |
| `NANOMIPS_ASE_MCU`       | 0x00000008 | MCU (MicroController) extension |
| `NANOMIPS_ASE_MT`        | 0x00000040 | Multi-threading extension |
| `NANOMIPS_ASE_VIRT`      | 0x00000100 | Virtualization extension |
| `NANOMIPS_ASE_MSA`       | 0x00000200 | MSA extension |
| `NANOMIPS_ASE_RESERVED1` | 0x00000400 | was MIPS16 ASE |
| `NANOMIPS_ASE_RESERVED2` | 0x00000800 | was MICROMIPS ASE |
| `NANOMIPS_ASE_DSPR3`     | 0x00002000 | DSP R3 extension |
| `NANOMIPS_ASE_CRC`       | 0x00008000 | Cyclic Redundancy Check extension |
| `NANOMIPS_ASE_GINV`      | 0x00020000 | Global INValidate extension |
| `NANOMIPS_ASE_xNMS`      | 0x00040000 | Full base ISA, not the nanoMIPS subset |

### Values for the floating-point ABI field of the ABI flags structure

| Name (Value)                         | Description |
|:-------------------------------------|-------------|
| `Val_GNU_NANOMIPS_ABI_FP_ANY` (0)    | Not specified  |
| `Val_GNU_NANOMIPS_ABI_FP_DOUBLE` (1) | Double-precision hard float |
| `Val_GNU_NANOMIPS_ABI_FP_SINGLE` (2) | Single-precision hard float |
| `Val_GNU_NANOMIPS_ABI_FP_SOFT` (3)   | Soft float |
