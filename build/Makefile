CC = gcc
CFLAGS =	-Ithird_party/SDL2/include	-Ithird_party/SDL2_ttf/include	
LDFLAGS =	-Lthird_party/SDL2/lib	-Lthird_party/SDL2_ttf/lib	-lSDL2 -lSDL2_ttf

SRC =	/workspaces/Practica_C_SDL2_Windows/src/main.c
OUT =	main

$(OUT):	$(SRC)
	@echo $(CC) $(SRC) $(CFLAGS) $(LDFLAGS) -o $(OUT)
# Makefile for building a simple SDL2 application
# This Makefile assumes you have SDL2 and SDL2_ttf installed in the specified directories
# Adjust the paths as necessary for your environment
.PHONY:	all clean

all:	$(OUT)

clean:
	rm	-f	$(OUT)