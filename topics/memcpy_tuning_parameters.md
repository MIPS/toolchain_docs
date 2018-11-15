# Tuning Parameters for MIPS Cores

Parts of the implementation can be re-configured by defining or modifying
pre-processor macros. Some of these are independent and can be controlled
directly by the user, some are a direct consequence of the core one is tuning
for and the rest are indirectly dependent on the previous two. We will
enumerate these macros according to the 3 categories and explain the
interactions between them.

The controls are deliberately implemented as macros instead of variables that
may be checked at run-time, in order to keep the run-time overhead to a
minimum. This means that the memcpy code must be rebuilt with specific
compiler options in order to to tune for a specific core.
