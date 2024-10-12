class Soldado extends Unidad {

  public Soldado(PVector pos, PImage sprite, String nombre, String raza, int armadura, int costoOro, boolean esEnemigo) {
    super(pos, sprite, nombre, raza, armadura, costoOro, esEnemigo);
    this.vida = 400;
    this.danio = 15;
    this.velocidadAtaque = 10;
    this.velocidadMovimiento = 6;
  }
}
