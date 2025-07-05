# Archivo: Makefile

# Incluye las variables de configuración del entorno (MARCH, SDL_LIBS, etc.)
# Asegúrate de que este script esté accesible y se ejecute antes de make
include config.sh

TARGET = build/mi_juego
SRCS = src/main.c src/hello_sdl2.c src/jugador/jugador.c src/enemigo/enemigo.c
OBJS = $(SRCS:.c=.o)

# Compilador C y C++ de compilación cruzada
CC = arm-linux-gnueabihf-gcc
CXX = arm-linux-gnueabihf-g++

# Banderas de compilación
# -g: Incluir información de depuración
# -O2: Nivel de optimización 2
# -Wall: Habilitar todas las advertencias
# Las variables del toolchain y SDL vienen de config.sh
CFLAGS = -g -O2 -Wall $(MARCH) -I ../include $(SDL_INCLUDE)
LDFLAGS = $(SDL_LIB_PATHS) $(SDL_LIBS)

all: $(TARGET)

build/mi_juego: build/main.o build/hello_sdl2.o build/jugador/jugador.o build/enemigo/enemigo.o
	$(CC) $^ -o $@ $(LDFLAGS)

build/%.o: src/%.c
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f build/*.o build/jugador/*.o build/enemigo/*.o build/mi_juego
