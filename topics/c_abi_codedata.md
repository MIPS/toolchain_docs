# Code and Data Models

This topic describes the code and data models supported by the nanoMIPS p32 ABI. The models offer a way to control the size of intermediate object files and fully linked executables. They provide flexibility to produce the most compressed code possible or to produce code which accommodates the largest of applications. 

There are 3 models available:

* **automatic**: generates the most compressed code possible by relying on the linker to expand or relax code appropriately; depending on a given symbol's visibility at link-time.

* **medium**: generates code which is appropriate for average-sized applications without relying on linker relaxations or expansions. The GP area can not exceed 2MiB and direct calls have a maximum range of 32 MiB.

* **large**: generates code which is appropriate for large applications without relying on linker relaxations or expansions. There are no inherent size limits when using this model.

Even though the automatic model will produce the smallest code size, the code generated at compile-time in this model is expected to be a safe approximation of the size of the fully linked code.

The automatic model requires a linker which can perform relaxations and expansions, while the medium and large models do not. Even so, linker relaxations and expansions can be used with the medium and large models, but they will be less effective than in the automatic model.

In addition to the models, there are 4 addressing modes:

* **absolute**: addresses are fixed at link-time. This mode is rarely necessary but has some potential for energy efficiency.
 
* **PC-relative**: addresses appear as offsets from the PC and are used in PC-relative instructions. This mode produces position-independent code.
 
* **GP-relative**: addresses appear as offsets from the GP and are used in GP-relative instructions. Symbols are placed in the small data section, also known as `.sdata`. This mode produces position-independent data for some or all of an application.

* **GOT-dependent**: addresses are kept in the GOT and are loaded by using offsets between the GP and a given symbol's entry in the GOT. This mode produces dynamically linked code.

Absolute addressing can use PC-relative instructions, but only if they can decrease code size without decreasing performance.

Position-independent data can be achieved by placing all data in the small data section, which can be relocated independently of code. This can be done by enforcing GP-relative addressing for all non-pre-emptible data symbols.

Pre-emptible symbols can only be accessed using GOT-dependent addressing. A pre-emptible symbol is a symbol whose local definition may be overridden by an external definition at dynamic-link-time. When doing a static link, the linker will relax all GOT-dependent sequences into PC-relative or absolute sequences.

There are no restrictions on intermixing different addressing modes.

A symbol can use only one code model and one addressing mode at a time. A compiler must decide which combination is appropriate for each symbol, however, a linker can change the addressing mode as it sees fit, when performing relaxations or expansions.
