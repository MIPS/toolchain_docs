# TLS Models

The nanoMIPS ABI has support for all of the traditional TLS models. In addition
to this, it also offers the possibility of using TLS descriptors to get better
performance compared to the traditional dynamic models.

In order to gain more control over code size, all of the TLS code sequences
have been adapted to follow the automatic/medium/large approach taken in the
code and data models.

Note that TLS is not supported for the nanoMIPS subset.
