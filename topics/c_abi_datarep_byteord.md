# Byte ordering

The standard recognizes the following data formats:

* 8-bit byte
* 16-bit halfword
* 32-bit word
* 64-bit doubleword
* 128-bit quadword

Byte ordering defines how the bytes that make up halfwords, words,
doublewords, and quad-words are ordered in memory. Most significant byte (MSB)
byte ordering, or big endian as it is sometimes called, means that the most
significant byte is located in the lowest addressed byte position in a storage
unit (byte 0). The nanoMIPS processor supports either big endian or little
endian byte ordering.

The figures below illustrate the conventions for bit and byte numbering within
various width storage units. These conventions hold for both integer data and
floating-point data, where the most significant byte of a floating-point value
holds the sign and at least the start of the exponent.

**Little-endian bit and byte numbering**
```
  +----------------------------------------------------------------------+
  |                                            Little-Endian Byte Number |
  |                                                                      |
  | Little-Endian Bit Number End          Little-Endian Bit Number Start |
  +----------------------------------------------------------------------+
```

**Little-endian bit and byte numbering in half-words**
```
  +-----------------+-----------------+
  |               1 |               0 |
  |      MSB        |       LSB       |
  | 15            8 | 7             0 |
  +-----------------+-----------------+
```


**Little-endian bit and byte numbering in words**
```
  +----------------------------------+-----------------+-----------------+
  |              3 |               2 |               1 |               0 |
  |      MSB       |                 |                 |       LSB       |
  | 31          24 | 23           16 | 15            8 | 7             0 |
  +----------------------------------+-----------------+-----------------+
```

**Little-endian bit and byte numbering in doublewords**
```
  +----------------------------------+-----------------+-----------------+
  |              7 |               6 |               5 |               4 |
  |      MSB       |                 |                 |                 |
  | 63          56 | 55           48 | 47           40 | 39           32 |
  +----------------------------------+-----------------+-----------------+
  |              3 |               2 |               1 |               0 |
  |                |                 |                 |       LSB       |
  | 31          24 | 23           16 | 15            8 | 7             0 |
  +----------------------------------+-----------------+-----------------+
```

**Little-endian bit and byte numbering in quadwords**
```
  +----------------+-----------------+-----------------+-----------------+
  |             15 |              14 |              13 |              12 |
  |      MSB       |                 |                 |                 |
  | 127        120 | 119         112 | 111         104 | 103          96 |
  +----------------------------------+-----------------+-----------------+
  |             11 |              10 |               9 |               8 |
  |                |                 |                 |                 |
  | 95          88 | 87           80 | 79           72 | 71           64 |
  +----------------------------------+-----------------+-----------------+
  |              7 |               6 |               5 |               4 |
  |                |                 |                 |                 |
  | 63          56 | 55           48 | 47           40 | 39           32 |
  +----------------------------------+-----------------+-----------------+
  |              3 |               2 |               1 |               0 |
  |                |                 |                 |       LSB       |
  | 31          24 | 23           16 | 15            8 | 7             0 |
  +----------------------------------+-----------------+-----------------+
```

**Big-endian bit and byte numbering**
```
  +----------------------------------------------------------------------+
  | Big-Endian Byte Number                                               |
  |                                                                      |
  | Big-Endian Bit Number Start                Big-Endian Bit Number End |
  +----------------------------------------------------------------------+
```

**Big-endian bit and byte numbering in half-words**
```
  +----------------+-----------------+
  | 0              | 1               |
  |      MSB       |       LSB       |
  | 0            7 | 8            15 |
  +----------------+-----------------+
```

**Big-endian bit and byte numbering in words**
```
  +----------------+-----------------+-----------------+-----------------+
  | 0              | 1               | 2               | 3               |
  |      MSB       |                 |                 |       LSB       |
  | 0            7 | 8            15 | 16           23 | 24           31 |
  +----------------------------------+-----------------+-----------------+
```

**Big-endian bit and byte numbering in doublewords**
```
  +----------------+-----------------+-----------------+-----------------+
  | 0              | 1               | 2               | 3               |
  |      MSB       |                 |                 |                 |
  | 0            7 | 8            15 | 16           23 | 24           31 |
  +----------------------------------+-----------------+-----------------+
  | 4              | 5               | 6               | 7               |
  |                |                 |                 |       LSB       |
  | 32          39 | 40           47 | 48           55 | 56           63 |
  +----------------------------------+-----------------+-----------------+
```

**Big-endian bit and byte numbering in quadwords**
```
  +----------------+-----------------+-----------------+-----------------+
  | 0              | 1               | 2               | 3               |
  |      MSB       |                 |                 |                 |
  | 0            7 | 8            15 | 16           23 | 24           31 |
  +----------------------------------+-----------------+-----------------+
  | 4              | 5               | 6               | 7               |
  |                |                 |                 |                 |
  | 32          39 | 40           47 | 48           55 | 56           63 |
  +----------------------------------+-----------------+-----------------+
  | 8              | 9               | 10              | 11              |
  |                |                 |                 |                 |
  | 64          71 | 72           79 | 80           87 | 88           95 |
  +----------------------------------+-----------------+-----------------+
  | 12             | 13              | 14              | 15              |
  |                |                 |                 |       LSB       |
  | 96         103 | 104         111 | 112         119 | 120         127 |
  +----------------------------------+-----------------+-----------------+
```

