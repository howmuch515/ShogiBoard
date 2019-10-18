class PieceTable {
  int X, Y;
  int wW;
  int wH;
  Trout tableTrout[][] = new Trout[3][3];
  HashMap<String, Integer> pieceSet = new HashMap<String, Integer>();
  HashMap<String, Piece> pieceObjectSet = new HashMap<String, Piece>();
  String pieceNames[] = {"Fu", "Kyo", "Kei", "Gin", "Kin", "Hi", "Kaku"};
  boolean mine;

  PieceTable(int rectSize, boolean mine) {
    this.X = mine ? (width - rectSize*3/2) : rectSize/2;
    this.Y = mine ? (height - rectSize*3/2) : rectSize/2;
    this.wW = rectSize;
    this.wH = rectSize;
    this.mine = mine;
    if (mine) {
      for (int i=0; i<3; i++) {
        for (int j=0; j<3; j++) {
          tableTrout[i][j] = new Trout(-1, -1, i*wW/3 + X, j*wH/3 + Y, wW/3, wH/3, 2);
        }
      }
    } else {
      for (int i=2; i>=0; i--) {
        for (int j=2; j>=0; j--) {
          tableTrout[i][j] = new Trout(-1, -1, - i*wW/3 + X + wW*2/3, -j*wH/3 + Y + wH*2/3, wW/3, wH/3, 2);
        }
      }
    }
    pieceSet.put("Fu", 0);
    pieceSet.put("Kyo", 0);
    pieceSet.put("Kei", 0);
    pieceSet.put("Gin", 0);
    pieceSet.put("Kin", 0);
    pieceSet.put("Hi", 0);
    pieceSet.put("Kaku", 0);

    pieceObjectSet.put("Fu", new Fu(mine, tableTrout[0][0], wW/3, wH/3));
    pieceObjectSet.put("Kyo", new Kyo(mine, tableTrout[0][1], wW/3, wH/3));
    pieceObjectSet.put("Kei", new Kei(mine, tableTrout[0][2], wW/3, wH/3));
    pieceObjectSet.put("Gin", new Gin(mine, tableTrout[1][0], wW/3, wH/3));
    pieceObjectSet.put("Kin", new Kin(mine, tableTrout[1][1], wW/3, wH/3));
    pieceObjectSet.put("Hi", new Hi(mine, tableTrout[1][2], wW/3, wH/3));
    pieceObjectSet.put("Kaku", new Kaku(mine, tableTrout[2][0], wW/3, wH/3));
  }

  void tablePieceShowUp() {
    for (Piece tablePiece : pieceObjectSet.values()) {
      noStroke();
      //if piece number == 0 not show up.
      if (pieceSet.get(tablePiece.name) != 0) tablePiece.showUp();
      stroke(1);
    }
  }

  void putField(Piece tablePiece, Trout newTrout) {
    if (newTrout == null) {
      tablePiece.clear = 255;
      tablePiece.grabed = false;
    } else {
      if (!newTrout.onPiece) {
        for (Piece piece : form.pieceList) {
          if (piece.name == tablePiece.name  && !piece.onField && piece.mine == playerS.turn) {
              log.DO(piece, piece.trout, newTrout, false, null, true);
              piece.trout = newTrout;
              piece.nari = false;
              newTrout.onPiece = true;
              piece.onField = true;
              tablePiece.clear = 255;
              piece.grabed = false;
              rmPiece(tablePiece.name);
              playerS.turnChange();
              break;
          }
        }
      } else {
        tablePiece.clear = 255;
        tablePiece.grabed = false;
      }
    }
  }


  void showUp() {

    //rectMode(CENTER);
    fill(#DEB887);
    stroke(1);
    textSize(20);

    String num = "2";
    noStroke();
    rect(X, Y, wW, wH);
    stroke(1);
    tablePieceShowUp();
    int count = 0;
    //MINE
    if (mine) {
      for (int i=0; i<3; i++) {
        for (int j=0; j<3; j++) {
          if (count <pieceNames.length) {
            num = "x" + pieceSet.get(pieceNames[count]).toString();
            fill(#000000);
            if (pieceSet.get(pieceNames[count]) != 0) text(num, X+20+i*wW/3, Y+20+j*wH/3);
            noFill();
            count++;
          }
        }
      }
      //NOT MINE
    } else if (!mine) {
      for (int i=2; i>=0; i--) {
        for (int j=2; j>=0; j--) {
          if (count <pieceNames.length) {
            num = "x" + pieceSet.get(pieceNames[count]).toString();
            fill(#000000);
            if (pieceSet.get(pieceNames[count]) != 0) text(num, X+20+i*wW/3, Y+65+j*wH/3);
            noFill();
            count++;
          }
        }
      }
    }
  }

  void grab() {
    for (Piece piece : pieceObjectSet.values()) {
      piece.grab();
    }
  }

  Piece grabedPiece() {
    for (Piece piece : pieceObjectSet.values()) {
      if (piece.grabed)  return piece;
    }
    return null;
  }


  void addPiece(String name) {
    pieceSet.put(name, pieceSet.get(name) + 1);
  }

  void rmPiece(String name) {
    pieceSet.put(name, pieceSet.get(name) - 1);
  }

  void reset() {
    pieceSet.put("Fu", 0);
    pieceSet.put("Kyo", 0);
    pieceSet.put("Kei", 0);
    pieceSet.put("Gin", 0);
    pieceSet.put("Kin", 0);
    pieceSet.put("Hi", 0);
    pieceSet.put("Kaku", 0);

    pieceObjectSet.put("Fu", new Fu(mine, tableTrout[0][0], wW/3, wH/3));
    pieceObjectSet.put("Kyo", new Kyo(mine, tableTrout[0][1], wW/3, wH/3));
    pieceObjectSet.put("Kei", new Kei(mine, tableTrout[0][2], wW/3, wH/3));
    pieceObjectSet.put("Gin", new Gin(mine, tableTrout[1][0], wW/3, wH/3));
    pieceObjectSet.put("Kin", new Kin(mine, tableTrout[1][1], wW/3, wH/3));
    pieceObjectSet.put("Hi", new Hi(mine, tableTrout[1][2], wW/3, wH/3));
    pieceObjectSet.put("Kaku", new Kaku(mine, tableTrout[2][0], wW/3, wH/3));
  }
}