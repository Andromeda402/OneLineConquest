class Arquero extends Unidad {
  
  /*-CONSTRUCTORES-*/
  
  /*Constructor parametrizado*/
  Arquero(float x, float y, Edificio objetivo, color colorUnidad) {
    super(x, y, objetivo, colorUnidad);                          // Llama al constructor de la clase padre Unidad
    this.collider.radio = 10;
    sprite = new SpriteRenderer("Arquera Sprite-Sheet.png", transform,0.2,0.2); // Carga el sprite de la arquera
  }
  
  
  /*-METODOS*/
  
  /*Muestra el arquero en el lienzo*/
  @Override
  void mostrar() {
    if (!sprite.imagenCargada) {                                   // Verifica si la imagen del sprite no esta cargada
      fill(colorUnidad);                                           // Aplica el colo usando el color de la unidad
      ellipse(transform.posicion.x, transform.posicion.y, 20, 20); // Dibuja a la unidad como utilizando un circulo
    } else {
      sprite.mostrarAnimacion(0);                                            //Muestra el sprite Arquera
    }
  }
}
