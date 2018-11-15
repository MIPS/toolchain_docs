# Introduction

The newer MIPS and nanoMIPS toolchains provide a C implementation of memcpy in
lieu of the assembly implementation. The main advantage of the C
implementation is the ability to easily reconfigure the code flow to handle
different architecture variants, core configurations and ABIs. The
implementation is crafted to mimic assembly optimizations and instructions
in a high-level language.
