class Jugador {
  Edificio base;
  color colorUnidad;  // Color de las unidades del jugador
  boolean teclaPresionada = false;  // Para controlar la compra de unidades
  int oro;  // Cantidad de oro del jugador
  int costoUnidad = 30; // Costo de una unidad

  Jugador(Edificio base, color colorUnidad, int oroInicial) {
    this.base = base;
    this.colorUnidad = colorUnidad;
    this.oro = oroInicial;
  }

  void manejarEntrada() {
    // Jugador 1
    if (base.colorBase == color(0, 0, 255)) {
      if (keyPressed && key == 'u' && !teclaPresionada) {
        comprarUnidad();
        teclaPresionada = true;  // Marcar la tecla como presionada
      }
      if (!keyPressed) {
        teclaPresionada = false;  // Permitir otra compra cuando se libera la tecla
      }
    }

    // Jugador 2
    if (base.colorBase == color(255, 0, 0)) {
      if (keyPressed && key == 'i' && !teclaPresionada) {
        comprarUnidad();
        teclaPresionada = true;  // Marcar la tecla como presionada
      }
      if (!keyPressed) {
        teclaPresionada = false;  // Permitir otra compra cuando se libera la tecla
      }
    }
  }

  void comprarUnidad() {
    // Solo se puede comprar una unidad si el jugador tiene suficiente oro
    if (oro >= costoUnidad) {
      base.unidades.add(new Soldado(base.x, base.y, (base.colorBase == color(0, 0, 255)) ? baseEnemiga : baseAliada, colorUnidad)); // Crear Soldado
      oro -= costoUnidad;  // Restar el costo de la unidad
      println("Unidad comprada! Oro restante: " + oro);
    } else {
      println("No hay suficiente oro para comprar una unidad!");
    }
  }
}
