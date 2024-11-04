class Transform {
  private PVector posicion;
  private PVector escala;

  Transform(float x, float y, float escalaX, float escalaY) {
    posicion = new PVector(x, y);
    escala = new PVector(escalaX, escalaY);
  }

  // Getters
  public PVector getPosicion() {
    return posicion;
  }

  public PVector getEscala() {
    return escala;
  }

  public float getPosicionX() {
    return posicion.x;
  }

  public float getPosicionY() {
    return posicion.y;
  }

  public float getEscalaX() {
    return escala.x;
  }

  public float getEscalaY() {
    return escala.y;
  }

  // Setters
  public void setPosicion(PVector nuevaPosicion) {
    this.posicion = nuevaPosicion;
  }

  public void setPosicion(float x, float y) {
    this.posicion.set(x, y);
  }

  public void setEscala(PVector nuevaEscala) {
    this.escala = nuevaEscala;
  }

  public void setEscala(float escalaX, float escalaY) {
    this.escala.set(escalaX, escalaY);
  }

  public void setPosicionX(float x) {
    this.posicion.x = x;
  }

  public void setPosicionY(float y) {
    this.posicion.y = y;
  }

  public void setEscalaX(float escalaX) {
    this.escala.x = escalaX;
  }

  public void setEscalaY(float escalaY) {
    this.escala.y = escalaY;
  }
}
