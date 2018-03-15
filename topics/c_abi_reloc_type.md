# Relocation Types

## Relocation Operands

S - The absolute address of the symbol from the RELA record
A - The 32-bit addend from the RELA record
P - The PC that the reloc is being applied to
G - The value of `\_gp`

## Relocation Operators 

Each of the relocation operators supported by the nanoMIPS ABI is shown below along with the ELF reloc number, the operation to calculate the value and the method of encoding the value in an instruction. 

| Relocation (Value)        | Operation | Bit encoding |
|---------------------------|-----------|--------------|
| R_NANOMIPS_PC21_S1 (14)   | offset = (S + A - (P + 4)) is_signed_value (offset, nbits = 22)  is_aligned(offset, 2) | op\[0] = offset\[21] op\[20:1] = offset\[20:1] |
| R_NANOMIPS_GOTPC_I32 (34) | offset = (GOT(S + A) - (P + 4)) is_signed_value (offset, nbits = 32) | op\[31:0] = offset\[31:0] |
| R_NANOMIPS_GOT_DISP (33)  | offset = (GOT(S + A) - G) is_unsigned_value (offset, nbits = 21) is_aligned(offset, 4) | op\[20:2] = offset\[20:2] |
| R_NANOMIPS_GOT_CALL (37)  | offset = (GOT(S + A) - G) is_unsigned_value (offset, nbits = 21) is_aligned(offset, 4) | op\[20:2] = offset\[20:2] |
| R_NANOMIPS_GOT_PAGE (38)  | expand to got slot for S + A | none |
| R_NANOMIPS_GPREL19_S2 (20)| offset = (S + A - G) is_unsigned_value (offset, nbits = 21) is_aligned(offset, 4) | op\[20:2] = offset\[20:2] |
| R_NANOMIPS_GPREL7_S2 (25) | offset = (S + A - G) is_unsigned_value (offset, nbits = 9)) is_aligned(offset, 4) | op\[6:0] = offset\[8:2] |
| R_NANOMIPS_GPREL_HI20 (26)| offset = (S + A - G) | op\[0] = offset\[31] op\[11:2] = offset\[30:21] op\[20:12] = offset\[20:12] |
| R_NANOMIPS_HI20 (28)      | offset = S + A | op\[0] = offset\[31] op\[11:2] = offset\[30:21] op\[20:12] = offset\[20:12] |
| R_NANOMIPS_I32 (32)       | address = S + A is_signed_value (address, nbits = 32) |op\[31:0] = address\[31:0] |
| R_NANOMIPS_GPREL17_S1 (23)| offset = (S + A - G) is_unsigned_value (offset, nbits = 18) is_aligned(offset, 2) | op\[17:1] = offset\[17:1] |
| R_NANOMIPS_GPREL16_S2 (24)| offset = (S + A - G) is_unsigned_value (offset, nbits = 18) is_aligned(offset, 4) | op\[17:2] = offset\[17:2]  |
| R_NANOMIPS_GPREL18_S3 (21)| offset = (S + A - G)  is_unsigned_value (offset, nbits = 22) is_aligned(offset, 8)  | op\[20:3] = offset\[20:3] |
| R_NANOMIPS_GPREL18 (22)   | offset = (S + A - G) is_unsigned_value (offset, nbits = 18) | op\[17:0] = offset\[17:0] |
| R_NANOMIPS_GOT_OFST (39)  | expand to got slot for S + A | none |
| R_NANOMIPS_LO12 (29)      | offset = S + A | op\[11:0] = offset\[11:0] |
| R_NANOMIPS_GOT_LO12 (36)  | offset = GOT(S + A) | op\[11:0] = offset\[11:0]  |
| R_NANOMIPS_PC7_S1 (18)    | offset = (S + A - (P + 2)) is_signed_value (offset, nbits = 8) is_aligned(offset, 2) | op\[0] = offset\[7] op\[6:1] = target\[6:1]  |
| R_NANOMIPS_PC11_S1 (16)   | offset = (S + A - (P + 4)) is_signed_value (offset, nbits = 12) is_aligned(offset, 2) | op\[0] = offset\[11] op\[10:1] = offset\[10:1]  |
| R_NANOMIPS_PC4_S1 (19)    | offset = (S + A - (P + 2)) is_unsigned_value (offset, nbits = 5) is_aligned(offset, 2) | op\[3:0] = offset\[3:0] |
| R_NANOMIPS_PC14_S1 (15)   | offset = (S + A - (P + 4)) is_signed_value (offset, nbits = 15) is_aligned(offset, 2) | op\[0] = offset\[14] op\[13:1] = offset\[13:1] |
| R_NANOMIPS_PC25_S1 (13)   | offset = (S + A - (P + 4)) is_signed_value (offset, nbits = 26) is_aligned(offset, 2) | op\[0] = offset\[25] op\[24:1] = offset\[24:1] |
| R_NANOMIPS_PC10_S1 (17)   | offset = (S + A - (P + 2)) is_signed_value (offset, nbits = 11) is_aligned(offset, 2) | op\[0] = offset\[10] op\[9:1] = offset\[9:1] |
| R_NANOMIPS_PC_HI20 (27)   | offset = (S + A) - ((P + 4) & ~0xfff) | op\[0] = offset\[31] op\[11:2] = offset\[30:21] op\[20:12] = offset\[20:12] |
| R_NANOMIPS_GOTPC_HI20 (35)| offset = GOT(S + A) - ((P + 4) & ~0xfff) | op\[0] = offset\[31] op\[11:2] = offset\[30:21] op\[20:12] = offset\[20:12] |
| R_NANOMIPS_PC_I32 (31)    | offset = (S + A) - (P + 4) is_signed_value (offset, nbits = 32) | op\[31:0] = offset\[31:0] |
| R_NANOMIPS_GPREL_I32 (30) | offset = (S + A - G) | op\[31:0] = offset\[31:0] |
| R_NANOMIPS_GPREL_LO12 (42)| address = (symval + addend) - section->output_offset |   |

