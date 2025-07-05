#include <stdio.h>
#include <SDL2/SDL.h>

int main(int argc, char* argv[]) {
    // Inicializar SDL
    SDL_Init(SDL_INIT_VIDEO);
    SDL_Init(SDL_INIT_VIDEO);
    SDL_Window* win = SDL_CreateWindow("Hola Victor", SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED, 640, 480, SDL_WINDOW_SHOWN);
    SDL_Delay(2000);
    SDL_DestroyWindow(win);
    SDL_Quit();

    return 0;
}