#!/bin/bash

nasm -f macho32 print.nasm 
# ld -macosx_version_min 10.7.0 print.o -o print
/usr/local/bin/gcc-8 -lSystem -Wl,-no_pie -m32 -arch i386 -nostdlib print.o -o print
