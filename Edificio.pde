class Edificio {
  float x, y;                 // Coordenadas del edificio
  int vida;                   // Vida del edificio
  ArrayList<Unidad> unidades; // Lista de unidades
  color colorBase;            // Color del edificio
  
  Collider collider;
  
  /*-CONSTRUCTORES-*/
  
  /*Constructor parametrizado*/
  Edificio(float x, float y, color colorBase) {
    this.x = x;                              // Asigna la posicion x
    this.y = y;                              // Asigna la posicion y
    this.vida = 500;                         // Vida inicial del edificio
    this.unidades = new ArrayList<Unidad>(); // Inicializa la lista de unidades como vacia
    this.colorBase = colorBase;              // Asigna el color del edificio
  }
  
  /*-METODOS-*/
  
  //Dibuja el edificio en el lienzo y su vida
  void mostrar() {
    fill(colorBase);                  // Aplica el color del edificio
    rectMode(CENTER);                 // Centra el rectangulo
    rect(x, y, 50, 50);               // Dibuja el edificio
    fill(0);                          // Cambia el color del texto a negro
    textSize(60);                     // Establece el tamaño del texto
    textAlign(CENTER);                // Alinea el texto al centro
    text("Vida: " + vida, x, y + 80); // Mostrar la vida del edificio
  }
  
  /*Actualiza la lista de Unidades*/
  void actualizarUnidades() {
    for (int i = unidades.size() - 1; i >= 0; i--) { // Itera en reversa para eliminar unidades
      Unidad unidad = unidades.get(i); // Obtiene la unidad actual de la lista
      unidad.mover();                  // Mueve la unidad
      unidad.mostrar();                // Muestra la unidad
      
      
      
      unidad.mostrarInformacion();
      unidad.mostrarInterfazUnidad();
      
      unidad.collider.dibujarCollider();
      
      
      if (unidad.vida <= 0) {          // Si la unidad es menor o igual a 0
        unidades.remove(i);            // Remover unidad si su vida es 0
      }
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
