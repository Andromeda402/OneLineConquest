class Boton {
  Transform transform;
  String texto;
  boolean estaSobre;
  SpriteRenderer sprite;
  float cooldown;
  int tiempoUltimaPresion;
  Collider collider;  //añadimos collider

  Boton(float x, float y, String texto, String rutaImagen, float cooldown) {
    this.transform = new Transform(x, y, 120, 120);
    this.texto = texto;
    this.estaSobre = false;
    this.sprite = new SpriteRenderer(rutaImagen, transform);
    this.cooldown = cooldown * 1000;
    this.tiempoUltimaPresion = 0;
    this.collider = new Collider(transform);  // asignamos el collider con el transform
  }
  

  void dibujarBoton() {
    if (!sprite.imagenCargada) {
      fill(#0C3090); 
      rect(transform.posicion.x, transform.posicion.y, 80, 80);
    } else {
      sprite.mostrar();
    }

    if (estaSobre()) {
      tint(#0C3090);
      while(this.transform.escala.x < 140 ){
      this.transform.escala.x = this.transform.escala.x +0.00001;
      this.transform.escala.y = this.transform.escala.y +0.00001;
      }
    } else {
      while(this.transform.escala.x >= 120 ){
      this.transform.escala.x = this.transform.escala.x -0.00001;
      this.transform.escala.y = this.transform.escala.y -0.00001;
      }
    }
      if (enCooldown()) {
      while(this.transform.escala.x >= 120 & this.transform.escala.y >= 120){
      this.transform.escala.x = this.transform.escala.x -0.01;
      this.transform.escala.y = this.transform.escala.y -0.01;
      }
      fill(0, 0, 0, 150);
      rectMode(CENTER);
      rect(transform.posicion.x, transform.posicion.y, transform.escala.x/2-5, transform.escala.y/2-5);
      
      float tiempoRestante = (cooldown - (millis() - tiempoUltimaPresion)) / 1000.0;
      fill(255); 
      textAlign(CENTER, CENTER);
      text(nf(tiempoRestante, 1, 1) + "s", transform.posicion.x, transform.posicion.y);
    }
  }

 boolean estaPresionado() {
    if (estaSobre() && mousePressed) {
      int tiempoActual = millis();
      if (tiempoActual - tiempoUltimaPresion >= cooldown) {
        tiempoUltimaPresion = tiempoActual;
        return true;
      }
    }
    return false;
  }
  
  boolean estaSobre() {
    return collider.mouseSobre(mouseX, mouseY);
  }

  boolean enCooldown() {
    return millis() - tiempoUltimaPresion < cooldown;
  }

}
