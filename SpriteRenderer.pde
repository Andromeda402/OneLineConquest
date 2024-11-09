class SpriteRenderer {
  
  /*-ATRIBUTOS-*/
  
  PImage imagen;
  boolean imagenCargada = false;
  Transform transform;

  //Atributos agregados
  
  PImage spriteSheet;   // Representa al SpriteSheet del Objeto
  int anchoFrame;       // Representa el Ancho del Frame individual
  int altoFrame;        // Representa el Alto del Frame individual
  int xFrame;           // Representa la Posición inicial x del Frame
  int yFrame;           // Representa la Posición inicial y del Frame (contador para animación hacia arriba)
  float punteroXFrame;  // Representa el Puntero al primer píxel en x de un frame 
  float punteroXFrameSiguiente; // Representa el Puntero al primer píxel en x del siguiente frame a punteroXFrame;
  float velocidadAnimacion;     // Representa la velocidad con la que se reproducirá la animación (la transición entre sprites)
  int escala;                   // Representa la velocidad con la que se reproducirá la animación (la transición entre sprites)
  
  /*-CONSTRUCTORES-*/
  
  SpriteRenderer(String spriteSheet, Transform transform) {
    this.transform = transform;
    cambiarImagen(spriteSheet);
  }

  SpriteRenderer(String spriteSheet, Transform transform, float escalaX, float escalaY) {

    this.velocidadAnimacion = 0.1;
    this.spriteSheet = requestImage(spriteSheet);
    this.xFrame=0;
    this.yFrame=0;
    
    this.anchoFrame = 320;
    this.altoFrame = 320;

    this.transform = transform;
    this.transform.escala.x = escalaX;
    this.transform.escala.y = escalaY;
    cambiarImagen(spriteSheet);
  }
  
  
  
  /*-METODOS-*/
  
  void cambiarImagen(String nuevaRuta) {
    try {
      imagen = loadImage(nuevaRuta);
      imagenCargada = true; // Marca que la imagen está cargada
    }
    catch (Exception e) {
      println("No se pudo cargar la imagen: " + nuevaRuta);
      imagenCargada = false; // Marca que la imagen no se ha cargado
    }
  }


  void mostrarImagen () {
    imageMode(CENTER);
    image(imagen, transform.posicion.x, transform.posicion.y,transform.escala.x,transform.escala.y);
  }




//Metodo para mostrar la animacion del sprite
  void mostrarAnimacion (int estado) {
    imageMode(CENTER);
    //image(imagen, transform.posicion.x, transform.posicion.y,transform.escala.x,transform.escala.y);
    
    switch(estado) {
      case Animacion.ANIMACION_QUIETO:{
        this.yFrame = 0;
        image(this.spriteSheet.get(this.xFrame, this.yFrame, this.anchoFrame, this.altoFrame), transform.posicion.x, transform.posicion.y, this.anchoFrame * transform.escala.x, this.altoFrame * transform.escala.x);
        //image(imagen, transform.posicion.x, transform.posicion.y, transform.escala.x, transform.escala.y);
        moverSprite();
        break;
      }
    }
  }
  
  
  public void moverSprite() {
    this.punteroXFrame += anchoFrame*velocidadAnimacion;

    if (this.punteroXFrame >= this.punteroXFrameSiguiente) {
      this.xFrame += this.anchoFrame;
      this.punteroXFrameSiguiente = this.xFrame+this.anchoFrame;
      
      
      //Reiniciando Punteros para el error de pasos del sprite
      this.punteroXFrame = 0;
      this.punteroXFrameSiguiente = this.anchoFrame;

      //Reiniciando animación al llegar al final del spriteSheet
      if (this.xFrame >= this.spriteSheet.width) {
        this.xFrame = 0;
      }
    }
  }
  
  
  
  
  
  
  
}
