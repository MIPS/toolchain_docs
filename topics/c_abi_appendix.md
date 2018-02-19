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

The MIPS/microMIPS/MIPS16 ISAs use the lowest bit in addresses to indicate the ISA mode, hence, the lowest bit of `__pfn` could not beused to to indicate whether the function that will be called through a pointer-to-member-function is virtual. In case of MIPSi/microMIPS/MIPS16, this bit was encoded in `__delta` and the `__delta` shifted by to the left to make space for it. As the nanoMIPS ISA does not use the lowest bit in addresses to indicate the ISA mode, the lowest bit in `__pfn` is now used to mark a pointer-to-member-function as virtual or not.
