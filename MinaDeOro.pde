class MinaDeOro extends Edificio {
  int produccionOro = 1;  // Oro que produce por ciclo
  int intervaloProduccion = 1000;  // Intervalo de producción en milisegundos
  int ultimoTiempoProduccion = 0;

  MinaDeOro(float x, float y, color colorBase) {
    super(x, y, colorBase);
  }

  void generarOro(Jugador jugador) {
    // Generar oro para el jugador si ha pasado el intervalo de producción
    if (millis() - ultimoTiempoProduccion >= intervaloProduccion) {
      jugador.oro += produccionOro;
      ultimoTiempoProduccion = millis();
      println("Generando " + produccionOro + " oro para el jugador con base de color: " + colorBase);
    }
  }

  @Override
  void mostrar() {
    fill(255, 215, 0);  // Color dorado para la mina de oro
    rectMode(CENTER);
    rect(this.transform.posicion.x, this.transform.posicion.y, 40, 40);  // Dibujar la mina
    fill(0);
    textSize(30);
    textAlign(CENTER);
    text("Mina de Oro", this.transform.posicion.x, this.transform.posicion.y + 60);  // Mostrar nombre del edificio
  }
}
