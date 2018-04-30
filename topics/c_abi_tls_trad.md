# List of traditional TLS code sequences

## Global Dynamic

| Model | Conditions | Code sequence | Size | Static relocations | Dynamic relocations | Remarks |
|-------|------------|---------------|------|--------------------|---------------------|---------|
| AM | within GP+2MiB | `addiu.w $a0, $gp, %tlsgd(symbol); <call to __tls_get_addr>` | 4 | R_NANOMIPS_TLS_GD symbol | GOT\[n]: R_NANOMIPS_TLS_DTPMOD symbol; GOT\[n+1]: R_NANOMIPS_TLS_DTPREL symbol | The address of the symbol will be returned in $a0 by \_\_tls_get_addr.|
| L  | | `addiu.b32 $a0, $gp, %tlsgd(symbol); <call to __tls_get_addr>` | 6 | R_NANOMIPS_TLS_GD_I32 symbol | GOT\[n]: R_NANOMIPS_TLS_DTPMOD symbol; GOT\[n+1]: R_NANOMIPS_TLS_DTPREL symbol | |

## Local Dynamic

| Model | Conditions | Code sequence | Size | Static relocations | Dynamic relocations | Remarks |
|-------|------------|---------------|------|--------------------|---------------------|---------|
|**TLS Block Address**|||||||
| AM | within GP+2MiB | `addiu.w $a0, $gp, %tlsld(symbol); <call to __tls_get_addr>` | 4 | R_NANOMIPS_TLS_LD symbol | GOT\[n]: R_NANOMIPS_TLS_DTPMOD symbol; GOT\[n+1]: 0 | The address of the symbol will be returned in $a0 by \_\_tls_get_addr.|
| L  | | `addiu.b32 $a0, $gp, %tlsld(symbol); <call to __tls_get_addr>` | 6 | R_NANOMIPS_TLS_LD_I32 symbol | GOT\[n]: R_NANOMIPS_TLS_DTPMOD symbol; GOT\[n+1]: 0 ||
|**Variable Address Calculation**|||||||
| AM | within DTP+64KiB | `addiu reg, reg_dtp, %dtprel(symbol)` | 4 | R_NANOMIPS_TLS_DTPREL16 symbol || reg_dtp is a GPR which contains the module address returned by \_\_tls_get_addr.|
| L  | | `li48 reg, %dtprel(symbol); addu reg, reg, reg_dtp` | 8/10 | R_NANOMIPS_TLS_DTPREL_I32 symbol |||
|**Variable Access**|||||||
| A  | within DTP+4KiB  | `[ls] reg, %dtprel(symbol)(reg_dtp)` | 4 | R_NANOMIPS_TLS_DTPREL12 symbol |||
| AM | within DTP+64KiB | `addiu reg1, reg_dtp, %dtprel(symbol); [ls] reg2, 0(reg1)` | 6/8 | R_NANOMIPS_TLS_DTPREL16 symbol |||
| L  | | `li48 reg, %dtprel(symbol); [ls]x reg2, reg1(reg_dtp)` | 10 | R_NANOMIPS_TLS_DTPREL_I32 symbol |||

## Initial Exec

| Model | Conditions | Code sequence | Size | Static relocations | Dynamic relocations | Remarks |
|-------|------------|---------------|------|--------------------|---------------------|---------|
|**TP Setup**|||||||
| AML | | `rdhwr reg_tp, $29` | 4 | | | The compiler will choose a GPR for reg_tp as it sees fit. As long as no kernel emulation is involved, it is preferable for the compiler to re-do the setup than to save/restore reg_tp from stack.|
|**Variable Address Calculation**|||||||
| AM | within GP+2MiB | `lw reg, %gottprel(symbol)($gp); addu reg, reg, reg_tp` | 6/8 | R_NANOMIPS_TLS_GOTTPREL symbol | GOT\[n]: R_NANOMIPS_TLS_TPREL symbol ||
| L  | | `lwpc reg, %gottprel_pc32(symbol); addu reg, reg, reg_tp` | 8/10 | R_NANOMIPS_TLS_GOTTPREL_ PC_I32 symbol | GOT\[n]: R_NANOMIPS_TLS_TPREL symbol ||
|**Variable Access**|||||||
| AM | within GP+2MiB | `lw reg1, %gottprel(symbol)($gp); [ls]x reg2, reg1(reg_tp)` | 8 | R_NANOMIPS_TLS_GOTTPREL symbol | GOT\[n]: R_NANOMIPS_TLS_TPREL symbol | reg_tp must be used as the base register to enable the linker to relax to a Local Exec sequence, if possible.|
| L  | | `lwpc reg1, %gottprel_pc32(symbol); [ls]x reg2, reg1(reg_tp)` | 10 | R_NANOMIPS_TLS_GOTTPREL_ PC_I32 symbol | GOT\[n]: R_NANOMIPS_TLS_TPREL symbol | reg_tp must be used as the base register to enable the linker to relax to a Local Exec sequence, if possible.|

## Local Exec

| Model | Conditions | Code sequence | Size | Static relocations | Dynamic relocations | Remarks |
|-------|------------|---------------|------|--------------------|---------------------|---------|
|**TP Setup**|||||||
| AML | | `rdhwr reg_tp, $29` | 4 | | | The compiler will choose a GPR for reg_tp as it sees fit. As long as no kernel emulation is involved, it is preferable for the compiler to re-do the setup than to save/restore reg_tp from stack.|
|**Variable Address Calculation**|||||||
| AM | within TP+64KiB | `addiu reg, reg_tp, %tprel(symbol)` | 4 | R_NANOMIPS_TLS_TPREL16 symbol |||
| | | `addiu[48] reg, reg_tp, %tprel(symbol)` | 6 | R_NANOMIPS_TLS_TPREL_I32 symbol || Generated only by the linker. When relaxing Global Dynamic to Local Exec, reg_tp will have to be set up for each sequence. Because we don't have to worry about preserving reg_tp in this case, the linker can relax to the source-destroying ADDIU\[48] instead of the LI\[48]+ADDU sequence for the large model. This is worth doing only for address calculations.|
| L  | | `li48 reg, %tprel(symbol); addu reg, reg, reg_tp` | 8/10 | R_NANOMIPS_TLS_TPREL_I32 symbol |||
|**Variable Access**|||||||
| A  | within TP+4KiB | `[ls] reg, %tprel(symbol)(reg_tp)` | 4 | R_NANOMIPS_TLS_TPREL12 symbol |||
| AM | within TP+64KiB | `addiu reg1, reg_tp, %tprel(symbol);[ls] reg2, 0(reg1)` | 6/8 | R_NANOMIPS_TLS_TPREL16 symbol |||
| L  | | `li48 reg, %tprel(symbol); [ls]x reg2, reg1(reg_tp)` | 10 | R_NANOMIPS_TLS_TPREL_I32 symbol |||
