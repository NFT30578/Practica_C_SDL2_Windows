#ifndef JUGADOR_H
#define JUGADOR_H

typedef struct {
    int x, y;
    int vida;
} Jugador;

void jugador_mover(Jugador* j, int dx, int dy);
void jugador_dibujar(Jugador* j);

#endif // JUGADOR_H