The set of instructions compatible with each relocation operator is shown below along with example usage.

| Relocation            | Instructions           | Usage       |
|-----------------------|------------------------|-------------|
| R_NANOMIPS_PC21_S1    | MOVE.BALC ADDIUPC\[32] | MOVE.BALC reg, reg, symbol Note: This is for both branches and data reference. |
| R_NANOMIPS_GOTPC_I32  | LWPC\[48]              | LWPC reg, %got_pcrel32(symbol) |
| R_NANOMIPS_GOT_DISP   | LWGP, LDGP             | LW reg, %got_disp(symbol)(gp) |
| R_NANOMIPS_GOT_CALL   | LWGP, LDGP             | LW reg, %got_call(symbol)(gp) |
| R_NANOMIPS_GOT_PAGE   | LWGP, LDGP             | LW reg,%got_page(symbol)(gp) |
| R_NANOMIPS_GPREL19_S2 | LW\[GP], SW\[GP]       | LW reg, %gprel(symbol)(gp) |
| R_NANOMIPS_GPREL7_S2  | LW\[GP16], SW\[GP16]   | LW16 reg, %gprel(symbol)(gp) |
| R_NANOMIPS_GPREL_HI20 | LUI	                 | LUI reg, %gprel_hi(symbol) |
| R_NANOMIPS_HI20       | LUI                    | LUI reg, %hi(symbol) |
| R_NANOMIPS_I32        | LI\[48]                | LI reg, symbol |
| R_NANOMIPS_GPREL17_S1 | LH\[GP], LHU\[GP], SH\[GP] | LH reg, %gprel(symbol)(gp) |
| R_NANOMIPS_GPREL16_S2 | LDC1\[GP], LWC1\[GP], SDC1\[GP], SWC1\[GP], LWU\[GP] | LHU reg, %gprel(symbol)(gp) |
| R_NANOMIPS_GPREL18_S3 | LD\[GP], SD\[GP]       | LD reg, %gprel(symbol)(gp) |
| R_NANOMIPS_GPREL18    | LB\[GP], LBU\[GP], SB\[GP], ADDIU\[GP.B] | LB reg, %gprel(symbol)(gp) |
| R_NANOMIPS_GOT_OFST   | LB, LBU, LD, LH, LHU, LW, LWU, SB, SD, SH, SW, LDC1, LWC1, SDC1, SWC1 | LW reg, %got_ofst(symbol)(reg) |
| R_NANOMIPS_LO12       | LB, LBU, LD, LH, LHU, LW, LWU, SB, SD, SH, SW, LDC1, LWC1, SDC1, SWC1, ORI, ADDIU | ORI reg, reg, %lo(symbol) Notes: Do not use with ADDIU from compiled code, use ORI for power efficiency. ADDIU may be necessary for compatible ASM code with pre-nanoMIPS. |
| R_NANOMIPS_GOT_LO12   | LB, LBU, LD, LH, LHU, LW, LWU, SB, SD, SH, SW, LDC1, LWC1, SDC1, SWC1, ORI | ORI reg, reg, %got_lo(symbol) |
| R_NANOMIPS_PC7_S1     | BEQZC16, BNEZC16       | BEQZC16 reg, symbol |
| R_NANOMIPS_PC11_S1    | BEQIC, BGEIC, BGEUIC,BNEIC, BLTIC, BLTUIC | BEQIC reg, imm, symbol |
| R_NANOMIPS_PC4_S1     | BEQC16, BNEC16 (forward branch) | BEQC16 reg, reg, symbol |
| R_NANOMIPS_PC14_S1    | BC2EQZC, BC2NEZC, BC1EQZC, BC1NEZC, BEQC, BGEC, BGEUC, BNEC, BLTC, BLTUC | BEQC reg, reg, symbol |
| R_NANOMIPS_PC25_S1    | BALC, BC               | BC symbol|
| R_NANOMIPS_PC10_S1    | BALC16, BC16           | BC16 symbol |
| R_NANOMIPS_PC_HI20    | ALUIPC                 | ALUIPC reg, %pcrel_hi(symbol) |
| R_NANOMIPS_GOTPC_HI20 | ALUIPC                 | ALUIPC reg, %got_pcrel_hi(symbol) |
| R_NANOMIPS_PC_I32     | ADDIUPC\[48]           | ADDIUPC reg, %pcrel32(symbol) |
| R_NANOMIPS_GPREL_I32  | ADDIU\[GP48]           | ADDIU.B32 reg, %gprel(symbol) |
| R_NANOMIPS_GPREL_LO12 |                        |                                 |

