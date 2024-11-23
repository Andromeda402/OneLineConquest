class Arquero extends Unidad {
  
  Collider colliderProyectil;
  
  
  
  
  /*-CONSTRUCTORES-*/  
  
  /*Constructor parametrizado*/
  Arquero(float x, float y, Edificio objetivo, color colorUnidad) {
    super(x, y, objetivo, colorUnidad);                          // Llama al constructor de la clase padre Unidad
    this.collider.radio = 10;
    this.colliderProyectil = new Collider(this.transform,100);
    sprite = new SpriteRenderer("Sprite-SheetArquera.png", transform, 4, 4); // Carga el sprite de la arquera
  }
  
  
  /*-METODOS*/
  
  /*Muestra el arquero en el lienzo*/
  @Override
  void mostrar() {
    if (!sprite.imagenCargada) {                                   // Verifica si la imagen del sprite no esta cargada
      fill(colorUnidad);                                           // Aplica el colo usando el color de la unidad
      ellipse(transform.posicion.x, transform.posicion.y, 20, 20); // Dibuja a la unidad como utilizando un circulo
    } else {
      sprite.mostrarAnimacion(1);                                            //Muestra el sprite Arquera
    }
  }
  
     void detectarUnidad(ArrayList<Unidad> unidades) {
    for (Unidad otraUnidad : unidades) {
      if (otraUnidad != this && otraUnidad.colorUnidad != this.colorUnidad) {
        if (this.colliderProyectil.hayColCirculo(otraUnidad.collider)) {
          objetivoUnidad = otraUnidad;
          break;
        }
      }
    }
  }
  
  
}
