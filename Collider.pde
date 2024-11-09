class Collider {
  
  /*-ATRIBUTOS-*/

  Transform transform; // Posicion y escala para la colision
  
  /*CONSTRUCTORES*/
  
  // Constructor parametrizado que recibe un Transform como parametro
  public Collider(Transform transform) {
    this.transform = transform; // Se asigna un transform para el collider
  }
  
  /*-METODOS*/
  
  //Metodo para verificar colision entre objectos con forma de circulo
  public boolean hayColCirculo(Collider colCirculo) {

    float distancia;    //Distancia entre el centro de los circulos
    float radioCirculo; //Radio de los circulos
    
    //Calcula la distancia entre los centros de los circulos
    distancia = PVector.dist(this.transform.posicion, colCirculo.transform.posicion);
    //Calcula la suma de los radios de los circulos
    radioCirculo = this.transform.escala.x/2 + colCirculo.transform.escala.x/2;
    //Retorna verdadero si la distancia de entre los circulos es menor a sus radios 
    return distancia <= radioCirculo; //retorna verdadero cuando los circulos hacen contacto
  }
    
  //Metodo para verificar la coloision entre la unidad y el edificio
  boolean colisionUnidadEdificio(Unidad unidad, Edificio edificio) {
    // Verificar si la unidad está en contacto con el edificio
    return (unidad.transform.posicion.x > edificio.x - 25 &&
      unidad.transform.posicion.x < edificio.x + 25 &&
      unidad.transform.posicion.y > edificio.y - 25 &&
      unidad.transform.posicion.y < edificio.y + 25);
  }
  
  //Metodo para verificar si el cursor esta sobre el area del circulo
  public boolean mouseSobre(float mouseX, float mouseY) {
    float radioCirculo = this.transform.escala.x / 2;  // Radio del botón circular
    //Distancia entre el cursor y centro del circulo
    float distancia = PVector.dist(this.transform.posicion, new PVector(mouseX, mouseY));
    // Retorna verdadero si la distancia es menor o giaul que el radio del circulo
    return distancia <= radioCirculo;
  }
}
