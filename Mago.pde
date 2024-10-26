class Mago extends Unidad {
  
  Mago(float x, float y, Edificio objetivo, color colorUnidad) {
    super(x, y, objetivo, colorUnidad); // Llamar al constructor de Unidad
    sprite = new SpriteRenderer("soldado.png",transform); // Cargar el sprite específico
  }

  @Override
  void mostrar() {
    if (!sprite.imagenCargada) {
      fill(colorUnidad); // Usar el color de la unidad
      ellipse(transform.posicion.x, transform.posicion.y, 20, 20); // Dibujar el círculo
    } else {
      // Dibujar la unidad con la imagen
      sprite.mostrar();
    }
  }
}
