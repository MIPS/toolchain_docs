# Bit fields in structures

C allows you to define structures that can have 'bit-fields', that is, a
standard integer type with a specified number of bits.

| Bit-field type   | Width (w)   | Range                  |
|------------------|-------------|------------------------|
| `signed char`    | 1 to 8      | 2^(w-1) to 2^(w-1) - 1 |
| `char`           |             | 0 to 2^(w-1)           |
| `unsigned char`  |             | 0 to 2^(w-1)           |
| `signed short`   | 1 to 16     | 2^(w-1) to 2^(w-1) - 1 |
| `short`          |             | 2^(w-1) to 2^(w-1) - 1 |
| `unsigned short` |             | 0 to 2^(w-1)           |
| `signed int`     | 1 to 32     | 2^(w-1) to 2^(w-1) - 1 |
| `int`            |             | 2^(w-1) to 2^(w-1) - 1 |
| `unsigned int`   |             | 0 to 2^(w-1)           |
| `signed long`    | 1 to 32     | 2^(w-1) to 2^(w-1) - 1 |
| `long`           |             | 2^(w-1) to 2^(w-1) - 1 |
| `unsigned long`  |             | 0 to 2^(w-1)           |

Plain bit-fields always have signed or unsigned values depending on whether
the basic type is signed or unsigned. In particular, char bit-fields are
unsigned while short, int, and long bit-fields are signed. A signed or
unsigned modifier overrides the default type.

In a signed bit-field, the most significant bit is the sign bit; sign bit
extension occurs when the bit-field is used in an expression. Unsigned
bit-fields are treated as simple unsigned values.

Bit-fields follow the same size and alignment rules as other structure and
union members, with the following additions:

* Bit-fields are allocated from left to right (most to least significant).
* A bit-field must reside entirely in a storage unit that is appropriate for
its declared type. Thus a bit-field never crosses its unit boundary. However,
an unnamed bit-field of non-zero width is allocated in the smallest storage
unit sufficient to hold the field, regardless of the defined type.
* Bit-fields can share a storage unit with other struct/union members,
including members that are not bit-fields. Of course, struct members occupy
different parts of the storage unit.
* Unnamed types of bit-fields do not affect the alignment of a structure or
union, although member offsets of individual bit-fields follow the alignment
constraints.
