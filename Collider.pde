class Collider {

  Transform transform;


  public Collider(Transform transform) {
    this.transform = transform;
  }


  public boolean hayColCirculo(Collider colCirculo) {

    float distancia;
    float radioCirculo;


    distancia = PVector.dist(this.transform.posicion, colCirculo.transform.posicion);

    radioCirculo = this.transform.escala.x/2 + colCirculo.transform.escala.x/2;

    return distancia <= radioCirculo; //retorna la condicion
  }
    boolean colisionUnidadEdificio(Unidad unidad, Edificio edificio) {
    // Verificar si la unidad está en contacto con el edificio
    return (unidad.transform.posicion.x > edificio.x - 25 && 
            unidad.transform.posicion.x < edificio.x + 25 &&
            unidad.transform.posicion.y > edificio.y - 25 &&
            unidad.transform.posicion.y < edificio.y + 25);
  }
 
  public boolean mouseSobre(float mouseX, float mouseY) {
    float radioCirculo = this.transform.escala.x / 2;  // Radio del botón circular
    float distancia = PVector.dist(this.transform.posicion, new PVector(mouseX, mouseY));
    return distancia <= radioCirculo;
}

}
