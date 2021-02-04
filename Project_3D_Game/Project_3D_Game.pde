import java.awt.Robot;

int mode;
final int INTRO = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

int hitpoint;

float alphaIntro = 255; //transparency
float alphaRateIntro = 1.59375; //Rate of change for transparency
int alphaCountIntro = 0; //Count number of time transparency has changed
 
//color pallette
color black = #000000;  //oak planks
color white = #FFFFFF;  //empty space
color dullBlue = #7092BE;  //mossy bricks

//textures
PImage mossyStone;
PImage oakPlanks;

//Map variables
int gridSize;
PImage map;

//Robot for mouse control
Robot rbt;

//camera variables
float eyex, eyey, eyez;
float focusx, focusy, focusz; 
float upx, upy, upz;

boolean wkey, akey, skey, dkey, spacekey;

//rotation variable
float leftRightAngle;
float upDownAngle;

//Game Object
ArrayList<GameObject> objects;

//canvases
PGraphics world;
PGraphics HUD;

//Bullet cool down between each shot
int time = 0;

void setup() {
  hitpoint = 10;
  mode = GAME;
  //create canvases
  world = createGraphics(width, height, P3D);
  HUD = createGraphics(width, height, P2D);
  
  //create game object list
  objects = new ArrayList<GameObject>();
  
  //load texture
  mossyStone = loadImage("Mossy_Stone_Bricks.png");
  oakPlanks = loadImage("Oak_Planks.png");
  world.textureMode(NORMAL);
  
  //noCursor();
  try {
    rbt = new Robot(); 
  }
  catch(Exception e) {
    e.printStackTrace();  
  }
  size(displayWidth, displayHeight, P2D); 
  
  eyex = width/2;
  eyey = 9*height/11;
  eyez = height/2;
  
  focusx = eyex;
  focusy = eyey;
  focusz = eyez - 100;
  
  upx = 0;
  upy = 1;
  upz = 0;
  
  map = loadImage("map.png");
  gridSize = 100;
  
  objects.add(new SnowMan(1.5));

}
void draw() {
  if(mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else {
      println("ERROR! Mode is:" + mode); 
  }
}
