# Function parameter passing

Arguments are passed to a subroutine in one of two locations: integer (general purpose) registers or the stack. The use of registers and/or memory depends on the number of arguments, their type and positions in the argument list. The ABI allows to pass up to 8 arguments to a subroutine. This ABI defines only soft-float ABI, thus, the floating-point arguments are being treated as integers of the same size. The floating-point return values shall also be passed in the integer registers.

The calling sequence has the following characterics:

* All stack regions are quadword (16 byte) aligned.
* Up to eight integer registers (`$a0..$a7`) may be used to pass integer arguments.
* All integer arguments are passed as 32-bit words, with signed or unsigned bytes and halfwords expanded (promoted) as necessary. The caller is responsible for the promotion.
* All pointers and addresses are 32-bit objects.
* Floating point arguments are treated as integers of the same size.
* Structs, unions, or other composite types are treated as a sequence of words, and are passed in integer registers as though they were simple scalar parameters to the extent that they fit, with any excess on the stack packed according to the normal memory layout of the object. More specifically:

    * Regardless of the struct field structure, it is treated as a sequence of 32-bit chunks.
    * A structure cannot be split between registers and the stack i.e. it can either be passed in registers or on the stack.
    * A union, either as the parameter itself or as a struct parameter field, is treated as a sequence of integer words for purposes of assignment to integer parameter (argument) registers.
    * Array fields of structs are passed like unions. Array parameters are passed by reference (unless the relevant language standard requires otherwise).
    * Right-justifying small scalar parameters in their save area slots notwithstanding, struct parameters are always left-justified. This applies both to the case of a struct smaller than 32 bits, and to the final chunk of a struct which is not an integral multiple of 32 bits in size. The implication of this rule is that the address of the first chunk's save area slot is the address of the struct, and the struct is laid out in the save area memory exactly as if it were allocated normally.
 
* An argument that cannot be allocated to an argument register is passed in memory on the stack and pointed to by the stack pointer at the time of call.
* An argument can be up to two register widths in size i.e. 64-bits object can be passed in a pair of 32-bit registers; alignment will be applied (depending on the type) as necessary.
* All vector types are passed by reference.
* No requirement is placed on the callee either to allocate space and save the argument registers, or to save them in any particular place.
* Variable argument functions follow the same rules with the exception that the callee is responsible for reserving the space for anonymous arguments in the general purpose argument register save area on the function entry. 
