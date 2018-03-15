# Aggregates, union and arrays

* The size of any object, including aggregates and unions, is always a
multiple of the alignment of the object.
* Structure and union objects can require padding to meet size and alignment
constraints.
* An array uses the same alignment as its elements.
* The content of any padding is undefined.
* An entire structure or union object is aligned on the same boundary as its
most strictly aligned member.
* Each member is assigned to the lowest available offset with the appropriate
alignment. This may require internal padding, depending on the previous
member.

##Examples

In the following examples, members’ byte offsets for little-endian
implementations appear in the upper right corners; offsets for big-endian
implementations in the upper left corners.

**Structure Smaller Than a Word**

```C++
struct {
  char c;
};
byte aligned, sizeof is 1

+-------+
|0     0|
|   c   |
+-------+
```

**No Padding**

```C++
struct {
  char c;
  char d;
  short s;
  int n;
};
word aligned, sizeof is 8

little endian:
+-------+-------+-------+-------+
|              2|      1|      0|
|       s       |   d   |   c   |
+-------+-------+-------+-------+
|                              4|
|               n               |
+-------+-------+-------+-------+

big endian:
+-------+-------+-------+-------+
|0      |1      |2              |
|   c   |   d   |       s       |
+-------+-------+-------+-------+
|4                              |
|               n               |
+-------+-------+-------+-------+
```

**Internal Padding**

```C++
struct {
  char c;
  short s;
};
halfword aligned, sizeof is 4

little endian:
+-------+-------+-------+-------+
|              2|      1|      0|
|       s       |  pad  |   c   |
+-------+-------+-------+-------+

big endian:
+-------+-------+-------+-------+
|0      |1      |2              |
|   c   |  pad  |       s       |
+-------+-------+-------+-------+
```

**Internal and Tail Padding**

```C++
struct {
  char c;
  double d;
  short s;
};
doubleword aligned, sizeof is 24

little endian:
+-------+-------+-------+-------+
|                      1|      0|
|          pad          |   c   |
+-------+-------+-------+-------+
|                              4|
|              pad              |
+-------+-------+-------+-------+
|                              8|
|               d               |
+-------+-------+-------+-------+
|                             12|
|               d               |
+-------+-------+-------+-------+
|             18|             16|
|      pad      |       s       |
+-------+-------+-------+-------+
|                             20|
|              pad              |
+-------+-------+-------+-------+

big endian:
+-------+-------+-------+-------+
|0      |1                      |
|   c   |          pad          |
+-------+-------+-------+-------+
|4                              |
|              pad              |
+-------+-------+-------+-------+
|8                              |
|               d               |
+-------+-------+-------+-------+
|12                             |
|               d               |
+-------+-------+-------+-------+
|16             |18             |
|       s       |      pad      |
+-------+-------+-------+-------+
|20                             |
|              pad              |
+-------+-------+-------+-------+
```

**Union Allocation**

```C++
union {
  char c;
  short s;
  int j;
};
word aligned, sizeof is 4

little endian:
+-------+-------+-------+-------+
|                      1|      0|
|          pad          |   c   |
+-------+-------+-------+-------+
|              2|              0|
|      pad      |       s       |
+-------+-------+-------+-------+
|                              0|
|               j               |
+-------+-------+-------+-------+

big endian:
+-------+-------+-------+-------+
|0      |1                      |
|   c   |          pad          |
+-------+-------+-------+-------+
|0              |2              |
|       s       |      pad      |
+-------+-------+-------+-------+
|0                              |
|               j               |
+-------+-------+-------+-------+
```


