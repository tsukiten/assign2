//You should implement your assign2 here.
final int GAME_START = 0;
final int GAME_RUN = 1;
final int GAME_OVER = 2;

PImage bg1,bg2,hp,fighter,treasure,enemy;
PImage start1,start2,end1,end2;

int treasureX,treasureY,fighterX,fighterY,enemyX,enemyY;
float m,q;
int gameState;

boolean upPressed = false;
boolean downPressed = false;
boolean leftPressed = false;
boolean rightPressed = false;

int speed=5;


void setup () {
  size(640, 480) ;

  bg1 =loadImage("img/bg1.png");
  bg2 =loadImage("img/bg2.png");
  hp =loadImage("img/hp.png");
  fighter =loadImage("img/fighter.png");
  treasure =loadImage("img/treasure.png");
  enemy =loadImage("img/enemy.png");
  start1=loadImage("img/start1.png");
  start2=loadImage("img/start2.png");
  end1=loadImage("img/end1.png");
  end2=loadImage("img/end2.png");
  
  treasureX=floor(random(600)); //treasure
  treasureY=floor(random(440));
  
  enemyY=floor(random(30,440)); //enemy  
  
  m=39;
  fighterX=550;
  fighterY=height/2;
}
  
void draw() {
  
   switch(gameState){
     
    case GAME_START:
    //mouse action
    image(start2,0,0);
    if (mouseX>210 && mouseX<430 && mouseY>380 && mouseY<425){        
      if(mousePressed){
        //click
        gameState=GAME_RUN;
      }else{
        image(start1,0,0);
      }
     }     
      break;
       
       
    case GAME_RUN:
      //background
      image(bg1,q%1280-640,0); 
      image(bg2,(q+640)%1280-640,0);
      q++;
      
      //hp
      fill(230,0,0); 
      rect(28,27,m,23);
      image(hp,20,20); 
      
      //fighter
      image(fighter,fighterX,fighterY); 
      
      //treasure
      image(treasure,treasureX,treasureY); 
      
      //enemy
      image(enemy,enemyX,enemyY); 
      enemyX+=3;
      enemyX%=640;      
      
      //treasure detection
      if(treasureX>=fighterX-30 && treasureX<=fighterX+30 && treasureY>=fighterY-45 && treasureY<=fighterY+45 ){
        treasureX=floor(random(600)); 
        treasureY=floor(random(440));
        m+=19.5;
       if(m>=195){
        m=195;
       }
      }
      
      //enemy detection
      if(enemyX>=fighterX-30 && enemyX<=fighterX+30 && enemyY>=fighterY-45 && enemyY<=fighterY+45 ){
        enemyX=0;
        enemyY=floor(random(30,440));
        m-=39;
        if(m<=0){
        gameState=GAME_OVER;
        }
      }
      
      //boundary detection
      if (fighterX>585){
        fighterX=585;
      }
      if (fighterX<0){
        fighterX=0;
      }
      if (fighterY>425){
        fighterY=425;
      }
      if (fighterY<5){
        fighterY=5;
      }      
      
      
      if (upPressed) {
        fighterY -= speed;
      }
      if (downPressed) {
        fighterY += speed;
      }
      if (leftPressed) {
        fighterX -= speed;
      }
      if (rightPressed) {
        fighterX += speed;
      }
         
      break;
      
    
    case GAME_OVER:
      // mouse action
      image(end2,0,0);
      if (mouseX>210 && mouseX<420 && mouseY>310 && mouseY<350){
        if (mousePressed){
          // click
          gameState = GAME_RUN;
          m=39;
          enemyY=floor(random(30,440));
        }else{
          image(end1,0,0);          
        }
      }      
      break;     
  }
    
}

void keyPressed(){
  if (key == CODED) { // detect special keys 
    switch (keyCode) {
      case UP:
        upPressed = true;
        break;
      case DOWN:
        downPressed = true;
        break;
      case LEFT:
        leftPressed = true;
        break;
      case RIGHT:
        rightPressed = true;
        break;
      }
  }
}

void keyReleased(){
  if (key == CODED) {
    switch (keyCode) {
      case UP:
        upPressed = false;
        break;
      case DOWN:
        downPressed = false;
        break;
      case LEFT:
        leftPressed = false;
        break;
      case RIGHT:
        rightPressed = false;
        break;
    }
  }

}

