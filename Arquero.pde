class Arquero extends Unidad{
  
  public Arquero(PVector pos, PImage sprite, String nombre, String raza, int armadura, int costoOro, boolean esEnemigo){
    super(pos, sprite, nombre, raza, armadura, costoOro, esEnemigo); 
    this.vida = 250;
    this.danio = 25;
    this.velocidadAtaque = 14;
    this.velocidadMovimiento = 8;
  }
  
  
  
  
  
  
  
  
  
  
  
  
}
