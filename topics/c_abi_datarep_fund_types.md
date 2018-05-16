# Fundamental Types

The following tables shows how the fundamental type in C/C++ types map to the
nanoMIPS processor. It can be seen that natural alignment is required for all
types.

A null pointer (for all types) has the value zero.

|Type  | C/C++ type      | nanoMIPS architecture   | p32 || Notes |
|------|-----------------|-------------------------|------|------|------|
|      |                 |                         | **Size (bits)**  | **Alignment (bits)**  | |
| Integral | `char`      | unsigned byte           | 8  | 8  |  | 
| |`signed char`         | signed byte             | 8  | 8  |    | 
| |`unsigned char`       | unsigned byte           | 8  | 8  |   | 
| |\[`signed`] `short`   | signed halfword         | 16 | 16 |   | 
| |`unsigned short`      | unsigned halfword       | 16 | 16 |   | 
| |\[`signed`] `int`     | signed word             | 32 | 32 |   | 
| |`unsigned int`        | unsigned word           | 32 | 32 |   | 
| |\[`signed`] `long`    | signed word             | 32 | 32 |   | 
| |`unsigned long`       | unsigned word           | 32 | 32 |   | 
| |\[`signed`] `long long` | signed doubleword     | 64 | 64 | Since C99. |
| |`unsigned long long`  | unsigned doubleword     | 64 | 64 | Since C99. |
| |`_Bool/bool`          | unsigned byte           | 8  | 8  | Since C99 or in C++. False as 0, True as 1. |
| |`enum`                | signed or unsigned word | 32 | 32 |  | 
| Pointer  | `type *`    | data pointer            | 32 | 32 |   | 
| |`type (*) ()`         | code pointer            | 32 | 32 |   | 
| |`type&`               | data pointer            | 32 | 32 | C++ | 
| Floating Point | `float` | single precision (IEEE 754) | 32 | 32 |  |
| |`float _Complex` | 2 single precision (IEEE 754)      | 64 | 32 | Since C99. Layout as struct { float re, im; }; |
| |`double` | double precision (IEEE 754)                | 64 | 64 |  |
| |`double _Complex` | 2 double precision (IEEE 754)     | 128| 64 | Since C99. Layout as  struct { double re, im; }; |
| |`long double` | quad precision (IEEE 754-2008)        | 64 | 64 | |
| |`long double _Complex` | 2 quad precision (IEEE 754-2008) | 128 | 64 | Since C99. Layout as struct { long double re, im; }; |
