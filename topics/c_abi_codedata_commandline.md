# Compiler command-line options

Option | Description|
|-------|------------|
`-mcmodel={auto,medium,large}`| Used to select the code model for non-pre-emptible symbols.
`-mpcrel`| Forces PC-relative addressing for non-pre-emptible symbols. This also effectively disables absolute addressing.
`-mno-pcrel`| Avoids PC-relative addressing for non-pre-emptible symbols where alternative sequences are not larger or slower.
`-mgpopt`| Enables GP-relative addressing for non-pre-emptible symbols which are within the size limit specified by the `-G` option.
`-mno-gpopt`| Disables GP-relative addressing completely.
`-mpid`| Enforces position-independent data by requiring GP-relative addressing for all non-pre-emptible data symbols.
`-fpic`| Turns on GOT-dependent addressing for pre-emptible symbols. If the model is not automatic, this will generate medium model GOT-dependent sequences.
`-fPIC`| Turns on GOT-dependent addressing for pre-emptible symbols. If the model is not automatic, this will generate large model GOT-dependent sequences.
`-mrelax`| Enables linker relaxation for the compilation unit. The compiler emits a `.linkrelax` directive in the assembly file which causes an ELF header flag to be set in the object.

Note: `-mlong-calls` forces the generation of large model sequences only for
non-pre-emptible functions.

Note: The automatic model is set as the default model and linker relaxations
are enabled by default.

Note: If no model is specified, both `-fpic` and `-fPIC` will enable automatic
model GOT-dependent sequences.
