# UNALIGNED_INSTR_SUPPORT

| Values | Default value |
|--------|---------------|
| 0 or 1 | 0 (disabled) for MIPSR6 and MIPS1 |
|        | 1 (enabled) for all other MIPS cores(R2-R5) and nanoMIPS |

## Description

This indicates whether the ISA contains instructions for unaligned memory
access. In the absence of such instructions, copies from unaligned addresses
requires the hardware to support [unaligned access][HW_UNALIGNED_SUPPORT],
as in the case of some MIPS32r6 and MIPS64r6 cores or support the
[ALIGN instruction][ISA_HAS_ALIGN], as in the case of nanoMIPS. For
cores/ISAs that have neither feature, memcpy falls back to copying each
word byte-by-byte.
