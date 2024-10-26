class Transform {
  PVector posicion;
  PVector escala;

  Transform(float x, float y, float escalaX, float escalaY) {
    posicion = new PVector(x, y);
    escala = new PVector(escalaX, escalaY);
  }
}
