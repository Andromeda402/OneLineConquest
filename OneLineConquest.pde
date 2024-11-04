//Archivo de Processing para el proyecto

int estadoJuego;
GestorUnidades gestorUnidades;

Edificio baseAliada;
Edificio baseEnemiga;
Jugador jugador1;
Jugador jugador2;
MinaDeOro minaAliada;
MinaDeOro minaEnemiga;
ArrayList<Unidad> unidades;

PImage soldadoPrueba;

void setup() {

  size(1200, 800);
  gestorUnidades = new GestorUnidades();
  //soldado.displayRender();
  //soldado.cambiarImagen("Soldado.jpg");
  soldadoPrueba = loadImage("Soldado.png");
  estadoJuego = 0;
  
  baseAliada = new Edificio(width / 4, height / 2, color(0, 0, 255)); // Base aliada
  baseEnemiga = new Edificio(3 * width / 4, height / 2, color(255, 0, 0)); // Base enemiga
  jugador1 = new Jugador(baseAliada, color(0, 0, 255), 1000); // Jugador 1 empieza con 100 de oro
  jugador2 = new Jugador(baseEnemiga, color(255, 0, 0), 100); // Jugador 2 empieza con 100 de oro
  minaAliada = new MinaDeOro(width / 4, height / 2 + 200, color(0, 0, 255)); // Mina de oro aliada
  minaEnemiga = new MinaDeOro(3 * width / 4, height / 2 + 200, color(255, 0, 0)); // Mina de oro enemiga
  unidades = new ArrayList<Unidad>();
}

void draw() {
  background(255);//limpiapantallas


  switch(estadoJuego) {
  case MaquinaEstadosJuego.MENU:
    menu();
    break;

  case MaquinaEstadosJuego.JUGANDO:
    jugando();
    break;

  case MaquinaEstadosJuego.VICTORIA:
    victoria();
    break;

  case MaquinaEstadosJuego.DERROTA:
    derrota();
    break;
  }
  
}


void menu() {
  fill(#132B50);
  text("HAZ CLICK PARA JUGAR", width/2, height/2, 80);
}

void jugando() {
  //gestorUnidades.actualizarSoldados();
    // Dibujar bases y minas
    
    
    
    
   

  
  
  
  
  
    
  baseAliada.mostrar();
  baseEnemiga.mostrar();
  minaAliada.mostrar();
  minaEnemiga.mostrar();

  // Generar oro para ambos jugadores
  minaAliada.generarOro(jugador1);
  minaEnemiga.generarOro(jugador2);

  // Manejar entrada del jugador
  jugador1.manejarEntrada();
  jugador2.manejarEntrada();
 
  // Actualizar y mostrar unidades
  baseAliada.actualizarUnidades();
  baseEnemiga.actualizarUnidades();
  

  
  
  
  // Comprobar si alguno de los edificios ha sido destruido
  if (baseAliada.vida <= 0) {
    fill(255, 0, 0);
    textSize(32);
    textAlign(CENTER);
    text("¡Base Aliada Destruida!", width / 2, height / 2);
    noLoop();  // Detener el bucle de juego si se destruye la base
  }
  
  if (baseEnemiga.vida <= 0) {
    fill(0, 255, 0);
    textSize(32);
    textAlign(CENTER);
    text("¡Base Enemiga Destruida!", width / 2, height / 2);
    noLoop();  // Detener el bucle de juego si se destruye la base
  }

  // Mostrar oro de los jugadores
  fill(0);
  textSize(20);
  textAlign(LEFT);
  text("Oro Jugador 1: " + jugador1.oro, 10, 20);
  textAlign(RIGHT);
  text("Oro Jugador 2: " + jugador2.oro, width - 10, 20);
}





void victoria() {
}

void derrota() {
}

void mousePressed() {
  if(estadoJuego == 0){
    estadoJuego = 1;
  }
  
  /*if(estadoJuego == 1){
  gestorUnidades.agregarSoldado(new PVector(40, 40));
  //soldado.displayRender();
  //soldado.moverUnidad();
  }*/
  

}
