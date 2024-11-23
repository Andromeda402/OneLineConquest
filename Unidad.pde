class Unidad {
  
  /*-ATRIBUTOS-*/
  
  Collider collider;
  
  Transform transform;          // Posicion de la unidad
  float velocidad = 2;          // Velocidad de movimiento
  Edificio objetivo;            // Objetivo de la unidad
  SpriteRenderer sprite;        // Sprite de la unidad
  color colorUnidad;            // Color de la unidad
  int vida;                     // Vida de la unidad
  float velocidadAtaque;        // Velocidad de ataque
  int danio;                     // Daño de ataque
  float tiempoUltimoAtaque = 0; // Tiempo desde el último ataque
  
  SpriteRenderer estadisticaUnidad;
  Transform estadisticaPos;
  
  Unidad objetivoUnidad;
  /*-CONSTRUCTORES-*/
  
  /* Contructor parametrizado */
  Unidad(float x, float y, Edificio objetivo, color colorUnidad) {
    // Inicializar Transform para la posición y escala
    transform = new Transform(x, y, 0.5, 0.5);  // Escala al 50%
    this.objetivo = objetivo;
    this.colorUnidad = colorUnidad;
    // Inicializar el SpriteRenderer
    this.sprite = new SpriteRenderer("Soldado.png",transform);

    // Inicializar atributos de la unidad
    vida = 100;             // Vida inicial
    velocidadAtaque = 1;    // Ataque por segundo
    danio = 10;              // Daño por ataque
    
    collider = new Collider (transform, 30);
    
    objetivoUnidad = null;
    this.estadisticaPos = new Transform (height-200, width-600, 2, 2);
    this.estadisticaUnidad = new SpriteRenderer("InterfazEstadisticas.png", estadisticaPos, 1200, 550);
    
  }
  
  
  /* -- MÉTODOS -- */
  
   void detectarUnidad(ArrayList<Unidad> unidades) {
    for (Unidad otraUnidad : unidades) {
      if (otraUnidad != this && otraUnidad.colorUnidad != this.colorUnidad) {
        if (this.collider.hayColCirculo(otraUnidad.collider)) {
          objetivoUnidad = otraUnidad;
          break;
        }
      }
    }
  }
  
  boolean detectarEdificio(Collider collider, Edificio objetivo){
    return collider.hayColCirculo(objetivo.collider);
  }
  
  void atacarUnidad(Unidad otro) {
    sprite.mostrarAnimacion(2);
    otro.recibirDaño(1);
  }
  
  void recibirDaño(int daño) {
    vida -= daño;
  }
  
  boolean estaMuerto() {
    
    return vida <= 0;
  }
  
  //Metodo mover la unidad
  void mover(ArrayList<Unidad> unidades) {
    
    if (objetivoUnidad != null) {
      if (!objetivoUnidad.estaMuerto()) {
        atacarUnidad(objetivoUnidad);
        return;
      } else {
        
        objetivoUnidad = null;
      }
    }
    detectarUnidad(unidades);
    
    
    // Mover hacia la base objetivo
     if(detectarEdificio(this.collider, this.objetivo)){
      
      
    atacarEdificio(); // Atacar si está cerca del objetivo
    return;
     }
     float angulo = atan2(objetivo.transform.posicion.y - transform.posicion.y, objetivo.transform.posicion.x - transform.posicion.x);
     transform.posicion.x += cos(angulo) * velocidad;
     transform.posicion.y += sin(angulo) * velocidad;
  }
  
  //Metodo para que ataque la unidad
  void atacarEdificio() {
    // Atacar al edificio objetivo
    if (this.collider.hayColCirculo(objetivo.collider)) {
      if (millis() - tiempoUltimoAtaque >= 1000 / velocidadAtaque) {
      
      objetivo.recibirDanio(danio); // Aplicar daño al edificio
      tiempoUltimoAtaque = millis();
      println("Unidad atacó el edificio!");
    }
    }
    
  }
  
  //Metodo para que se muestre la unidad en el lienzo
  void mostrar() {
    // Si la imagen no está disponible, se pinta un círculo del color correspondiente
    if (!sprite.imagenCargada) {
      fill(colorUnidad); // Usar el color de la unidad (azul o rojo)
      ellipse(transform.posicion.x, transform.posicion.y, 20, 20); // Dibujar el círculo
    } else {
      // Dibujar la unidad con la imagen
      sprite.mostrarImagen();
      
      //ellipse(50,50,/*transform.posicion.x, transform.posicion.y,*/ collider.radio * 2, collider.radio * 2);
      
      collider.dibujarCollider();
    }
  }
  
  
  //Metodo para cambiar la imagen de la unidad
  void cambiarSprite(String nuevaImagen) {
    sprite.cambiarImagen(nuevaImagen);
  }
  
  //Metodo para que la unidad reciba daño
  void recibirDanio(int cantidad) {
    vida -= cantidad;  // Reducir vida por la cantidad de daño recibido
    if (vida <= 0) {
      
      println("Unidad destruida!");
    }
  }
  
  
  //Metodo agregado
  
    void mostrarInformacion() {
    if (collider.mouseSobre(mouseX, mouseY)) {
      // Dibujar un cuadro con los atributos de la unidad
      fill(50, 50, 50, 200); // Fondo oscuro con transparencia
      stroke(255); // Contorno blanco
      //rect(mouseX + 15, mouseY +15, 150, 100); // Rectángulo para la interfaz
      rect(mouseX , mouseY - 40, 120, 30); // Rectángulo para la interfaz

      // Mostrar texto con los atributos
      fill(255); // Color del texto
      textSize(20);
      
      
      text("Vida: " + vida, mouseX, mouseY - 40);   //Espacio cada 20
      //text("Daño: " + danio, mouseX + 15, mouseY + 20);
      
      //text("Vel. Ataque: " + velocidadAtaque, mouseX + 15, mouseY + 40);
    }
  }
  
      void mostrarInterfazUnidad() {
    if (collider.mouseSobre(mouseX, mouseY)) {
      // Dibujar un cuadro con los atributos de la unidad
      //fill(50, 50, 50, 200); // Fondo oscuro con transparencia
      //stroke(255);
      estadisticaUnidad.mostrarImagen();
      //rect(150, 150, 150, 100);

      // Mostrar texto con los atributos
      fill(255); // Color del texto
      textSize(20);
      
      
      text("Vida: " + vida, height - 350, width - 600);   //Espacio cada 20
      text("Daño: " + danio, height - 350, width - 550);
      
      text("Vel. Ataque: " + velocidadAtaque, height - 350, width - 500);
      
      
      
      
      
    }
  }
  
  
}
