// This program creates a bunch of pumpkins using an arrays of integers

import processing.sound.*;
SoundFile carving; // a sound for carving the pumpkin
SoundFile FireIgnite; //a sound for lighting up the jack'o'lantern
int [] pumpkinColor = {}; //the color of the pumpkin
int [] pumpkinX = {}; //the x coordinate of the pumpkin
int [] pumpkinY = {}; //the y coordinate of the pumpkim
int [] pumpkinSize = {}; //the size of the pumpkin
int [] pumpkinMode = {}; //what type of pumpkin that will be drawn
int [] pumpkinDif = {}; //changes the width and height of the pumpkin
int [] stemColor = {}; //the color of the stem
boolean pumpkinLight = false ; //if the light is on or not
boolean jackolantern; //if it is is carved or not
color light; 
void setup() { 
  size(1000, 800);
  carving = new SoundFile(this, "carving.mp3");
  FireIgnite = new SoundFile(this, "FireIgnite.mp3");
  for (int c=0; c<25; c+=1) { //making random numbers in the arrays
    pumpkinX = append(pumpkinX, int(random(0, 1000)));
    pumpkinY = append(pumpkinY, int(random(400, 800)));
    pumpkinSize = append(pumpkinSize, int(random(25, 50)));
    pumpkinColor = append(pumpkinColor, int(random(175, 255)));
    pumpkinMode = append(pumpkinMode, int(random(1, 4)));
    pumpkinDif = append(pumpkinDif, int(random(1.1, 1.4)*10));
    stemColor = append(stemColor, int(random(70, 120)));
  }
  println(pumpkinMode);
}
void draw() {
  background(20);
  fill(30, 85, 10);
  rectMode(CORNER);
  noStroke();
  rect(0, height/2, width, height); //making the grass
  
  
  for (int s = 0; s<25; s+=1) {
    //making a lightup function before making the pumpkin so that the pumpkin colors aren't muddled.
    if (pumpkinLight == true&& jackolantern ==true) { //if the pumpkin is a jackolantern and if it is lit up
      for (int c = 1; c<50; c+=1) {
        noStroke();
        fill(255, 255, 0, 1);
        ellipse(pumpkinX[s], pumpkinY[s], pumpkinSize[s]*c/5, pumpkinSize[s]*c/5); //creates a light effect 
        light = color(255, 255, 0); //changes color to zero.
      }
    }
    else {
      light = color(0);
    }
      
    
  }
  for (int n = 0; n<25; n+=1) {
    rectMode(CENTER);

    if (pumpkinMode[n] == 1) { //if the pumpkin is wider than it is tall
      //making the pumpkins 
      noStroke();
      fill(stemColor[n], stemColor[n]*5/7, stemColor[n]*3/7);
      rect(pumpkinX[n], (pumpkinY[n]-pumpkinSize[n]/2), pumpkinSize[n]/3, pumpkinSize[n]/2); //stem
      fill(pumpkinColor[n], pumpkinColor[n]/2, 10);
      rect(pumpkinX[n], pumpkinY[n], pumpkinSize[n]*pumpkinDif[n]/10, pumpkinSize[n], 50);
      for (int s = 4; s>0; s--) { //making the grooves
        stroke(pumpkinColor[n]-5, (pumpkinColor[n]/2)-5, 5);
        strokeWeight(3);
        rect(pumpkinX[n], pumpkinY[n], (pumpkinSize[n]*pumpkinDif[n]/10)*s/4, pumpkinSize[n], 50);
      }

      if (jackolantern == true){
      //drawing the jack-o-lantern
      noStroke();
      fill(light); 
      //making the mouth and eye holes
      triangle( pumpkinX[n]-pumpkinSize[n]/5, pumpkinY[n]-pumpkinSize[n]/5, (pumpkinX[n]-pumpkinSize[n]/5)-pumpkinSize[n]/6, pumpkinY[n]-pumpkinSize[n]/6-pumpkinSize[n]/6, (pumpkinX[n]-pumpkinSize[n]/5)+pumpkinSize[n]/6, (pumpkinY[n]-pumpkinSize[n]/6)-pumpkinSize[n]/6 );
      triangle( pumpkinX[n]+pumpkinSize[n]/5, pumpkinY[n]-pumpkinSize[n]/5, (pumpkinX[n]+pumpkinSize[n]/5)-pumpkinSize[n]/6, pumpkinY[n]-pumpkinSize[n]/6-pumpkinSize[n]/6, (pumpkinX[n]+pumpkinSize[n]/5)+pumpkinSize[n]/6, (pumpkinY[n]-pumpkinSize[n]/6)-pumpkinSize[n]/6 );
      arc(pumpkinX[n], pumpkinY[n], pumpkinSize[n]*pumpkinDif[n]/10*0.8, pumpkinSize[n]*0.8, 0, PI, CHORD );
      //making the teeth
      fill(pumpkinColor[n], pumpkinColor[n]/2, 10);
      rect(pumpkinX[n]-pumpkinSize[n]*pumpkinDif[n]/50, pumpkinY[n], pumpkinSize[n]*pumpkinDif[n]/100, pumpkinSize[n]*0.2);
      rect(pumpkinX[n]+pumpkinSize[n]*pumpkinDif[n]/50, pumpkinY[n], pumpkinSize[n]*pumpkinDif[n]/100, pumpkinSize[n]*0.2);
      rect(pumpkinX[n], pumpkinY[n]+pumpkinSize[n]*0.4, pumpkinSize[n]*pumpkinDif[n]/50, pumpkinSize[n]*0.2);
      }
    } else if (pumpkinMode[n] == 2) { //if the pumpkin is taller than it is wide
      noStroke();
      fill(stemColor[n], stemColor[n]*5/7, stemColor[n]*3/7);
      rect(pumpkinX[n], (pumpkinY[n]-pumpkinSize[n]/2), pumpkinSize[n]/4, pumpkinSize[n]); //stem
      fill(pumpkinColor[n], pumpkinColor[n]/2, 10);
      rect(pumpkinX[n], pumpkinY[n], pumpkinSize[n], pumpkinSize[n]*pumpkinDif[n]/10, 30);
      for (int s = 4; s>0; s--) { //making the grooves
        noFill();
        stroke(pumpkinColor[n]-5, (pumpkinColor[n]/2)-5, 5);
        strokeWeight(3);
        rect(pumpkinX[n], pumpkinY[n], pumpkinSize[n]*s/4, pumpkinSize[n]*pumpkinDif[n]/10, 30);
      }
      if (jackolantern == true){
      //drawing the jack-o-lantern
      noStroke();
      fill(light); 
      //making the mouth and eye holes
      triangle( pumpkinX[n]-pumpkinSize[n]/5, pumpkinY[n]-pumpkinSize[n]/5, (pumpkinX[n]-pumpkinSize[n]/5)-pumpkinSize[n]/6, pumpkinY[n]-pumpkinSize[n]/6-pumpkinSize[n]/6, (pumpkinX[n]-pumpkinSize[n]/5)+pumpkinSize[n]/6, (pumpkinY[n]-pumpkinSize[n]/6)-pumpkinSize[n]/6 );
      triangle( pumpkinX[n]+pumpkinSize[n]/5, pumpkinY[n]-pumpkinSize[n]/5, (pumpkinX[n]+pumpkinSize[n]/5)-pumpkinSize[n]/6, pumpkinY[n]-pumpkinSize[n]/6-pumpkinSize[n]/6, (pumpkinX[n]+pumpkinSize[n]/5)+pumpkinSize[n]/6, (pumpkinY[n]-pumpkinSize[n]/6)-pumpkinSize[n]/6 );
      arc(pumpkinX[n], pumpkinY[n], pumpkinSize[n]*0.8, pumpkinSize[n]*0.8, 0, PI, CHORD ); 
      //making the teeth
      fill(pumpkinColor[n], pumpkinColor[n]/2, 10);
      rect(pumpkinX[n]-pumpkinSize[n]*pumpkinDif[n]/50, pumpkinY[n], pumpkinSize[n]*pumpkinDif[n]/100, pumpkinSize[n]*0.2);
      rect(pumpkinX[n]+pumpkinSize[n]*pumpkinDif[n]/50, pumpkinY[n], pumpkinSize[n]*pumpkinDif[n]/100, pumpkinSize[n]*0.2);
      rect(pumpkinX[n], pumpkinY[n]+pumpkinSize[n]*0.4, pumpkinSize[n]*pumpkinDif[n]/50, pumpkinSize[n]*0.2);
      }
    } else if (pumpkinMode[n] == 3) { //the "8" pumpkin shape 
      noStroke();
      fill(stemColor[n], stemColor[n]*5/7, stemColor[n]*3/7);
      rect(pumpkinX[n], (pumpkinY[n]-pumpkinSize[n]*1.5)+pumpkinSize[n]/5, pumpkinSize[n]/4, pumpkinSize[n]/1.5); //stem
      fill(pumpkinColor[n], pumpkinColor[n]/2, 10);
      rect(pumpkinX[n], pumpkinY[n]-pumpkinSize[n]+pumpkinSize[n]/5, pumpkinSize[n]/1.3, pumpkinSize[n]/1.3*pumpkinDif[n]/10, 30);
      for (int s = 4; s>0; s--) { //making the grooves
        stroke(pumpkinColor[n]-5, (pumpkinColor[n]/2)-5, 5);
        strokeWeight(3);
        rect(pumpkinX[n], pumpkinY[n]-pumpkinSize[n]+pumpkinSize[n]/5, pumpkinSize[n]*s/4/1.3, pumpkinSize[n]*pumpkinDif[n]/10/1.3, 30);
      }
      noStroke();
      fill(pumpkinColor[n], pumpkinColor[n]/2, 10);
      rect(pumpkinX[n], pumpkinY[n], pumpkinSize[n]*pumpkinDif[n]/10, pumpkinSize[n], 50);
      for (int s2 = 4; s2>0; s2--) {
        stroke(pumpkinColor[n]-5, (pumpkinColor[n]/2)-5, 5);
        strokeWeight(3);
        rect(pumpkinX[n], pumpkinY[n], (pumpkinSize[n]*pumpkinDif[n]/10)*s2/4, pumpkinSize[n], 50);
      }
      if (jackolantern == true){
      //drawing the jack-o-lantern
      noStroke();
      fill(light); 
      //making the mouth and eye holes
      triangle( pumpkinX[n]-pumpkinSize[n]/5, pumpkinY[n]-pumpkinSize[n]/5, (pumpkinX[n]-pumpkinSize[n]/5)-pumpkinSize[n]/6, pumpkinY[n]-pumpkinSize[n]/6-pumpkinSize[n]/6, (pumpkinX[n]-pumpkinSize[n]/5)+pumpkinSize[n]/6, (pumpkinY[n]-pumpkinSize[n]/6)-pumpkinSize[n]/6 );
      triangle( pumpkinX[n]+pumpkinSize[n]/5, pumpkinY[n]-pumpkinSize[n]/5, (pumpkinX[n]+pumpkinSize[n]/5)-pumpkinSize[n]/6, pumpkinY[n]-pumpkinSize[n]/6-pumpkinSize[n]/6, (pumpkinX[n]+pumpkinSize[n]/5)+pumpkinSize[n]/6, (pumpkinY[n]-pumpkinSize[n]/6)-pumpkinSize[n]/6 );
      arc(pumpkinX[n], pumpkinY[n], pumpkinSize[n]*pumpkinDif[n]/10*0.8, pumpkinSize[n]*0.8, 0, PI, CHORD );
      //making the teeth
      fill(pumpkinColor[n], pumpkinColor[n]/2, 10);
      rect(pumpkinX[n]-pumpkinSize[n]*pumpkinDif[n]/50, pumpkinY[n], pumpkinSize[n]*pumpkinDif[n]/100, pumpkinSize[n]*0.2);
      rect(pumpkinX[n]+pumpkinSize[n]*pumpkinDif[n]/50, pumpkinY[n], pumpkinSize[n]*pumpkinDif[n]/100, pumpkinSize[n]*0.2);
      rect(pumpkinX[n], pumpkinY[n]+pumpkinSize[n]*0.4, pumpkinSize[n]*pumpkinDif[n]/50, pumpkinSize[n]*0.2);
    }
    }
  }
      noStroke();
      fill(100, 100*5/7, 100*3/7);
      rect(900, 75, 12, 25); //stem
      fill(200,100,10);
      rect(900, 100, 50, 50,50);
      for (int s = 4; s>0; s--) {
        stroke(195, 95, 5);
        strokeWeight(3);
        rect(900, 100, 50*s/4, 50, 50);
      }
        if (jackolantern == true){
          //drawing the jack-o-lantern button to the right
          noStroke();
          fill(0); 
          //making the mouth and eye holes
          triangle( 900-50/5, 100-50/5, (900-50/5)-50/6, 100-50/6-50/6, (900-50/5)+50/6, (100-50/6)-50/6 );
          triangle( 900+50/5, 100-50/5, (900+50/5)-50/6, 100-50/6-50/6, (900+50/5)+50/6, (100-50/6)-50/6 );
          arc(900, 100, 50*10/10*0.8, 50*0.8, 0, PI, CHORD );
          //making the teeth
          fill(200,100,10);
          rect(900-10, 100,5, 50*0.2);
          rect(900+10, 100, 5, 50*0.2);
          rect(900, 100+50*0.4, 10, 50*0.2);
        }
      //drawing the jack-o-lantern button to the left
      noStroke();
      fill(100, 100*5/7, 100*3/7);
      rect(700, 75, 12, 25); //stem
      fill(200,100,10);
      rect(700, 100, 50, 50,50);
      for (int s = 4; s>0; s--) {
        stroke(195, 95, 5);
        strokeWeight(3);
        rect(700, 100, 50*s/4, 50, 50);
      }
          noStroke();
          if (pumpkinLight == false){
            fill(0);
          }
          else if (pumpkinLight ==true){
            fill(255,255,0);
          }
          //making the mouth and eye holes
          triangle( 700-50/5, 100-50/5, (700-50/5)-50/6, 100-50/6-50/6, (700-50/5)+50/6, (100-50/6)-50/6 );
          triangle( 700+50/5, 100-50/5, (700+50/5)-50/6, 100-50/6-50/6, (700+50/5)+50/6, (100-50/6)-50/6 );
          arc(700, 100, 50*10/10*0.8, 50*0.8, 0, PI, CHORD );
          //making the teeth
          fill(200,100,10);
          rect(700-10, 100,5, 50*0.2);
          rect(700+10, 100, 5, 50*0.2);
          rect(700, 100+50*0.4, 10, 50*0.2);
         
         //directions
         textAlign(CENTER, TOP);
         textSize(16);
         text("Click on the \n pumpkin above to  \n make the pumpkins \n jack'o'lanterns!", 900, 150);
         text("Click on the \n pumpkin above \n to make the \njack'o'lanterns lit up!", 700, 150);
        }


void mousePressed() {
  if ( (dist(mouseX,mouseY,900,100) < 50) && jackolantern ==false ){ //if you click on the button to the right, it will toggle between being a jackolantern and not being one.
    jackolantern =true;
    carving.play();
  }
  else if ( (dist(mouseX,mouseY,900,100) < 50) && jackolantern ==true ){
    jackolantern =false;
    carving.play();
  }
  else if ( (dist(mouseX,mouseY,700,100) < 50) && jackolantern ==true && pumpkinLight == false){ //if you click on the button to the left, it will toggle between being lit up as a jackolantern and not being lit up as a jackolantern
    pumpkinLight =true;
    FireIgnite.play();
  }
  else if ( (dist(mouseX,mouseY,700,100) < 50) && jackolantern ==true && pumpkinLight == true){
    pumpkinLight =false;
    FireIgnite.play();
  }
  }
