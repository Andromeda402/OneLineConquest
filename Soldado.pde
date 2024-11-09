class Soldado extends Unidad {
  
  /*-CONSTRUCTORES-*/
  
  Soldado(float x, float y, Edificio objetivo, color colorUnidad) {
    super(x, y, objetivo, colorUnidad);                         // Llamar al constructor de Unidad
    sprite = new SpriteRenderer("Soldado.png",transform,50,50); // Cargar el sprite específico
  }
  
  /*METODOS*/
  
  @Override
  void mostrar() {
    if (!sprite.imagenCargada) {                                   // Verifica si la imagen esta cargada
      fill(colorUnidad);                                           // Aplica color usando el color de la unidad
      ellipse(transform.posicion.x, transform.posicion.y, 20, 20); // Dibuja a la unidad como utilizando un circulo
    } else {
      sprite.mostrarImagen();                                            // Muestra el sprite de Soldado
    }
  }
  


  

  
  
  
  
  
  
  
  
  
  
  
  
  
}
