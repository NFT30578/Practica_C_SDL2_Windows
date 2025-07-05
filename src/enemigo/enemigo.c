#include "../../include/enemigo/enemigo.h"

void enemigo_mover(Enemigo* e, int dx, int dy) {
    e->x += dx;
    e->y += dy;
}

void enemigo_dibujar(Enemigo* e) {
    // Aquí iría el código de renderizado del enemigo
}
