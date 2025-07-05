#ifndef ENEMIGO_H
#define ENEMIGO_H

typedef struct {
    int x, y;
    int vida;
} Enemigo;

void enemigo_mover(Enemigo* e, int dx, int dy);
void enemigo_dibujar(Enemigo* e);

#endif // ENEMIGO_H
