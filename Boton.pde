class Boton {
  /*-ATRIBUTOS-*/
  
  Transform transform;     // Posicion del boton
  String texto;            // Texto del boton
  boolean estaSobre;       // Condicion del boton para verificar si el cursor esta encima
  SpriteRenderer sprite;   // Sprite del boton
  float cooldown;          // Tiempo de espera entre clicks
  int tiempoUltimaPresion; // Tiempo de la ultima vez que se presiono encima del boton
  Collider collider;       // Collider de boton
  
  /*-CONSTRUCTORES-*/
  
  //Constructor parametrizado
  Boton(float x, float y, String texto, String rutaImagen, float cooldown) {
    this.transform = new Transform(x, y, 120, 120); // Asigna la posicion en x, y, escalaX y escalaY del boton
    this.texto = texto;                                      // Asigna el texto al boton
    this.estaSobre = false;                                  // Se inicia la condicion en falso
    this.sprite = new SpriteRenderer(rutaImagen, transform, 120, 120); // Se asigna una imagen para el boton
    this.cooldown = cooldown * 1000;          // Se utiliza una operacion para convertir los segundos en milisegundos
    this.tiempoUltimaPresion = 0;             // Se inicia en 0 el tiempo de la ultima vez que se presiono
    this.collider = new Collider(transform);  // Asignamos el collider con el transform
  }
  
  //Metodo para dibujar el boton en la pantalla
  void dibujarBoton() {
    if (!sprite.imagenCargada) {  // Verifica si la imagen no esta cargada, sino se muestra el sprite del boton
      fill(#0C3090);                                            // Color de relleno de la figura
      rect(transform.posicion.x, transform.posicion.y, 80, 80); // Dibuja el boton como un rectangulo
    } else {
      sprite.mostrarImagen();                                        // Muestra el sprite
    }

    if (estaSobre()) { // Verifica si el cursor esta sobre el boton
      tint(#0C3090);   // Cambia el color del sprite para indicar que esta sobre el boton
      while(this.transform.escala.x < 140 ){      // Aumenta el tamaño del boton
      this.transform.escala.x = this.transform.escala.x +0.00001;
      this.transform.escala.y = this.transform.escala.y +0.00001;
      }
    } else {
      // Devuelve al tamaño original
      while(this.transform.escala.x >= 120 ){   // Disminuye el tamaño del boton
      this.transform.escala.x = this.transform.escala.x -0.00001;
      this.transform.escala.y = this.transform.escala.y -0.00001;
      }
    }
      if (enCooldown()) {  // Verifica si el boton esta cargando
      
      /*Mientras escalaX y la escalaY del boton sean mayores o igual que 120 se disminuye en tamaño del boton*/
      while(this.transform.escala.x >= 120 & this.transform.escala.y >= 120){
      this.transform.escala.x = this.transform.escala.x -0.01;
      this.transform.escala.y = this.transform.escala.y -0.01;
      }
      fill(0, 0, 0, 150);          // Color transparente para el boton, el cuarto valor indica la opacidad
      rectMode(CENTER);            // Establece la posicion de la figura en el Centro
      // Dibuja el boton en forma de rectangulo
      rect(transform.posicion.x, transform.posicion.y, transform.escala.x/2-5, transform.escala.y/2-5);
      // Calcula el tiempo de recarga del noton en milisegundos
      float tiempoRestante = (cooldown - (millis() - tiempoUltimaPresion)) / 1000.0;
      fill(255);                  // Color blanco para el texto de cooldown
      textAlign(CENTER, CENTER);  // Alinea el texto en el centro
      text(nf(tiempoRestante, 1, 1) + "s", transform.posicion.x, transform.posicion.y); // Muestra el tiempo del boton
    }
  }


 // Verifica si el cursor esta presionado
 boolean estaPresionado() {
    if (estaSobre() && mousePressed) {  // Verifica si el mouse esta sobre el boton y si esta presionado
      int tiempoActual = millis();                           // Obtiene el tiempo actual de los milisegundos
      if (tiempoActual - tiempoUltimaPresion >= cooldown) {  // Verifica si la carga del boton ha terminado
        tiempoUltimaPresion = tiempoActual;                  // Actualiza el tiempo de la ultima presion
        return true;                                         // Retorna verdadero si esta presionado
      }
    }
    return false;                      // Retorna falso cuando no se cumple ninguna de las dos condiciones
  }

  //Verifica si el cursor esta sobre
  boolean estaSobre() {
    // se utiliza la clase collider para detectar si el cursor esta sobre el boton
    return collider.mouseSobre(mouseX, mouseY); 
  }
  
  //Verifica si el boton esta cargando
  boolean enCooldown() {
    // retornara verdero mientras el tiempo de carga no se pase con el tiempo del primer contacto con el boton
    return millis() - tiempoUltimaPresion < cooldown;
  }

}
