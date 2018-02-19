# Function Calling Sequence

This topic describes the register conventions used for the nanoMIPS hardware. 

The nanoMIPS architecture offers 32 general purpose registers, each 32-bit wide. The following table lists all registers and their purpose.

|Register     |Register   |Use	                                             |Type         |
|-------------|-----------|--------------------------------------------------|-------------|
|`$r0`	      |`$zero`	  |Hardware zero	                             |             |
|`$r1`	      |`$AT`	  |Assembler temporary	                             |Caller-saved |
|`$r2..$r3`   |`$t4..$t5` |Temporaries	                                     |Caller-saved |
|`$r4..$r5`   |`$a0..$a1` |Function arguments / function results / temporary |Caller-saved |
|`$r6..$r11`  |`$a2..$a7` |Function arguments / temporary	             |Caller-saved |
|`$r12..$r15` |`$t0..$t3` |Temporary	                                     |Caller-saved |
|`$r16..$r23` |`$s0..$s7` |Saved temporaries	                             |Callee-saved |
|`$r24..$r25` |`$t8..t9`  |Temporary	                                     |Caller-saved |
|`$r26..$r27` |`$k0..$k1` |Kernel registers	                             |             |
|`$r28`	      |`$gp`	  |Global pointer	                             |Callee-saved |
|`$r29`	      |`$sp`	  |Stack pointer	                             |Callee-saved |
|`$r30`	      |`$fp`      |Frame pointer                                     |Callee-saved |
|`$r31`	      |`$ra`	  |Return register	                             |Callee-saved |
