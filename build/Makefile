# archivo Makefile para compilar un programa simple en C usando SDL2 y SDL2_ttf
# Este Makefile asume que tienes SDL2 y SDL2_ttf instalados en los directorios especificados
# Ajusta las rutas según sea necesario para tu entorno
# Este Makefile asume que tienes SDL2 y SDL2_ttf instalados en los directorios especificados
# Ajusta las rutas según sea necesario para tu entorno

# cc es el compilador C
# CFLAGS son las banderas de compilación
# LDFLAGS son las banderas de enlace
# SRC es el archivo fuente
# OUT es el nombre del ejecutable final
# Puedes ejecutar `make` para compilar el programa y `make clean` para eliminar el ejecutable
CC = gcc

#las banderas de compilacion son las opciones que se pasan al compilador
#sirven para especificar opciones de compilacion, como incluir directorios de encabezados
#empiezan con -I para incluir directorios de encabezados
CFLAGS =	-Ithird_party/SDL2/SDL2-2.26.1	-Ithird_party/SDL2/SDL2-2.26.1/include	-Ithird_party/SDL2_ttf-2.0.13 -Ithird_party/SDL2_ttf/SDL2_ttf-2.0.13/SDL_ttf

#las banderas de enlace son las opciones que se pasan al enlazador, se utilizan para especificar bibliotecas 
#y directorios de bibliotecas, comienzan con -L para especificar directorios donde se encuentrarn bibliotecas 
#-l para especificar la biblioteca a enlazar
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

