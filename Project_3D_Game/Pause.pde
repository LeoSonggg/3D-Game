void pause() {
  //background(0,10);
  
  fill(0);
  textSize(100);
  text("PAUSE", 400, 200);
  
  button(400,525,200,50,25,"RESUME");
}

void pauseClicks() {
  if(buttonPressed(400,525,200,50))
     mode = GAME;  
}

void pausePressed() {
  
}

void pauseReleased() {
  
}
