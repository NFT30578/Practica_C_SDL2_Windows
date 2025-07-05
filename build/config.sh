MARCH=-march=armv7-a+neon-vfpv4
SDL_LIBS=-lSDL2 -lSDL2_ttf -lSDL2_mixer -lSDL2_gfx -lSDL2_image -lmad -lpthread -ldl -lrt -lfreetype -lbz2
SDL_LIB_PATHS=-L$(PWD)/build/usr/miyoo/lib -L$(PWD)/build/usr/lib -L$(PWD)/build/lib
SDL_INCLUDE=-I ../third_party/SDL2/SDL2-2.26.1/include -I ../third_party/SDL2_mixer/SDL2_mixer-2.0.1 -I ../third_party/SDL2_gfx/SDL2_gfx-1.0.4 -I ../third_party/SDL2_ttf/SDL2_ttf-2.0.13 -I ../third_party/SDL2_image/SDL2_image-2.0.1
