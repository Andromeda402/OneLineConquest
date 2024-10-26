class Unidad {
  Transform transform;
  float velocidad = 2; // Velocidad de movimiento
  Edificio objetivo;
  SpriteRenderer sprite;
  color colorUnidad;  // Color de la unidad
  int vida;           // Vida de la unidad
  float velocidadAtaque; // Velocidad de ataque
  int daño;          // Daño de ataque
  float tiempoUltimoAtaque = 0; // Tiempo desde el último ataque

  Unidad(float x, float y, Edificio objetivo, color colorUnidad) {
    // Inicializar Transform para la posición y escala
    transform = new Transform(x, y, 0.5, 0.5);  // Escala al 50%
    this.objetivo = objetivo;
    this.colorUnidad = colorUnidad;

    // Inicializar el SpriteRenderer
    sprite = new SpriteRenderer("soldado.png", transform.escala.x, transform.escala.y);

    // Inicializar atributos de la unidad
    vida = 100;              // Vida inicial
    velocidadAtaque = 1;    // Ataque por segundo
    daño = 10;              // Daño por ataque
  }

  void mover() {
    // Mover hacia la base objetivo
    if (dist(transform.posicion.x, transform.posicion.y, objetivo.x, objetivo.y) > 5) {
      float angulo = atan2(objetivo.y - transform.posicion.y, objetivo.x - transform.posicion.x);
      transform.posicion.x += cos(angulo) * velocidad;
      transform.posicion.y += sin(angulo) * velocidad;
    } else {
      atacar(); // Atacar si está cerca del objetivo
    }
  }

  void atacar() {
    // Atacar al edificio objetivo
    if (millis() - tiempoUltimoAtaque >= 1000 / velocidadAtaque) {
      objetivo.recibirDaño(daño); // Aplicar daño al edificio
      tiempoUltimoAtaque = millis();
      println("Unidad atacó el edificio!");
    }
  }

  void mostrar() {
    // Si la imagen no está disponible, se pinta un círculo del color correspondiente
    if (!sprite.imagenCargada) {
      fill(colorUnidad); // Usar el color de la unidad (azul o rojo)
      ellipse(transform.posicion.x, transform.posicion.y, 20, 20); // Dibujar el círculo
    } else {
      // Dibujar la unidad con la imagen
      sprite.mostrar(transform.posicion.x, transform.posicion.y);
    }
  }

  void cambiarSprite(String nuevaImagen) {
    sprite.cambiarImagen(nuevaImagen);
  }

  void recibirDaño(int cantidad) {
    vida -= cantidad;  // Reducir vida por la cantidad de daño recibido
    if (vida <= 0) {
      println("Unidad destruida!");
    }
  }
}
