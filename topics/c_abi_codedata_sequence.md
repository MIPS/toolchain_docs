# List of code sequences

The following tables list all of the code sequences used for all possible
combinations of code model and addressing mode. There are a few sequences
which can be generated only by either a compiler or a linker. A compiler is
responsible for the bulk of the generation, while a linker adjusts existing
sequences by relaxing or expanding them. Each sequence has a set of conditions
which need to be fulfilled in order for it to be chosen by a compiler or
linker. The sequences are in ascending order according to code size.

**Table terminology**

*non-pre*: Short for non-pre-emptible symbol.

*pre*: Short for pre-emptible symbol.

*A, M, L*: Abbreviations for the automatic, medium, and large model,
respectively. These apply only to compiler-generated sequences.

*NMS*: This is the abbreviation used for the nanoMIPS subset, which excludes
some instructions from the ISA for power efficiency reasons.

*NMF*: This is the abbreviation used for the full nanoMIPS ISA. This is used
to contrast against NMS.

*insn32 mode*: When enabled, the generation of 16-bit and 48-bit instructions
is forbidden. This is not equivalent to NMS or NMF, since both of them contain
instructions which are not 32-bit.

*\[ls]X*: The "\[ls]" means that this instruction can be either a load or a
store. The "X" stands for all the supported suffixes (H, B, W, D, WC1, DC1 for
both loads and stores, and HU, BU, WU for loads-only).

## Address calculation operation

|Category | Model | Conditions | Code sequence | Size | Remarks|
|---------|-------|------------|----|----|----|
|**Absolute addressing** ||||||
|non-pre  | AML   | 4KiB-aligned                            | `lui reg, %hi(symbol)`                 | 4 | Must be used only for symbols which are explicitly 4KiB-aligned.|
|non-pre  | A     | NMS-only, >=2B-aligned, within PC+-1MiB | `lapc.h reg, symbol`                   | 4 | Must be used only instead of LUI %hi + ORI %lo.|
|non-pre  | AML   | NMF-only                                | `li reg, symbol`                       | 6 | Uses LI\[48].|
|non-pre  | AML   |                                         | `lui reg, %hi(symbol) ori reg, reg, %lo(symbol)` | 8 |  |
|**PC-relative addressing** ||||||
|non-pre  | AML   | 4KiB-aligned                            | `aluipc reg, %pcrel_hi(symbol)`        | 4 | Must be used only for symbols which are explicitly 4KiB-aligned.|
|non-pre  | A     | >=2B-aligned, within PC+-1MiB           | `lapc.h reg, symbol`                   | 4 |   |
|non-pre  | AML   | NMF-only                                | `lapc.b reg, symbol`                   | 6 |   |
|non-pre  | AML   |                                         | `aluipc reg, %pcrel_hi(symbol) ori reg, reg, %lo(symbol)` | 8 |   |
|**GP-relative addressing** ||||||
|non-pre  | AM    | <=2B-aligned, within GP+256KiB          | `addiu.b reg, $gp, %gprel(symbol)`     | 4 |   |
|non-pre  | AM    | >=4B-aligned, within GP+2MiB            | `addiu.w reg, $gp, %gprel(symbol)`     | 4 |   |
|non-pre  | L     | NMF-only                                | `addiu.b32 reg, $gp, %gprel(symbol)`   | 6 |   |
|non-pre  | L     |                                         | `lui reg, %gprel_hi(symbol) ori reg, reg, %gprel_lo(symbol) addu reg, reg, $gp` | 12 |   |
|**GOT-dependent addressing** ||||||
|non-pre  |       | within GP+2MiB, refcount>=2, -Os        | `lw reg, %got_disp(symbol)($gp)`       | 4+4 data | Generated only by a linker.| 
|pre      | AM    |                                         | `lw reg, %got_disp(symbol)($gp)`       | 4+4 data  |   |
|pre      | L     | NMF-only                                | `lwpc reg, %got_pcrel32(symbol`)       | 6+4 |   |
|pre      | L     |                                         | `aluipc reg, %got_pcrel_hi(symbol) lw reg, %got_lo(symbol)(reg)` | 8+4 |   |

## Data access operation

