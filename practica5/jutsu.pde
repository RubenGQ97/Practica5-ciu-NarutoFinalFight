
class jutsu{
  PShape rasengan;
  PShape [] chidori;
  PImage texturaR,texturaC;
  int longitudR,radio;
  int opcion,fin;
  
  public jutsu(int opcion){
    fin=0;
    texturaR = loadImage("rasengan.png");
    texturaC = loadImage("chidori.jpg");
    longitudR=15;
    this.opcion=opcion;
    if(opcion==1){
      radio=1;
    }else{
    radio=15;
    }
    beginShape();
    setJutsu(opcion);
    endShape();
                 
  }


  void setJutsu(int n){
    
      switch(n){
        case 0 : 
              rasengan= createShape(SPHERE,radio);
              rasengan.setStroke(255);
              rasengan.setTexture(texturaR);
        break;
        case 1 :  

                  chidori= new PShape[31];
                  chidori[30]= createShape(SPHERE,radio);
                  chidori[30].setStroke(color(0,0,255));
                  chidori[30].setTexture(texturaC);
                  
        break;
      }
      
      
  }
  
  
  void drawJutsu(){
    if(opcion==1){
      beginShape();
      //se crean los "rayos" 
     for(int i =0; i <30;i++){
       stroke(59,131,189);
       chidori[i] = createShape(LINE,0,0,random(-longitudR,longitudR),random(-longitudR,longitudR));
       chidori[i].setStroke(3,color(0,0,255));
     }      
       
      endShape();
    //se muestran los "rayos"
    for(int i =0; i <30;i++){
    noStroke();
    pushMatrix();
      translate(width-100-fin,height/2,0);
      rotateY(radians(random(0,255)));
      shape(chidori[i]);
    popMatrix();
    }
    
    //se crea la esfera
    noStroke();
    pushMatrix();
      translate(width-100-fin,height/2,0);      
      rotateY(radians(200));
      shape(chidori[30]);
    popMatrix();
    
    
    
    
    }else{
      
      
    noStroke();
    pushMatrix();
      translate(100+fin,height/2,0);
      rotateY(radians(200));
      shape(rasengan);
    popMatrix();
    
    
    }
     
    
  }


void aumenta(){
  
    if(opcion==0){
      if(radio<45){
      radio+=1;
      setJutsu(opcion);
      }
      
    }else{
      if(radio<31){
        radio+=1;
    longitudR=longitudR+4;
    setJutsu(opcion);
      
      }
    
    
    }



}


boolean fin(){
  if(opcion==0){
      if(radio<45){
        return false;
    
  }
      return true;
      
    }else{
      if(radio<31){
      return false;
      
      }
        return true;
      
      
    
    
    }

}



void terminal(){
      fin+=1;
      
}
  
  boolean esFinal(){
  if(fin>=268){
    if(opcion==1){
      radio=1;
    }else{
    radio=15;
    }
    fin=0;
    return true;

}
  return false;
}

}
