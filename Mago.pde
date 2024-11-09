class Mago extends Unidad {
  
  /*-CONSTRUCTORES-*/
  
  Mago(float x, float y, Edificio objetivo, color colorUnidad) {
    super(x, y, objetivo, colorUnidad);                      // Llama al constructor de la clase padre Unidad
    sprite = new SpriteRenderer("Mago.png",transform,50,50); // Carga el sprite del mago
  }
  
  /*-METODOS-*/
  
  @Override
  void mostrar() {
    if (!sprite.imagenCargada) {                                   // Verifica si la imagen esta cargada
      fill(colorUnidad);                                           // Aplica el colo usando el color de la unidad
      ellipse(transform.posicion.x, transform.posicion.y, 20, 20); // Dibuja a la unidad como utilizando un circulo
    } else {
      sprite.mostrarImagen();                                            // Muestra el sprite de Mago
    }
  }
}
