class Edificio {
                  
  int vida;                   // Vida del edificio
  color colorBase;            // Color del edificio
  Collider collider;
  Transform transform;
  
  /*-CONSTRUCTORES-*/
  
  /*Constructor parametrizado*/
  Edificio(float x, float y, color colorBase) {    // Asigna la posicion y
    this.transform = new Transform(x, y, 50, 50);
    this.collider = new Collider(transform, 100);
    this.vida = 500;                         // Vida inicial del edificio
    this.colorBase = colorBase;              // Asigna el color del edificio
  }
  
  /*-METODOS-*/
  
  //Dibuja el edificio en el lienzo y su vida
  void mostrar() {
    fill(colorBase);                  // Aplica el color del edificio
    rectMode(CENTER);                 // Centra el rectangulo
    rect(this.transform.posicion.x, this.transform.posicion.y, 50, 50);               // Dibuja el edificio
    fill(0);                          // Cambia el color del texto a negro
    textSize(60);                     // Establece el tamaño del texto
    textAlign(CENTER);                // Alinea el texto al centro
    text("Vida: " + vida, this.transform.posicion.x, this.transform.posicion.y + 80); // Mostrar la vida del edificio
    collider.dibujarCollider();
  }
  
  void actualizarBaseEnemiga(ArrayList<Unidad> unidades, Edificio baseJugador){
    
  //Se agregan condiciones para verificar que la tecla este presionada 
      //tambien se incluye "o" en cada condicion para incluir minusculas y mayusculas
      if (keyPressed && (key == 'i' || key == 'I')) {
          unidades.add(new Soldado(this.transform.posicion.x, this.transform.posicion.y, baseJugador, colorBase));
      }
      if (keyPressed && (key == 'k' || key == 'K')) {
        unidades.add(new Arquero(this.transform.posicion.x, this.transform.posicion.y, baseJugador, colorBase));
      }
      if (keyPressed && (key == 'l' || key == 'L')) {
        unidades.add(new Mago(this.transform.posicion.x, this.transform.posicion.y, baseJugador, colorBase));
      }
  
  }
  //Resta la vida del edifico en funcio de la cantidad del daño
  void recibirDanio(int cantidad) {
    vida -= cantidad;                 // Resta la vida edificio por la cantidad de daño recibido
    if (vida <= 0) {                  // Condiciona si la vida es menor o igual a 0
      println("Edificio destruido!"); // Imprime mensaje cuando se destruye el edificio
    }
  }
}
