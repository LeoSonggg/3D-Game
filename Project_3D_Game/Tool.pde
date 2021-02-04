void button(float x, float y, float Width, float Height, float textSize, String label) {
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  if(mouseX > x-Width/2 && mouseX < x+Width/2 && mouseY > y-Height/2 && mouseY < y+Height/2){
    fill(0);
    rect(x,y,Width,Height);
    fill(255);
    textSize(textSize);
    text(label, x, y);
  }
  else {
    fill(255);
    rect(x,y,Width,Height);
    fill(0);
    textSize(textSize);
    text(label, x, y);
  }
}

void button(float x, float y, float Width, float Height, float textSize, color rectFill, color textFill, String label) {
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  if(mouseX > x-Width/2 && mouseX < x+Width/2 && mouseY > y-Height/2 && mouseY < y+Height/2){
    fill(textFill);
    rect(x,y,Width,Height);
    fill(rectFill);
    textSize(textSize);
    text(label, x, y);
  }
  else {
    fill(rectFill);
    rect(x,y,Width,Height);
    fill(textFill);
    textSize(textSize);
    text(label, x, y);
  }
}

void buttonPause(float x, float y, float Width, float Height) {
  rectMode(CENTER);
  textAlign(CENTER,CENTER);
  if(mouseX > x-Width/2 && mouseX < x+Width/2 && mouseY > y-Height/2 && mouseY < y+Height/2){
    fill(0);
    rect(x-Width/4,y,Width/3,Height);
    rect(x+Width/4,y,Width/3,Height);
    fill(255);
  }
  else {
    fill(255);
    rect(x-Width/4,y,Width/3,Height);
    rect(x+Width/4,y,Width/3,Height);
    fill(0);
  }
}

boolean buttonPressed(float x, float y, float Width, float Height) {
  if(mouseX > x-Width/2 && mouseX < x+Width/2 && mouseY > y-Height/2 && mouseY < y+Height/2)
    return true;
  else 
    return false;
}
