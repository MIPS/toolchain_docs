# Passing a variable number of arguments

## The `va_list` type

The `va_list` type is used to track arguments passed to a variadic function. The arguments are passed in one the three locations: general purpose registers, floating-point registers or in the overflow area (the stack). The prologue of a function shall save the incoming argument registers (both GP and FP registers) within its own stack frame. Then the `va_list` can refer to any argument depending on its type and position in the argument list.

In this soft-float ABI document, the floating-point types are passed in integer registers, hence, both the pointer to FP area and the FP offset are not used but reserved for the future.

``` C++
typedef struct __va_list {
    void *__overflow_argptr;  // next stack arg
    void *__gpr_top;          // top of the GP arg reg save area
    void *__fpr_top;          // top of the FP arg reg save area
    signed char __gpr_offset; // offset from __gpr_top to next GP reg arg
    signed char __fpr_offset; // offset from __fpr_top to next FP reg arg
} va_list;
```

## The va_start() macro

The macro is required to initiliaze all the fields of a va_list argument and it should be invoked before accessing any unnamed arguments. The MAX_ARGS_IN_REGISTERS is equal to 8, `num_gprs' is the number of general registers that hold named incoming arguments and the `num_fprs' is the number of floating point registers that hold named incoming floating-point arguments.

* `__overflow_argptr` - this pointer is used to get arguments passed on the stack. It is initialized to the first (lowest address) named incoming argument on the stack and it is updated to point to the next argument on the stack.
* `__gpr_top` - is set to the top of GP register save area; this pointer points to the top of the general purpose argument register save area.
* `__fpr_top` - is set to the top of FP register save area; this pointer points to the top of the floating-point argument register save area.
* `__gpr_offset = (MAX_ARGS_IN_REGISTERS - num_gprs) * UNITS_PER_WORD`; this holds the offset in bytes from the `__gpr_top` pointer to the location where the next general purpose argument register is saved.
* `__fpr_offset = (MAX_ARGS_IN_REGISTERS - num_fprs) * UNITS_PER_FPREG`; this holds the offset in bytes from the `__fpr_top` pointer to the location where the next floating-point argument register is saved.

Note that `__fpr_top` and `__fpr_offset` are reserved for future use and currently unused in the soft-float mode.

## The `va_arg()` macro

The macro is used to to modify parameter `ap` of `va_list` type to get to the value of successive arguments. The following is a pseudo code that calculates the address of an argument for a type and updates the `va_list` after processing an argument.

``` C++
/*
   TOP be the top of the GPR or FPR save area;            
   OFF be the offset from TOP of the next register;
   CUR_OFF copy of OFF to calculate the ADDR for
     the current TYPE              
   SIZE be the number of bytes in the argument type;      
   RSIZE be the number of bytes used to store the argument
     when it's in the register save area; and             
   OSIZE be the number of bytes used to store it when it's
     in the stack overflow area.
   ADDR the address of argument either in the register or
     stack overflow area.
   ALIGN required alignment for TYPE.
   REG_WIDTH is the register width, either the general
     purpose or floating-point register.
*/
 
type va_arg (va_list ap, type)
{
    int offs, size, rsize, osize, regsize, cur_off;
    intptr_t top, off, ovfl, addr;
    unsigned align;
 
    size = int_size_in_bytes (type);
    align = function_arg_alignment (mode, type);
 
    if (passed_in_gprs) {
        top = ap.__gpr_top;
        off = ap.__gpr_offset;
        rsize = round_up (size, UNITS_PER_WORD);
        osize = rsize; 
        reg_width = UNITS_PER_WORD;
    } else {
        top = ap.__fpr_top;
        off = ap.__fpr_offset;
        rsize = UNITS_PER_HWFPVALUE;
        osize = MAX (GET_MODE_SIZE (TYPE_MODE (type)), UNITS_PER_WORD);
        reg_width = UNITS_PER_HWFPVALUE;
    }
 
    if (off > 0) {
        if (align > reg_width)
            off &= -align;
        cur_off = off;
        off -= rsize;
        if (off >= 0) {
            addr = *(type *)(top - cur_off + (BYTES_BIG_ENDIAN ? rsize - size : 0));
            goto done;
        }
    }
 
    ovfl = ap.__overflow_argptr;
    if (align > UNITS_PER_WORD)
      ovfl = (ovfl + 2 * UNITS_PER_WORD - 1) & -(2 * UNITS_PER_WORD);
    addr = (void *)(ovfl + (BYTES_BIG_ENDIAN ? osize - size : 0);
    ovfl += osize;
  
    done:
        return *(type *) addr;
}
```

## Argument passing example

The following code is an example how various types will be passed in registers or on the stack using the calling conventions.

``` C++
typedef struct {
    int a;
    double b;
} sarg_t;
 
typedef struct {
    char a[2];
    int b;
} sarg2_t;
 
int ia, ib;
long long lla;
float fa;
double da;
sarg_t sa;
sarg2_t s2a;
 
r = foo(ia, fa, da, sa, ib, lla, s2a);
```
|Argument | Register  | Stack offset
|---------|-----------|---------
|`ia`	  | `$a0`     |   `X`
|`fa`*	  | `$a1`     |   `X`
|`da`	  | `$a2-$a3` |   `X`
|`sa`^	  | `$a4`     |   `X`
|`ib`	  | `$a5`     |   `X`
|`lla`	  | `$a6-$a7` |   `X`
|`s2a`	  | `X`       |  0-7

Notes:

\* - it might be subject to the default argument promotion causing different argument register/stack allocation. It is assumed that the prototype for `foo` is provided here.

^ - Passed by reference.

`X` - Unavailable/not used.

