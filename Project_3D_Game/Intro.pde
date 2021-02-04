void intro() {

  background(0);

  if(alphaCountIntro % 320 < 160) {
    alphaIntro -= alphaRateIntro;
    alphaCountIntro++;
      }
  else {
    alphaIntro += alphaRateIntro;
    alphaCountIntro++;
  }
  
  fill(255, alphaIntro);
  textSize((width+height)/16);
  text("Stop Christmas", width/2, height/4);
  
  button(width/2,height*21/32,width/2,height/16,(width+height)/45,"START");
 

}

void introClicks() {
  if(buttonPressed(width/2,height*21/32,width/2,height/16)) {
    setup();
    mode = GAME;
  }
}

void introPressed() {
  
}

void introReleased() {
  
}
  
