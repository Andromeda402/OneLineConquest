class Boton {
  Transform transform;
  String texto;
  boolean estaSobre;
  SpriteRenderer sprite;
  float cooldown;

  Boton(float x, float y, String texto, String rutaImagen, float cooldown) {
    this.transform = new Transform(x, y, 120, 120);
    this.texto = texto;
    this.estaSobre = false;
    this.sprite = new SpriteRenderer(rutaImagen, transform);
    this.cooldown = 1;
  }


  void cambiarSprite(String nuevaImagen) {
    sprite.cambiarImagen(nuevaImagen);
  }
  
  void dibujarBoton() {
    
    /*if(millis() - cooldown){
      
    }*/
    
    
    // Si la imagen no está disponible, se pinta un círculo del color correspondiente
    if (!sprite.imagenCargada) {
      fill(#0C3090); 
      rect(transform.posicion.x, transform.posicion.y, 80, 80); // Dibuja la forma del boton en este caso es un cuadrado
    } else {
      // Dibujar la unidad con la imagen
      sprite.mostrar();
      
    }
    
    //Repartir responsavilidades
    //El boton verifica
    if(estaSobre()){
      fill(#0C3090);
      
    } else {
      noFill();
    }
    
    /*if(millis() - cooldown){
      
    }*/

  }
  
  
  boolean estaSobre() {
    return mouseX > transform.posicion.x && mouseX < transform.posicion.x + transform.escala.x &&
           mouseY > transform.posicion.y && mouseY < transform.posicion.y + transform.escala.y;
  }

  boolean estaPresionado() {
    return estaSobre() && mousePressed; //verifica si el cursor esta sobre el boton y si esta presionado
  }


}
