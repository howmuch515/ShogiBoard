class Piece {
  String name;
  boolean mine;
  boolean nari;
  boolean grabed;
  boolean onField;

  PImage PieceSImage;
  PImage PieceGImage;
  PImage PieceSNariImage;
  PImage PieceGNariImage;
  PImage modeImage;
  Trout trout;

  int clear;
  int wW, wH;

  Piece(boolean mine, Trout trout, int wW, int wH, String SImageName, String GImageName, String SNariImageName, String GNariImageName) {
    this.wW = wW;
    this.wH = wH;
    this.trout = trout;
    setPosition(trout);
    grabed = false;
    onField = true;
    this.mine = mine;
    this.nari = false;
    clear = 255;
    PieceSImage = loadImage(SImageName);
    PieceGImage = loadImage(GImageName);
    PieceSNariImage = loadImage(SNariImageName);
    PieceGNariImage = loadImage(GNariImageName);
  }

  PImage getImage() {
    return mine ? PieceSImage : PieceGImage;
  }

  void setPosition(Trout trout) {
    this.trout.onPiece = false;
    this.trout = trout;
    this.trout.onPiece = true;
    this.trout.setPiece(this);
  }

  //Piece evolution.
  boolean nari(Trout oldTrout, Trout newTrout) {
    boolean result = false;
    //Confirm about Nari(Yes/No)  
    if (!nari) {
      if (mine) {
        if (oldTrout.zone != -1 && newTrout.zone == -1) {
          result = popUpJPanel("EVOLUTION?");
          if (result) nari = true;
          return result;
        }
        if (oldTrout.zone == -1 && newTrout.zone == -1) {
          result = popUpJPanel("EVOLUTION?");
          if (result) nari = true;
          return result;
        }
        if (oldTrout.zone == -1 && newTrout.zone != -1) {
          result = popUpJPanel("EVOLUTION?");
          if (result) nari = true;
          return result;
        }
      } else {
        if (oldTrout.zone != 1 && newTrout.zone == 1) {
          result = popUpJPanel("EVOLUTION?");
          if (result) nari = true;
          return result;
        }
        if (oldTrout.zone == 1 && newTrout.zone == 1) {
          result = popUpJPanel("EVOLUTION?");
          if (result) nari = true;
          return result;
        }
        if (oldTrout.zone == 1 && newTrout.zone != 1) {
          result = popUpJPanel("EVOLUTION?");
          if (result) nari = true;
          return result;
        }
      }
    }
    return result;
  }

  void taken() {
    mine = !mine;
    if (mine) pieceTableA.addPiece(this.name);
    else pieceTableB.addPiece(this.name);
    nari = false;
    onField = false;
  }

  void take(Trout newTrout) {
    if (newTrout.onPiece && mine != newTrout.piece.mine) newTrout.piece.taken();
  }


  void showUp() {
    imageMode(CORNER);
    tint(255, clear);
    if (nari) modeImage = mine ? PieceSNariImage : PieceGNariImage;
    else modeImage =  mine ? PieceSImage : PieceGImage;
    image(modeImage, trout.getX(), trout.getY(), wW, wH);
  }

  boolean getGrabed() {
    return grabed;
  }

  boolean onMouse() {
    return trout.onMouse();
  }

  boolean getOnField() {
    return onField;
  }

  void grab() {
    if (playerS.turn == mine) {
      if (onMouse() && grabed) {
        grabed  = false;
        clear = 255;
      } else if (onMouse() && !grabed) {
        grabed = true; 
        clear = 100;
      }
    }
  }



  void move(Trout newTrout) {
    boolean nariFlag = false; //To Nari Item of Log System
    if (newTrout == null) {
      grabed = false;
      clear = 255;
    } else {
      if (newTrout.piece == null) {
        if (grabed) {
          nariFlag = nari(trout, newTrout);
          grabed = false;
          clear = 255;
          if (trout != newTrout) {//when another position click.

            //LOG SYSTEM
            log.DO(this, trout, newTrout, nariFlag, newTrout.piece);

            setPosition(newTrout);
            playerS.turnChange();
          }
        }
      } else {
        if (newTrout.piece.mine != playerS.turn) {
          take(newTrout);
          if (grabed) {
            nariFlag = nari(trout, newTrout);
            grabed = false;
            clear = 255;
            if (trout != newTrout) {//when another position click.
              //LOG SYSTEM
              log.DO(this, trout, newTrout, nariFlag, newTrout.piece);
              setPosition(newTrout);
              playerS.turnChange();
            }
          }
        } else {
          grabed = false;
          clear = 255;
        }
      }
    }
  }
}




class Fu extends Piece {
  Fu(boolean mine, Trout trout, int wW, int wH) {
    super(mine, trout, wW, wH, "img/pieces/Sfu.png", "img/pieces/Gfu.png", "img/pieces/Sto.png", "img/pieces/Gto.png");
    name = "Fu";
  }
}

class  Kyo extends Piece {
  Kyo(boolean mine, Trout trout, int wW, int wH) {
    super(mine, trout, wW, wH, "img/pieces/Skyo.png", "img/pieces/Gkyo.png", "img/pieces/Snkyo.png", "img/pieces/Gnkyo.png");
    name = "Kyo";
  }
}

class  Kei extends Piece {
  Kei(boolean mine, Trout trout, int wW, int wH) {
    super(mine, trout, wW, wH, "img/pieces/Skei.png", "img/pieces/Gkei.png", "img/pieces/Snkei.png", "img/pieces/Gnkei.png");
    name = "Kei";
  }
}

class  Gin extends Piece {
  Gin(boolean mine, Trout trout, int wW, int wH) {
    super(mine, trout, wW, wH, "img/pieces/Sgin.png", "img/pieces/Ggin.png", "img/pieces/Sngin.png", "img/pieces/Gngin.png");
    name = "Gin";
  }
}
class  Kin extends Piece {
  Kin(boolean mine, Trout trout, int wW, int wH) {
    super(mine, trout, wW, wH, "img/pieces/Skin.png", "img/pieces/Gkin.png", "img/pieces/Skin.png", "img/pieces/Gkin.png");
    name = "Kin";
  }
}

class  Kaku extends Piece {
  Kaku(boolean mine, Trout trout, int wW, int wH) {
    super(mine, trout, wW, wH, "img/pieces/Skaku.png", "img/pieces/Gkaku.png", "img/pieces/Suma.png", "img/pieces/Guma.png");
    name = "Kaku";
  }
}
class  Hi extends Piece {
  Hi(boolean mine, Trout trout, int wW, int wH) {
    super(mine, trout, wW, wH, "img/pieces/Shi.png", "img/pieces/Ghi.png", "img/pieces/Sryu.png", "img/pieces/Gryu.png");
    name = "Hi";
  }
}

class  Ou extends Piece {
  Ou(boolean mine, Trout trout, int wW, int wH) {
    super(mine, trout, wW, wH, "img/pieces/Sou.png", "img/pieces/Gou.png", "img/pieces/Sou.png", "img/pieces/Gou.png");
    name = "Ou";
  }

  void taken() {
    if (playerS.turn) {
      playerS.SPlayer.winner = true;
      playerS.GPlayer.winner = false;
    } else {
      playerS.SPlayer.winner = false;
      playerS.GPlayer.winner = true;
    }
    gameOver();
  }
}