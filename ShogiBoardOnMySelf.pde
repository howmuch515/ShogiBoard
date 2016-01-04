import java.awt.*;
import javax.swing.*;

final int FRAME = 20;
PImage bgImage;
Field field;
PieceTable pieceTableA;
PieceTable pieceTableB;
Formation form;
PlayerSet playerS;
Log log;
Menu menu;


void setup() {
  size(1200, 800);
  frameRate(FRAME);
  bgImage = loadImage("img/bg.jpg");
  field = new Field(500, 500);
  form = new Formation(field);
  pieceTableA = new PieceTable(200, true);
  pieceTableB = new PieceTable(200, false);
  playerS = new PlayerSet();
  log = new Log();
  menu = new Menu(width-50, 50, width - 300, 400, #dddddd);
}

void draw() {
  if (menu.TurningSwitch.IO) {
    if (!playerS.turn) {
      translate(width, height);
      scale(-1, -1);
    }
  }

  imageMode(CENTER);
  image(bgImage, width/2, height/2, width, height);
  imageMode(CORNER);
  field.showUp();
  form.showUp();

  pieceTableA.showUp();
  pieceTableB.showUp();

  playerS.showUp();
  //MENU BUTTONS
  //translate-resTurningSwitchmenu.TurningSwitchet
  if (menu.TurningSwitch.IO) {
    if (!playerS.turn) {
      translate(width, height);
      scale(-1, -1);
    }
  }
  menu.showUp();
}


void mouseClicked() {
    if (form.grabedPiece() != null) {
      form.grabedPiece().move(field.getTroutOnMouse());
    } else if (pieceTableA.grabedPiece() != null) {
      pieceTableA.putField(pieceTableA.grabedPiece(), field.getTroutOnMouse());
    } else if (pieceTableB.grabedPiece() != null) {
      pieceTableB.putField(pieceTableB.grabedPiece(), field.getTroutOnMouse());
    } else {
      form.grab();
      pieceTableA.grab();
      pieceTableB.grab();
    }
    menu.putButton();
}

void keyPressed () {
  if (key == ' ') reset();
  if (key == 'b') playerS.resign();
  if (key == 'u') log.UNDO();
  if (key == 'r') log.REDO();
}

void reset() {
  boolean result = popUpJPanel("RESET?");
  if (result){
  playerS.reset();
  form.reset();
  pieceTableA.reset();
  pieceTableB.reset();
  log.reset();
 }
}  

//GAMEOVER
void gameOver() {
  println("TURN: " + playerS.turn);
  println("WINNER: " + playerS.getWinnerName());
  fill(#000000);
  text(playerS.getWinnerName(), width/2, height/2);
}