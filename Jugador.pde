class Jugador {

  /*ATRIBUTOS*/
  
  Edificio base;      // Base para cada jugador
  Boton botonSoldado; // Boton para reclutar Soldado
  Boton botonMago;    // Boton para reclutar Mago
  Boton botonArquero; // Boton para reclutar Arquero
  color colorUnidad;  // Color de la unidad
  int oro;            // Cantidad de oro inicial que tiene cada Jugador

  /*-CONSTRUCTORES-*/

  //Constructor parametrizado
  Jugador(Edificio base, color colorUnidad, int oroInicial) {
    this.base = base;                // Asigna la base para cada jugador
    this.colorUnidad = colorUnidad;  // Asigna el color de las unidades
    this.oro = oroInicial;           // Asigna el oro inicial
    
    //Se inicializan los botones para reclutar a las unidades con sus respectivas posiciones, sprites y el tiempo de recarga
    this.botonSoldado = new Boton(70, 200, "Reclutar Soldado", "ReclutarSoldado.png", 2);
    this.botonMago = new Boton(70, 340, "Reclutar Mago", "ReclutarMago.png", 10);
    this.botonArquero = new Boton(70, 480, "Reclutar Arquero", "ReclutarArquera.png", 5);
  }


  /*-METODOS-*/
  
  //Metodo para manejar el celutamiento de las unidades
  void manejarEntrada() {
    //Jugador 1 (azul) usa los botones para reclutar
    if (base.colorBase == color(0, 0, 255)) {
      dibujarBotones(); //Dibuja los botones en pantalla
      
      
      //Recluta Soldado si el cursor esta presionado
      if (botonSoldado.estaPresionado()) {
        comprarSoldado();
      }
      //Recluta Mago si el cursor esta presionado
      if (botonMago.estaPresionado()) {
        comprarMago();
      }
      //Recluta Arquero si el cursor esta presionado
      if (botonArquero.estaPresionado()) {
        comprarArquero();
      }
    }

    // Jugador 2 (rojo) usa teclas para presionar 
    if (base.colorBase == color(255, 0, 0)) {
      //Se agregan condiciones para verificar que la tecla este presionada 
      //tambien se incluye "o" en cada condicion para incluir minusculas y mayusculas
      if (keyPressed && (key == 'i' || key == 'I')) {
        comprarSoldado();
      }
      if (keyPressed && (key == 'k' || key == 'K')) {
        comprarMago();
      }
      if (keyPressed && (key == 'l' || key == 'L')) {
        comprarArquero();
      }
    }
  }
  
  //Metodo para comprar Soldado
  void comprarSoldado() {
    if (oro >= Precio.SOLDADO) { // Verifica si el jugador tiene suficiente oro
      oro -= Precio.SOLDADO;
      base.unidades.add(new Soldado(base.x, base.y, (base.colorBase == color(0, 0, 255)) ? baseEnemiga : baseAliada, colorUnidad));
      println("Soldado comprado! Oro restante: " + oro);
    } else {
      println("No hay suficiente oro para comprar un Soldado!");
    }
  }
  
  //Metodo para comprar Mago
  void comprarMago() {
    if (oro >= Precio.MAGO) { // Verifica si el jugador tiene suficiente oro
      oro -= Precio.MAGO;
      base.unidades.add(new Mago(base.x, base.y, (base.colorBase == color(0, 0, 255)) ? baseEnemiga : baseAliada, colorUnidad));
      println("Mago comprado! Oro restante: " + oro);
    } else {
      println("No hay suficiente oro para comprar un Mago!");
    }
  }
  
  //Metodo para comprar Arquero
  void comprarArquero() {
    if (oro >= Precio.ARQUERA) { // Verifica si el jugador tiene suficiente oro
      base.unidades.add(new Arquero(base.x, base.y, (base.colorBase == color(0, 0, 255)) ? baseEnemiga : baseAliada, colorUnidad));
      oro -= Precio.ARQUERA;
      println("Arquero comprado! Oro restante: " + oro);
    } else {
      println("No hay suficiente oro para comprar un Arquero!");
    }
  }
  
  //Metodo para dibujar los botones en pantalla
  void dibujarBotones() {
    botonSoldado.dibujarBoton(); // Dibuja el boton del soldado
    noTint();
    botonMago.dibujarBoton();    // Dibuja el boton del mago
    noTint();
    botonArquero.dibujarBoton(); //Dibuja el boton del arquero
    noTint();
  }
}
