#include "../../include/jugador/jugador.h"

void jugador_mover(Jugador* j, int dx, int dy) {
    j->x += dx;
    j->y += dy;
}

void jugador_dibujar(Jugador* j) {
    // Aquí iría el código de renderizado del jugador
}
