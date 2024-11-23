import gifAnimation.*;

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

//Archivo de Processing para el proyecto
boolean holaBorrar;
int estadoJuego;
GestorUnidades gestorUnidades;
int holaBorrar2;
Edificio baseAliada;
Edificio baseEnemiga;
Jugador jugador1;
MinaDeOro minaAliada;
MinaDeOro minaEnemiga;
ArrayList<Unidad> unidades;
SpriteRenderer sprite;
PImage soldadoPrueba;

Minim minim;

AudioPlayer musicaVictoria;

Gif gif;



void setup() {

  size(1200, 800);
  gestorUnidades = new GestorUnidades();
  //soldado.displayRender();
  //soldado.cambiarImagen("Soldado.jpg");
  soldadoPrueba = loadImage("Soldado.png");
  estadoJuego = 0;
  
  minim = new Minim(this);
  
  gif = new Gif(this,"animacion.gif");
  
  
  
  this.musicaVictoria = minim.loadFile("musicaVictoria.mp3");
  
  baseAliada = new Edificio(width / 4, height / 2, color(0, 0, 255)); // Base aliada
  baseEnemiga = new Edificio(3 * width / 4, height / 2, color(255, 0, 0)); // Base enemiga
  jugador1 = new Jugador(baseAliada, color(0, 0, 255), 1000); // Jugador 1 empieza con 100 de oro
  minaAliada = new MinaDeOro(width / 4, height / 2 + 200, color(0, 0, 255)); // Mina de oro aliada
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
  
  imageMode(CENTER);
  image(gif,width/2,height/2);
  gif.play();
}

void jugando() {
  //gestorUnidades.actualizarSoldados();
    // Dibujar bases y minas
    
  
    
  baseAliada.mostrar();
  baseEnemiga.mostrar();
  minaAliada.mostrar();


  // Generar oro para ambos jugadores
  minaAliada.generarOro(jugador1);

baseEnemiga.actualizarBaseEnemiga(unidades,baseAliada);

  // Manejar entrada del jugador
  jugador1.manejarEntrada(unidades);
 
   for (int i = unidades.size() - 1; i >= 0; i--) { // Itera en reversa para eliminar unidades
      Unidad unidad = unidades.get(i); // Obtiene la unidad actual de la lista
      unidad.mover(unidades);                  // Mueve la unidad
      unidad.mostrar();                // Muestra la unidad
      
      
      
      unidad.mostrarInformacion();
      unidad.mostrarInterfazUnidad();
      
      unidad.collider.dibujarCollider();
      
      
      if (unidad.estaMuerto()) { 
        //sprite.mostrarAnimacion(3);

        unidades.remove(i);            // Remover unidad si su vida es 0
      }
    }

  
  
  
  

  
  
  
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
    estadoJuego = MaquinaEstadosJuego.VICTORIA;
    //noLoop();  // Detener el bucle de juego si se destruye la base
  }

  // Mostrar oro de los jugadores
  fill(0);
  textSize(20);
  textAlign(LEFT);
  text("Oro Jugador 1: " + jugador1.oro, 10, 20);
  textAlign(RIGHT);
}





void victoria() {
  
  
  
  musicaVictoria.play();


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
