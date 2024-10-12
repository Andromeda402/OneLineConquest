class GestorUnidades {

  private ArrayList <Soldado> listaSoldados;
  private ArrayList <Mago> listaMagos;
  private ArrayList <Arquero> listaArqueros;

  PImage sprite = loadImage("Jugador.jpg");



  public GestorUnidades() {
    this.listaSoldados = new ArrayList<Soldado>();
    this.listaMagos = new ArrayList<Mago>();
    this.listaArqueros = new ArrayList<Arquero>();
  }


  public void agregarSoldado(PVector pos) {
    Soldado soldado = new Soldado(pos, sprite, "soldado", "humano", 4, 60, true);
    listaSoldados.add(soldado);
    println("soldado creado");
  }

  public void actualizarSoldados() {
    for (Soldado soldado : listaSoldados) { 
      soldado.display();
    }
  }

  public void agregarMago(PVector pos) {
    Mago mago = new Mago(pos, sprite, "mago", "elfo", 4, 60, true);
    listaMagos.add(mago);
    println("mago creado");
  }

  public void agregarArquero(PVector pos) {
    Arquero arquero = new Arquero(pos, sprite, "arquero", "elfo", 4, 60, true);
    listaArqueros.add(arquero);
    println("arquero creado");
  }
}
