Build instructions for the getting started guide
=============================================

These instructions apply to the following bookmaps:

bookmap_nanoMIPS-GSGuide.ditamap

This books contains some conditional marking, because some info is excluded for some builds. 
The exclusion is controlled by adding audience="m7000" or audience="i7200" to a tag.

The conditions are controlled at build time by one ditaval file:
	
To build for i7200/Shoalin release 
   nano_i7200only_gs.ditaval

Ninja release:
	nano_m7000_gs.ditaval


To build 
-----------------------------------------

dita.bat -i {path to bookmap}\bookmap_nanoMIPS-GSGuide.ditamap -filter={path to bookmap}\ditaval\<ditavalfile>.ditaval -f custpdf --args.fo.userconfig="plugins\com.imgtec.custpdf\cfg\fo\fop.xconf" -d -l {logfileoutputpath}\logfile.txt -o {path to bookmap}\out\

