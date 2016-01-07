class Formation {
  ArrayList<Piece> pieceList = new ArrayList<Piece>();
  boolean mine;

  Formation(Field field) {

    for (int i=0; i<9; i++) {
      pieceList.add(new Fu(true, field.hasTrout[i][6], field.getTroutWidth(), field.getTroutHeight()));
    }
    pieceList.add(new Kyo(true, field.hasTrout[0][8], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Kyo(true, field.hasTrout[8][8], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Kei(true, field.hasTrout[1][8], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Kei(true, field.hasTrout[7][8], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Gin(true, field.hasTrout[2][8], field.getTroutWidth(), field.getTroutHeight())); 
    pieceList.add(new Gin(true, field.hasTrout[6][8], field.getTroutWidth(), field.getTroutHeight())); 
    pieceList.add(new Kin(true, field.hasTrout[3][8], field.getTroutWidth(), field.getTroutHeight())); 
    pieceList.add(new Kin(true, field.hasTrout[5][8], field.getTroutWidth(), field.getTroutHeight())); 
    pieceList.add(new Ou(true, field.hasTrout[4][8], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Kaku(true, field.hasTrout[1][7], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Hi(true, field.hasTrout[7][7], field.getTroutWidth(), field.getTroutHeight()));


    for (int i=0; i<9; i++) {
      pieceList.add(new Fu(false, field.hasTrout[i][2], field.getTroutWidth(), field.getTroutHeight()));
    }
    pieceList.add(new Kyo(false, field.hasTrout[0][0], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Kyo(false, field.hasTrout[8][0], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Kei(false, field.hasTrout[1][0], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Kei(false, field.hasTrout[7][0], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Gin(false, field.hasTrout[2][0], field.getTroutWidth(), field.getTroutHeight())); 
    pieceList.add(new Gin(false, field.hasTrout[6][0], field.getTroutWidth(), field.getTroutHeight())); 
    pieceList.add(new Kin(false, field.hasTrout[3][0], field.getTroutWidth(), field.getTroutHeight())); 
    pieceList.add(new Kin(false, field.hasTrout[5][0], field.getTroutWidth(), field.getTroutHeight())); 
    pieceList.add(new Ou(false, field.hasTrout[4][0], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Hi(false, field.hasTrout[1][1], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Kaku(false, field.hasTrout[7][1], field.getTroutWidth(), field.getTroutHeight()));
  }

  void showUp() {
    for (Piece piece : pieceList) {
      if (piece.onField) piece.showUp();
    }
  }


  Piece grabedPiece() {
    for (Piece piece : pieceList) {
      if (piece.grabed)  return piece;
    }
    return null;
  }

  void grab() {
    for (Piece piece : pieceList) {
      if (piece.onField) piece.grab();
    }
  }
  
  int countPieceOnSameTrout(Trout trout) {
    int counter = 0;
    for (Piece piece: pieceList) {
      if (piece.trout == trout) {
        counter++;
      }
    }
    return counter;
  }

  Piece getPieceOnMouse() {
    for (Piece piece : pieceList) {
      if (piece.onMouse() && piece.onField) return piece;
    }
    return null;
  }

  void reset() {
    pieceList.clear();
    for (int i=0; i<9; i++) {
      pieceList.add(new Fu(true, field.hasTrout[i][6], field.getTroutWidth(), field.getTroutHeight()));
    }
    pieceList.add(new Kyo(true, field.hasTrout[0][8], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Kyo(true, field.hasTrout[8][8], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Kei(true, field.hasTrout[1][8], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Kei(true, field.hasTrout[7][8], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Gin(true, field.hasTrout[2][8], field.getTroutWidth(), field.getTroutHeight())); 
    pieceList.add(new Gin(true, field.hasTrout[6][8], field.getTroutWidth(), field.getTroutHeight())); 
    pieceList.add(new Kin(true, field.hasTrout[3][8], field.getTroutWidth(), field.getTroutHeight())); 
    pieceList.add(new Kin(true, field.hasTrout[5][8], field.getTroutWidth(), field.getTroutHeight())); 
    pieceList.add(new Ou(true, field.hasTrout[4][8], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Kaku(true, field.hasTrout[1][7], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Hi(true, field.hasTrout[7][7], field.getTroutWidth(), field.getTroutHeight()));


    for (int i=0; i<9; i++) {
      pieceList.add(new Fu(false, field.hasTrout[i][2], field.getTroutWidth(), field.getTroutHeight()));
    }
    pieceList.add(new Kyo(false, field.hasTrout[0][0], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Kyo(false, field.hasTrout[8][0], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Kei(false, field.hasTrout[1][0], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Kei(false, field.hasTrout[7][0], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Gin(false, field.hasTrout[2][0], field.getTroutWidth(), field.getTroutHeight())); 
    pieceList.add(new Gin(false, field.hasTrout[6][0], field.getTroutWidth(), field.getTroutHeight())); 
    pieceList.add(new Kin(false, field.hasTrout[3][0], field.getTroutWidth(), field.getTroutHeight())); 
    pieceList.add(new Kin(false, field.hasTrout[5][0], field.getTroutWidth(), field.getTroutHeight())); 
    pieceList.add(new Ou(false, field.hasTrout[4][0], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Hi(false, field.hasTrout[1][1], field.getTroutWidth(), field.getTroutHeight()));
    pieceList.add(new Kaku(false, field.hasTrout[7][1], field.getTroutWidth(), field.getTroutHeight()));
  }
}