#!/usr/bin/bash

# 🧱 SDL2 build script (MSYS2 UCRT64)
echo "🔍 Buscando archivos .c en src/..."

SRC_FILES=$(find src -name '*.c')

if [ -z "$SRC_FILES" ]; then
    echo "❌ No se encontraron archivos .c en src/"
    exit 1
fi

echo "🧠 Compilando con SDL2..."
gcc -o main $SRC_FILES `sdl2-config --cflags --libs`

if [ $? -eq 0 ]; then
    echo "✅ Compilación exitosa. Ejecutando..."
    ./main
else
    echo "❌ Falló la compilación. Revisa errores arriba."
    exit 1
fi