class SpriteRenderer {

  Transform transform;
  PImage sprite;





  public SpriteRenderer(PImage sprite, Transform transform) {
    this.sprite = sprite;
    this.transform = transform;
  }


  public void render() {
    image(sprite, transform.posicion.x, transform.posicion.y, transform.escala.x, transform.escala.y);
  }

  void setSprite(String newSprite) { //variable temporal
    this.sprite = loadImage(newSprite);
  }
}
