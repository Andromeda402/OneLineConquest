class SpriteRenderer {
  PImage imagen;
  boolean imagenCargada = false;

  SpriteRenderer(String ruta, float escalaX, float escalaY) {
    cambiarImagen(ruta);
  }

  void cambiarImagen(String nuevaRuta) {
    try {
      imagen = loadImage(nuevaRuta);
      imagen.resize((int)(imagen.width * 0.5), (int)(imagen.height * 0.5)); // Cambiar tamaño la imagen
      imagenCargada = true; // Marca que la imagen está cargada
    } catch (Exception e) {
      println("No se pudo cargar la imagen: " + nuevaRuta);
      imagenCargada = false; // Marca que la imagen no se ha cargado
    }
  }

  void mostrar(float x, float y) {
    if (imagenCargada) {
      image(imagen, x, y);
    }
  }
}
