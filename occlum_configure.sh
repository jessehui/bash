#! /bin/bash

CFLAGS="-D DEBUG=1 -g -O0" LIBS=-lpthread ./configure --enable-debugger
