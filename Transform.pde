class Transform {
  
  /*ATRIBUTOS*/
  
  private PVector posicion; //Vector que almacena la posicion del eje X e Y
  private PVector escala;   //Vector que almacena la escala X(Ancho) e Y(Alto)
  
  /*-CONSTRUCTORES-*/
  
  //Constructor parametrizado
  Transform(float x, float y, float escalaX, float escalaY) {
    posicion = new PVector(x, y);           //Asigna la posicion inicial del objeto
    escala = new PVector(escalaX, escalaY); //Asigna la escala inciial del objeto
  }

  /*-GETTERS-*/
  
  //Retorna el vector de la posicion X e Y
  public PVector getPosicion() {
    return posicion;
  }
  
  //Retorna el vector de la posicion X e Y
  public PVector getEscala() {
    return escala;
  }
  
  //Retorna la posicion del eje X
  public float getPosicionX() {
    return posicion.x;
  }
  
  //Retorna la posicion del eje Y
  public float getPosicionY() {
    return posicion.y;
  }
  
  //Retorna la escala del eje X (ancho)
  public float getEscalaX() {
    return escala.x;
  }
  
  //Retorna la escala del eje Y (alto)
  public float getEscalaY() {
    return escala.y;
  }

  /*-SETTERS-*/
  
  //Asigna un nuevo vector para la posicion
  public void setPosicion(PVector nuevaPosicion) {
    this.posicion = nuevaPosicion;
  }
  
  //Asigna la posicion usando valores X e Y
  public void setPosicion(float x, float y) {
    this.posicion.set(x, y);
  }
  
  //Asigna un nuevo vector para la escala
  public void setEscala(PVector nuevaEscala) {
    this.escala = nuevaEscala;
  }
  
  //Asigna la escala usando valores X e Y
  public void setEscala(float escalaX, float escalaY) {
    this.escala.set(escalaX, escalaY);
  }
  
  //Asigna un nuevo valor en el eje X de la posicion
  public void setPosicionX(float x) {
    this.posicion.x = x;
  }
  
  //Asigna un nuevo valor en el eje Y de la posicion
  public void setPosicionY(float y) {
    this.posicion.y = y;
  }
  
  //Asigna un nuevo valor en el eje X de la posicion
  public void setEscalaX(float escalaX) {
    this.escala.x = escalaX;
  }
  
  //Asigna un nuevo valor en el eje Y de la posicion
  public void setEscalaY(float escalaY) {
    this.escala.y = escalaY;
  }
}
