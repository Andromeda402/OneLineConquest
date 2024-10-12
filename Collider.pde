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
}
