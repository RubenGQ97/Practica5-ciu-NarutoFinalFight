
  import ddf.minim.*;

jutsu chidori;
jutsu rasengan;
PShape plano;
PImage rio,roja,valle,sangre;
PShape luna;
float x,y,z;
boolean eclipse,avanzar,retroceder,derecha,izquierda,subir,bajar,fin,instrucciones,activa1,activa2,t;
  Minim sonido;
  AudioSample sound;
  AudioSample sound2;
  AudioSample sound3;
  AudioSample sound4;
  
void setup(){
size(800,800,P3D);
sonido = new Minim(this);
sound= sonido.loadSample("rasengan.mp3",1024);
  sound2= sonido.loadSample("chidori.mp3",1024);
  sound3= sonido.loadSample("jutsu.mp3",1024);
  sound4= sonido.loadSample("best.mp3",120);
  
x=0;
y=0;
z=-0;
t=false;
activa1=false;
activa2=false;
fin=false;
eclipse=false;
chidori= new jutsu(1);
rasengan= new jutsu(0);
//valle = loadImage("valle.jpg");
rio = loadImage("agua.jpg");
roja = loadImage("luna2.jpg");
sangre = loadImage("luna3.png");
    beginShape();
    luna= createShape(SPHERE,70);
    luna.setTexture(roja);
    luna.setStroke(255);
      endShape();
      sound4.trigger();
}



void draw(){
    
  if(t)secuenciaFinal();
  //valle.resize(width,height);
  background(0);
  //pushMatrix();
  translate(x,y,z);
  //popMatrix();
  if(activa1)chidori.drawJutsu();
  if(activa2)rasengan.drawJutsu();
  dibujar();
  if(t==false)actualizaCamara();
  if(rasengan.fin())if(chidori.fin())fin=true;
  mostrarMenu();
 println(x+"  "+y+"  "+z+"  ");
 if(rasengan.esFinal() && chidori.esFinal()){
   
 x=0;
y=0;
z=-0;
t=false;
activa1=false;
activa2=false;
fin=false;
eclipse=false;
chidori= new jutsu(1);
rasengan= new jutsu(0);
 
 }
  
  
  


}


void keyPressed(){
  if(key == 'a' && activa2|| key == 'A' && activa2) {
  rasengan.aumenta();
  sound3.trigger();
  }
  if(key == 'l' && activa1 || key == 'L' && activa1){
  chidori.aumenta();
  sound3.trigger();
  } 
  if(keyCode == ENTER) eclipse=!eclipse;
  if(key == 'w' && fin|| key == 'W' && fin) avanzar=true;
  if(key == 's' && fin|| key == 'S' && fin) retroceder=true;
  if(keyCode == BACKSPACE && fin) t=true;
  if(keyCode == UP && fin) subir=true;
  if(keyCode == DOWN && fin) bajar=true;
  if(keyCode == RIGHT && fin) derecha=true;
  if(keyCode == LEFT && fin) izquierda=true;
  if(key == 'r'|| key == 'R') {
  sound.trigger();
  activa2=true;
  }
  if(key == 'c'|| key == 'C') {
    sound2.trigger();
    activa1=true;
  }
}

void keyReleased(){
  if(key == 'w' && fin|| key == 'W' && fin) avanzar=false;
  if(key == 's' && fin|| key == 'S' && fin) retroceder=false;
  if(keyCode == UP && fin) subir=false;
  if(keyCode == DOWN && fin) bajar=false;
  if(keyCode == RIGHT && fin) derecha=false;
  if(keyCode == LEFT && fin) izquierda=false;
}

void dibujar(){
  pushMatrix();
    
    noStroke();
    beginShape();
    translate(width / 2, height);
  beginShape();
  if(eclipse){
    lights();
  }
  
  texture(rio);
  vertex(-1000, -1000, -60, 0,   0);
  vertex( 1000, -1000, -60, 1000, 0);
  vertex( 1000,  1000, -60, 1000, 1000);
  vertex(-1000,  1000, -60, 0,   1000);
  rotateX(80);
    endShape();
  popMatrix();
  


    noStroke();
    pushMatrix();
      translate(width/2,height/6,0);
      
        if(!eclipse){
          rotateY(radians(200));
          luna.setTexture(roja);
            float val =( float )width/ ( float ) width *( float ) 255;
            ambientLight ( ( int ) val , 0 , 0 ) ;
            directionalLight (50 , 200 , 50 , -1, 0 , 0 ) ;
            
            }else{
              rotateY(radians(120));
              rotateX(radians(40));
              luna.setTexture(sangre);
              lights();
            }
      shape(luna);
    popMatrix();
    
    
   
}


void actualizaCamara(){
  if(avanzar)z+=2;
  if(retroceder)z-=2;
  if(derecha && x-2>-38)x-=2;
  if(izquierda && x+2<-100)x+=2;
  if(subir && y+2<240)y+=2;
  if(bajar  && y-2>-320)y-=2;

}

void secuenciaFinal(){
  rasengan.terminal();
  chidori.terminal();
}

void mostrarMenu(){
  if(t==false){
  textSize(40);
     text("Pulsa 'Enter' para poner modo eclipse",20,40);
     println("aaaa:     "+fin);
  if(fin==false){
  
     if(!activa2){
     text("R: Para iniciar ataque derecho",20,height-120);
     }else{
     text("A: Para cargar el ataque derecho",20,height-120);
     }
     
     if(!activa1){
     text("C: Para iniciar ataque izquierdo",20,height-60);
     }else{
     text("L: Para cargar el ataque izquierdo",20,height-60);
     }
  }else{
  textSize(16);
  text("W: Para avanzar con la camara",20,height-60);
  text("S: Para retroceder con la camara",20,height-80);
  text("UP: Para subir con la camara",20,height-100);
  text("DOWN: Para bajar con la camara",20,height-120);
  text("RIGHT: Para ir a la derecha con la camara",20,height-140);
  text("LEFT: Para ir a la izquierda con la camara",20,height-160);
  text("BACKSPACE: Para ejecutar secuencia final",20,height-180);
  }
  

  }

 }
