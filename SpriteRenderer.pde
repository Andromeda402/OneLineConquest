class SpriteRenderer {
  PImage imagen;
  boolean imagenCargada = false;
  Transform transform;

  SpriteRenderer(String ruta, Transform transform) {
    this.transform = transform;
    cambiarImagen(ruta);
  }
  
  SpriteRenderer(String ruta, Transform transform, float escalaX , float escalaY) {
    this.transform = transform;
    this.transform.escala.x = escalaX;
    this.transform.escala.y = escalaY;
    cambiarImagen(ruta);
  }

  void cambiarImagen(String nuevaRuta) {
    try {
      imagen = loadImage(nuevaRuta);
      imagenCargada = true; // Marca que la imagen está cargada
    } catch (Exception e) {
      println("No se pudo cargar la imagen: " + nuevaRuta);
      imagenCargada = false; // Marca que la imagen no se ha cargado
    }
  }

  void mostrar() {
    if (imagenCargada) {
      imageMode(CENTER);
      image(imagen, transform.posicion.x, transform.posicion.y,transform.escala.x,transform.escala.y );
    }
  }
  
}