## Data Relocations

| Relocation (Value)                  | Operation                  | Bit encoding              |
|-------------------------------------|----------------------------|---------------------------|
| R_NANOMIPS_32 / R_NANOMIPS_WORD (1) | S + A                      | => target\[31:0]          |
| R_NANOMIPS_64 / R_NANOMIPS_DWORD (2)| S + A                      | => target\[63:0]          |
| R_NANOMIPS_NEG (3)                  | -S + A                     | => target\[ABI_WIDTH]     | 
| R_NANOMIPS_ASHIFTR_1 (4)            | sign_extend ((S + A) >> 1) | => target\[ABI_WIDTH]     | 
| R_NANOMIPS_UNSIGNED_8 (5)           | S + A                      | => target\[7:0]           | 
| R_NANOMIPS_SIGNED_8 (6)             | S + A                      | => target\[7:0]           | 
| R_NANOMIPS_UNSIGNED_16 (7)          | S + A                      | => target\[15:0]          | 
| R_NANOMIPS_SIGNED_16 (8)            | S + A                      | => target\[15:0]          | 
| R_NANOMIPS_RELATIVE (9)             | => target\[ABI_WIDTH]      | (Explicit GOT relocation) | 
| R_NANOMIPS_GLOBAL (10)              | => target\[ABI_WIDTH]      | (Explicit GOT relocation) | 
| R_NANOMIPS_JUMP_SLOT (11)           | => target\[ABI_WIDTH]      | (Explicit GOT relocation) | 
| R_NANOMIPS_IRELATIVE (12)           | => target\[ABI_WIDTH]      | | 

## Place-holder Relocations for Linker Relaxations

| Relocation (Value)          | Symbol encoding (value) | Description |
|-----------------------------|-------------------------|-------------|
| R_NANOMIPS_ALIGN (64)       | alignment  | Requested alignment |
| R_NANOMIPS_FILL (65)        | fill-value | Fill value, 8/16/32 bits is encoded in symbol size. |
| R_NANOMIPS_MAX (66)         | max-fill   | |
| R_NANOMIPS_INSN32 (67)      | none       | Inhibit relaxation to 16-bits, out-of-range expansion is possible. |
| R_NANOMIPS_FIXED (68)       | none       | No relaxation or expansion at this instruction.  |
| R_NANOMIPS_NORELAX (69)     | none       | Inhibit relaxation/expansion until subsequent RELAX relocation  |
| R_NANOMIPS_RELAX (70)       | none       | Activate relaxation/expansion until subsequent NORELAX relocation |
| R_NANOMIPS_SAVERESTORE (71) | none       | Placeholder relocation for 32-bit save/restore instructions with GP-bit in PIC mode. |
| R_NANOMIPS_INSN16 (72)      | none       | Inhibit relaxation to 32-bits. |
| R_NANOMIPS_JALR32 (73)      | none       | Hint for a 32-bit jump-and-link instruction to allow it to be relaxed for locally resolved symbols to an unconditional branch. |
| R_NANOMIPS_JALR16 (74)      | none       | Hint for a 16-bit jump-and-link instruction to allow it to be relaxed for locally resolved symbols to an unconditional branch. |
