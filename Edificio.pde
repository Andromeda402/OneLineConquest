class Edificio {
  float x, y;
  int vida;
  ArrayList<Unidad> unidades;
  color colorBase; // Color del edificio

  Edificio(float x, float y, color colorBase) {
    this.x = x;
    this.y = y;
    this.vida = 500; // Vida inicial del edificio
    this.unidades = new ArrayList<Unidad>();
    this.colorBase = colorBase; // Asignar color del edificio
  }

  void mostrar() {
    fill(colorBase);
    rectMode(CENTER);
    rect(x, y, 50, 50); // Dibujar el edificio
    fill(0);
    textSize(60);
    textAlign(CENTER);
    text("Vida: " + vida, x, y + 80); // Mostrar vida
  }

  void actualizarUnidades() {
    for (int i = unidades.size() - 1; i >= 0; i--) {
      Unidad unidad = unidades.get(i);
      unidad.mover();
      unidad.mostrar();
      if (unidad.vida <= 0) {
        unidades.remove(i); // Remover unidad si su vida es 0
      }
    }
  }

  void recibirDaño(int cantidad) {
    vida -= cantidad;  // Reducir vida por la cantidad de daño recibido
    if (vida <= 0) {
      println("Edificio destruido!");
    }
  }
}
