class GestorUnidades {

  /*private ArrayList <Soldado> listaSoldados;
  private ArrayList <Mago> listaMagos;
  private ArrayList <Arquero> listaArqueros;*/
  ArrayList<Unidad> unidadesAliadas;
  ArrayList<Unidad> unidadesEnemigas;

  

  SpriteRenderer spriteUnidad;
  Transform transformUnidad;



  /*public GestorUnidades() {
    this.listaSoldados = new ArrayList<Soldado>();
    this.listaMagos = new ArrayList<Mago>();
    this.listaArqueros = new ArrayList<Arquero>();
  }*/


  /*public void agregarSoldado() {
    Soldado soldado = new Soldado(x, y, objetivo, colorUnidad);
    listaSoldados.add(soldado);
    println("soldado creado");
  }

  void actualizarUnidades() {
    for (int i = unidades.size() - 1; i >= 0; i--) {
      Unidad unidad = unidades.get(i);
      unidad.mover();
      unidad.mostrar();
      if (unidad.vida <= 0) {
        unidades.remove(i); // Remover unidad si su vida es 0
      }
    }
  }











 /* public void agregarMago(PVector pos) {
    Mago mago = new Mago(new PVector(600,200), new PVector(120,120), sprite, "mago", "elfo", 4, 60, true);
    listaMagos.add(mago);
    println("mago creado");
  }

  public void agregarArquero(PVector pos) {
    Arquero arquero = new Arquero(new PVector(600,200), new PVector(120,120), sprite, "arquero", "elfo", 4, 60, true);
    listaArqueros.add(arquero);
    println("arquero creado");
  }*/
}
