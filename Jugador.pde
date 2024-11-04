class Jugador {
  Edificio base;
  Boton botonSoldado;
  Boton botonMago;
  Boton botonArquero;
  color colorUnidad;
  int oro;

  Jugador(Edificio base, color colorUnidad, int oroInicial) {
    this.base = base;
    this.colorUnidad = colorUnidad;
    this.oro = oroInicial;

    this.botonSoldado = new Boton(70, 200, "Reclutar Soldado", "ReclutarSoldado.png", 2);
    this.botonMago = new Boton(70, 340, "Reclutar Mago", "ReclutarMago.png", 10);
    this.botonArquero = new Boton(70, 480, "Reclutar Arquero", "ReclutarArquera.png", 5);
  }

  void manejarEntrada() {
     if (base.colorBase == color(0, 0, 255)) {
    dibujarBotones();

    if (botonSoldado.estaPresionado()) {
      comprarSoldado();
    }
    if (botonMago.estaPresionado()) {
      comprarMago();
    }
    if (botonArquero.estaPresionado()) {
      comprarArquero();
    }
     }
     
       // Jugador 2
    if (base.colorBase == color(255, 0, 0)) {
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

  void comprarSoldado() {
    if (oro >= Precio.SOLDADO) {
      oro -= Precio.SOLDADO;
      base.unidades.add(new Soldado(base.x, base.y, (base.colorBase == color(0, 0, 255)) ? baseEnemiga : baseAliada, colorUnidad));
      println("Soldado comprado! Oro restante: " + oro);
    } else {
      println("No hay suficiente oro para comprar un Soldado!");
    }
  }

  void comprarMago() {
    if (oro >= Precio.MAGO) {
      oro -= Precio.MAGO;
      base.unidades.add(new Mago(base.x, base.y, (base.colorBase == color(0, 0, 255)) ? baseEnemiga : baseAliada, colorUnidad));
      println("Mago comprado! Oro restante: " + oro);
    } else {
      println("No hay suficiente oro para comprar un Mago!");
    }
  }

  void comprarArquero() {
    if (oro >= Precio.ARQUERA) {
      base.unidades.add(new Arquero(base.x, base.y, (base.colorBase == color(0, 0, 255)) ? baseEnemiga : baseAliada, colorUnidad));
       oro -= Precio.ARQUERA;
      println("Arquero comprado! Oro restante: " + oro);
    } else {
      println("No hay suficiente oro para comprar un Arquero!");
    }
  }

  void dibujarBotones() {
    botonSoldado.dibujarBoton();
     noTint();
    botonMago.dibujarBoton();
     noTint();
    botonArquero.dibujarBoton();
    noTint();
  }
}
