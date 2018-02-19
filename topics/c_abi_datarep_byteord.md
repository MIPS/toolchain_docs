# Byte ordering

The standard recognizes the following data formats:

* 8-bit byte
* 16-bit halfword
* 32-bit word
* 64-bit doubleword
* 128-bit quadword

Byte ordering defines how the bytes that make up halfwords, words, doublewords, and quad-words are ordered in memory. Most significant byte (MSB) byte ordering, or big endian as it is sometimes called, means that the most significant byte is located in the lowest addressed byte position in a storage unit (byte 0). The nanoMIPS processor supports either big endian or little endian byte ordering.

The figures below illustrate the conventions for bit and byte numbering within various width storage units. These conventions hold for both integer data and floating-point data, where the most significant byte of a floating-point value holds the sign and at least the start of the exponent.

**Little-endian bit and byte numbering**
![images/little-endian.png](../images/little-endian.png "Little-endian bit and byte numbering")

**Little-endian bit and byte numbering in half-words**
![images/byte_number.png](../images/byte_number.png "Little-endian bit and byte numbering in half-words")

**Little-endian bit and byte numbering in words**
![images/doublewords.png](../images/doublewords.png "Little-endian bit and byte numbering in doublewords")

**Little-endian bit and byte numbering in quadwords**
![images/quadwords.png](../images/quadwords.png "Little-endian bit and byte numbering in quadwords")

**Big-endian bit and byte numbering**
![images/big-endian.png](../images/big-endian.png "Big-endian bit and byte numbering")

**Big-endian bit and byte numbering in half-words**
![images/big-endian_byte.png](../images/big-endian_byte.png "Big-endian bit and byte numbering in half-words")

**Big-endian bit and byte numbering in words**
![images/big-endian-words.png](../images/big-endian-words.png "Big-endian bit and byte numbering in words")

**Big-endian bit and byte numbering in doublewords**
![images/big_endian-double.png](../images/big_endian-double.png "Big-endian bit and byte numbering in doublewords")

**Big-endian bit and byte numbering in quadwords**
![images/big-endian-quad.png](../images/big-endian-quad.png "Big-endian bit and byte numbering in quadwords")

