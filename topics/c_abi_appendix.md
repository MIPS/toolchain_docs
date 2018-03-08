# nanoMIPS Appendix

## Virtual Tables

### Representation of pointers to member functions

A pointer-to-function member type looks like:
```
struct {
  __P __pfn;
  ptrdiff_t __delta;
}
```

The MIPS/microMIPS/MIPS16 ISAs use the lowest bit in addresses to indicate the
ISA mode, hence, the lowest bit of `__pfn` could not beused to to indicate
whether the function that will be called through a pointer-to-member-function
is virtual. In case of MIPSi/microMIPS/MIPS16, this bit was encoded in
`__delta` and the `__delta` shifted by to the left to make space for it. As the
nanoMIPS ISA does not use the lowest bit in addresses to indicate the ISA mode,
the lowest bit in `__pfn` is now used to mark a pointer-to-member-function as
virtual or not.

## Reserved TRAP, BREAK and SYSCALL codes

The nanoMIPS architecture does not raise an exception from the `DIV` or `UDIV`
instructions when dividing by zero and instead requires additional code to
detect and raise an exception. There are two mechanisms to report a divide by
zero exception; either `trap` with code `7` or `break` with code `7`. These
codes should be avoided by other software.

The Unified Hosting Interface (UHI) is supported for the nanoMIPS architecture
and uses a `SYSCALL 1` instruction as the trigger to request servicing of
a semi-hosting operation from runtime support code. For compatibility with UHI
other software should avoid using `SYSCALL` with code `1`.
