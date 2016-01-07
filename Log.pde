class Log {
  ArrayList<Record> LOGLIST = new ArrayList<Record>();
  int P = 1;
  Log() {
  }

  //RECORD CLASS==========>
  class Record {
    int index;
    String turn;
    Piece piece;
    Trout oldTrout;
    Trout newTrout;
    boolean nari;
    Piece takePiece;
    boolean put;

    Record(int index, String turn, Piece piece, Trout oldTrout, Trout newTrout, boolean nari, Piece takePiece, boolean put) {
      this.index = index;
      this.turn = turn;
      this.piece = piece;
      this.oldTrout = oldTrout;
      this.newTrout = newTrout;
      this.nari = nari;
      this.takePiece = takePiece;
      this.put = put;
    }

    String toString() {
      return index + "," + turn + "," + piece.name + "," + oldTrout  + "," + newTrout  + "," + nari  + "," + takePiece;
    }
  }
  //<==========RECORD CLASS

  void DO(Piece piece, Trout oldTrout, Trout newTrout, boolean nari, Piece takePiece, boolean put) {
    if (P-1 < LOGLIST.size()) {
      int i = LOGLIST.size()-1;
      while (i>P-1) {
        LOGLIST.remove(i);
        i--;
      }
      LOGLIST.set(P-1, new Record(P, playerS.turnPlayerName(), piece, oldTrout, newTrout, nari, takePiece, put));
    } else {
      LOGLIST.add(new Record(P, playerS.turnPlayerName(), piece, oldTrout, newTrout, nari, takePiece, put));
    }
    P++;
  }

  void UNDO() {
    if (P <= 1 ) println("NO MORE UNDO!");
    else {
      //MOVE PIECE
      Piece tmpPiece = LOGLIST.get(P-2).piece;
      Trout srcTrout = LOGLIST.get(P-2).oldTrout;
      Trout disTrout = LOGLIST.get(P-2).newTrout;
      if (LOGLIST.get(P-2).put) {
        if (tmpPiece.mine) pieceTableA.addPiece(tmpPiece.name);
        else pieceTableB.addPiece(tmpPiece.name);
        tmpPiece.setPosition(srcTrout);
        if (LOGLIST.get(P-2).nari) tmpPiece.nari = true;
        tmpPiece.onField = false;
        disTrout.onPiece = false;
        if (form.countPieceOnSameTrout(srcTrout) == 0) {
          srcTrout.onPiece = false;
        }
      } else {
        //if nari
        if (LOGLIST.get(P-2).nari) {
          tmpPiece.nari = false;
        }

        tmpPiece.setPosition(srcTrout);

        //if take piece
        Piece tkpiece = LOGLIST.get(P-2).takePiece;
        if (tkpiece != null) {

          LOGLIST.get(P-2).newTrout.onPiece = true;
          tkpiece.setPosition(LOGLIST.get(P-2).newTrout);
          tkpiece.trout = LOGLIST.get(P-2).newTrout;
          tkpiece.onField = true;
          if (pieceTableA.mine == playerS.turn) pieceTableB.rmPiece(tkpiece.name);
          else pieceTableA.rmPiece(tkpiece.name);
          tkpiece.mine = !tkpiece.mine;
        }
      }

      playerS.turnChange();
      P--;
    }
  }


  void REDO() {
    if (P >= LOGLIST.size()+1) println("NO MORE REDO!");
    else {
      //MOVE PIECE
      Piece tmpPiece = LOGLIST.get(P-1).piece;
      Trout tmpTrout = LOGLIST.get(P-1).newTrout;

      //if nari
      if (LOGLIST.get(P-1).nari) tmpPiece.nari = true;

      //if take piece
      Piece tkpiece = LOGLIST.get(P-1).takePiece;
      if (tkpiece != null)tkpiece.taken();

      tmpPiece.setPosition(tmpTrout);
      playerS.turnChange();

      P++;
    }
  }

  void reset() {
    LOGLIST.clear();
    P = 1;
  }
}