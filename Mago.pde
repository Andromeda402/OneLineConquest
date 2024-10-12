class Mago extends Unidad {

  public Mago(PVector pos, PImage sprite, String nombre, String raza, int armadura, int costoOro, boolean esEnemigo) {
    super(pos, sprite, nombre, raza, armadura, costoOro, esEnemigo);
    this.vida = 150;
    this.danio = 8;
    this.velocidadAtaque = 6;
    this.velocidadMovimiento = 4;
  }
}
