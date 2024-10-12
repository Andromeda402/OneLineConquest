//Archivo de Processing para el proyecto


GestorUnidades gestorUnidades;



void setup(){
  
  size(800,800);
  gestorUnidades = new GestorUnidades();
  
}

void draw(){
  
  gestorUnidades.actualizarSoldados();
  
  
  
  
}

void mousePressed(){
  gestorUnidades.agregarSoldado(new PVector(40,40));
}
