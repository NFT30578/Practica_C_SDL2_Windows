#!/usr/bin/bash

# Comando para compilar un proyecto C con SDL2 y sus extensiones
echo "🔍 Buscando archivos .c en src/..."
SRC_FILES=$(find src -name '*.c')

if [ -z "$SRC_FILES" ]; then
    echo "❌ No se encontraron archivos .c en src/"
    exit 1
fi

echo "🧠 Compilando con SDL2 + extensiones..."
gcc -o main $SRC_FILES \
    `sdl2-config --cflags --libs` \
    -lSDL2_image -lSDL2_mixer -lSDL2_ttf -lSDL2_gfx

if [ $? -eq 0 ]; then
    echo "✅ Compilación exitosa. Ejecutando..."
    ./main
else
    echo "❌ Falló la compilación. Revisa errores arriba."
    exit 1
fi
