abstract class Unidad {

  Transform transform;
  SpriteRenderer sprite;
  Collider collider;

  protected String nombre;
  protected String raza;
  protected int vida;
  protected int danio;
  protected int velocidadMovimiento;
  protected int velocidadAtaque;
  protected int distanciaAtaque;
  protected int armadura;
  protected int costoOro;
  protected boolean esEnemigo;


  public Unidad(PVector pos, PImage sprite, String nombre, String raza, int armadura, int costoOro, boolean esEnemigo) {

    this.transform = new Transform(pos, new PVector(1, 1));
    this.collider = new Collider(transform);
    this.sprite = new SpriteRenderer(sprite, this.transform);


    this.nombre = nombre;
    this.raza = raza;
    this.armadura = armadura;
    this.costoOro = costoOro;
    this.esEnemigo = esEnemigo;
  }


  public boolean verificarColision(Unidad otraUnidad) {
    return true;
   
  }
  
  public void display(){
    println("soldado dibujado");
  }

  public void mover () {
  }

  public void atacar() {
  }

  public void morir() {
  }

  public void soltarOro() {
  }

  public void usarHabilidadEspecial() {
  }
}