|Category | Model | Conditions                                           | Code sequence | Size | Remarks|
|---------|-------|------------------------------------------------------|---------------|------|--------|
|**Absolute addressing** ||||||
|non-pre  | AML   | 4KiB-aligned                                         | `lui reg1, %hi(symbol)  [ls]X reg2, 0(reg1)` | 6/8 | Must be used only for symbols which are explicitly 4KiB-aligned. Uses LW\[16]/SW\[16] if the registers happen to be GPR3.|
|non-pre  | AML   |                                                      | `lui reg1, %hi(symbol)  [ls]X reg2, %lo(symbol)(reg1)` | 8 | |
|**PC-relative addressing** ||||||
|non-pre  | AML   | NMF-only, word-sized symbol                          | `[ls]wpc reg2, symbol` | 6 | |
|non-pre  |       | >=2B-aligned, within PC+1MiB, reg1 and reg2 are GPR3 | `lapc.h reg1, symbol  [ls]X reg2, 0(reg1)` | 6 | Generated only by the linker.|
|non-pre  | AML   | 4KiB-aligned                                         | `aluipc reg1, %pcrel_hi(symbol)  [ls]X reg2, 0(reg1)` | 6/8 |  Must be used only for symbols which are explicitly 4KiB-aligned. Uses LW\[16]/SW\[16] if the registers happen to be GPR3.|
|non-pre  | AML   |                                                      | `aluipc reg1, %pcrel_hi(symbol)  [ls]X reg2, %lo(symbol)(reg1)` | 8 | |
|**GP-relative addressing** ||||||
|non-pre  | AM    | byte/half-sized symbol, within GP+256KiB             | `[ls][bh] reg2, %gprel(symbol)($gp)` | 4 | |
|non-pre  | AM    | word-sized symbol, within GP+2MiB                    | `[ls]w reg2, %gprel(symbol)($gp)` | 2/4 | Uses LW\[GP16]/SW\[GP16] if the register happens to be GPR3.|
|non-pre  | L     | NMF-only                                             | `addiu.b32 reg1, $gp, %gprel(symbol)  [ls]X reg2, 0(reg1)` | 8/10 | Uses LW\[16]/SW\[16] if the registers happen to be GPR3.|
|non-pre  | L     |                                                      | `lui reg1, %gprel_hi(symbol)  addu reg1, reg1, $gp  [ls]X reg2, %gprel_lo(symbol)(reg)` | 12 | |
|**GOT-dependent addressing** ||||||
|pre      | A     |                                                      | `lw reg1, %got_page(symbol)($gp)  [ls]X reg2, %got_ofst(symbol)(reg1)` | 8+4 data | Generated only by the compiler. The linker has to transform this into one of the other pre-emptible sequences or relax it into a non-pre-emptible sequence.|
|pre      | M     |                                                      | `lw reg1, %got_disp(symbol)($gp)  [ls]X reg2, 0(reg1)` | 6/8+4 data | Uses LW\[16]/SW\[16] if the registers happen to be GPR3.|
|pre      | L     | NMF-only                                             | `lwpc reg1, %got_pcrel32(symbol)  [ls]X reg2, 0(reg1)` | 8/10+4 data | Uses LW\[16]/SW\[16] if the registers happen to be GPR3.|
|pre      | L     |                                                      | `aluipc reg1, %got_pcrel_hi(symbol)  lw reg1, %got_lo(symbol)(reg1)  [ls]X reg2, 0(reg1)` | 10/12+4 data | Uses LW\[16]/SW\[16] if the registers happen to be GPR3.|

## Function call operation

|Category | Model | Conditions                       | Code sequence | Size | Remarks|
|---------|-------|----------------------------------|----|----|----|
|**Absolute addressing** ||||||
|non-pre  | AM    | within PC+-32MiB                 | `balc symbol` | 2/4 | |
|non-pre  | L     | NMF-only                         | `li reg, symbol  jalrc $31, reg` |  8 | Will always use JALRC\[16] because it will be skipped altogether in insn32 mode, as it is using LI\[48]. |
|non-pre  | L     |                                  | `lui reg, %hi(symbol) ori reg, reg, %lo(symbol) jalrc $31, reg` | 10/12 | Uses JALRC\[32] in insn32 mode and JALRC\[16] otherwise. |
|**PC-relative addressing** ||||||
|non-pre  | AM    | within PC+-32MiB                 | `balc symbol` | 2/4 | |
|non-pre  | L     | NMF-only | `lapc.b reg, symbol jalrc $31, reg` |  8  | Will always use JALRC\[16] because it will be skipped altogether in insn32 mode, as it is using LAPC.B, which is an alias for ADDIUPC\[48]. |
|non-pre  | L     |                                  | `aluipc reg, %pcrel_hi(symbol) ori reg, reg, %lo(symbol) jalrc $31, reg`  | 10/12 | Uses JALRC\[32] in insn32 mode and JALRC\[16] otherwise.|
|**GOT-dependent addressing** ||||||
|non-pre  |       | within GP+2MiB, refcount>=2, -Os | `lw reg, %got_disp(symbol)($gp) jalrc $31, reg` |  6/8+4 data | Generated only by the linker. Uses JALRC\[32] in insn32 mode and JALRC\[16] otherwise. |
|pre      | A     |                                  | `lw reg, %got_call(symbol)($gp) jalrc   $31, reg : R_NANOMIPS_JALR symbol` | 6/8+4 data | Generated only by the compiler. The linker has to transform this into one of the other pre-emptible sequences or relax it into a non-pre-emptible sequence. Uses JALRC\[32] in insn32 mode and JALRC\[16] otherwise. |
|pre      | M     |                                  | `lw reg, %got_disp(symbol)($gp) jalrc $31, reg` |  6/8+4 data | Uses JALRC\[32] in insn32 mode and JALRC\[16] otherwise.|
|pre      | L     | NMF-only                         | `lwpc reg, %got_pcrel32(symbol) jalrc $31, reg` | 8+4 data | Will always use JALRC\[16] because it will be skipped altogether for insn32 mode, as it is using LWPC, which is 48 bits long.|
|pre      | L     |                                  | `aluipc reg, %got_pcrel_hi(symbol) lw reg, %got_lo(symbol)(reg) jalrc $31, reg` |  10/12+4 data | Uses JALRC\[32] in insn32 mode and JALRC\[16] otherwise.|

