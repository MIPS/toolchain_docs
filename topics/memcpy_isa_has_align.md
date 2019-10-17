# ISA_HAS_ALIGN

| Values | Default value |
|--------|---------------|
| 0 or 1 | 1 (enabled) for nanoMIPS, can be enabled for R6 |
|        | 0 (disabled) for everything else |

## Description

This indicates whether the ISA supports an ALIGN or EXTW instruction.
Such an instruction can be used to extract an unaligned word from
the two adjacent aligned words which it spans. This is an alternative
method for cores that support [unaligned access in hardware][HW_UNALIGNED_SUPPORT]
or for ISAs that support [unaligned load or store instructions][UNALIGNED_INSTR_SUPPORT].

Currently this instruction is only supported for MIPS32r6, MIPS64r6 and nanoMIPS.
Where present, it can boost performance for unaligned copies as compared to
the other alternatives above, especially for large sized blocks.
