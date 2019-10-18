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

  void setPosition(Trout newTrout) {
    trout.onPiece = false;
    newTrout.onPiece = true;
    trout = newTrout;
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
    onField = false;
  }

  void take(Piece tkpiece) {
    if (mine != tkpiece.mine) {
      tkpiece.taken();
    }
  }

  void showUp() {
    imageMode(CORNER);
    tint(255, clear);
    if (nari) modeImage = mine ? PieceSNariImage : PieceGNariImage;
    else modeImage =  mine ? PieceSImage : PieceGImage;
    image(modeImage, trout.getX(), trout.getY(), wW, wH);
  }

  boolean onMouse() {
    if (menu.TurningSwitch.IO) {
      if (playerS.turn) return abs(trout.getX() + wW/2 - mouseX) <= wW/2 && abs(trout.getY() + wH/2 - mouseY) <= wH/2;
      else {
        int X = width - mouseX;
        int Y = height - mouseY;
        return abs(trout.getX() + wW/2 - X) <= wW/2 && abs(trout.getY() + wH/2 - Y) <= wH/2;
      }
    } else {
      return abs(trout.getX() + wW/2 - mouseX) <= wW/2 && abs(trout.getY() + wH/2 - mouseY) <= wH/2;
    }
  }

  boolean getGrabed() {
    return grabed;
  }

  boolean getOnField() {
    return onField;
  }

  void grab() {
    if (playerS.turn == mine && onField) {
      if (onMouse()) {
        if (grabed) {
          grabed  = false;
          clear = 255;
        } else {
          grabed = true;
          clear = 100;
        }
      }
    }
  }

  void move(Trout newTrout, Piece tkpiece) {

    boolean nariFlag = false; //To Nari Item of Log System

    if (newTrout == null) {
      grabed = false;
      clear = 255;
    } else {
      if (!newTrout.onPiece) {
        if (grabed) {
          nariFlag = nari(trout, newTrout);
          grabed = false;
          clear = 255;

          //LOG SYSTEM
          log.DO(this, trout, newTrout, nariFlag, null, false);
          setPosition(newTrout);
          playerS.turnChange();
        }
      } else {
        if (tkpiece.mine != playerS.turn) {
          if (grabed) {
            nariFlag = nari(trout, newTrout);
            grabed = false;
            clear = 255;
            //LOG SYSTEM
            log.DO(this, trout, newTrout, this.nari, tkpiece, false);
            take(tkpiece);
            setPosition(newTrout);
            playerS.turnChange();
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