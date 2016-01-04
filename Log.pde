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

    Record(int index, String turn, Piece piece, Trout oldTrout, Trout newTrout, boolean nari, Piece takePiece) {
      this.index = index;
      this.turn = turn;
      this.piece = piece;
      this.oldTrout = oldTrout;
      this.newTrout = newTrout;
      this.nari = nari;
      this.takePiece = takePiece;
    }

    String toString() {
      return index + "," + turn + "," + piece + "," + oldTrout  + "," + newTrout  + "," + nari  + "," + takePiece;
    }
  }
  //<==========RECORD CLASS

  void DO(Piece piece, Trout oldTrout, Trout newTrout, boolean nari, Piece takePiece) {
    if (P-1 < LOGLIST.size()) {
      int i = LOGLIST.size()-1;
      while (i>P-1) {
        LOGLIST.remove(i);
        i--;
      }
        LOGLIST.set(P-1, new Record(P, playerS.turnPlayerName(), piece, oldTrout, newTrout, nari, takePiece));
    } else {
      LOGLIST.add(new Record(P, playerS.turnPlayerName(), piece, oldTrout, newTrout, nari, takePiece));
    }
    P++;
  }

  void UNDO() {
    if (P <= 1 ) println("NO MORE UNDO!");
    else {
      //MOVE PIECE
      Piece tmpPiece = LOGLIST.get(P-2).piece;
      Trout tmpTrout = LOGLIST.get(P-2).oldTrout;

      //if nari
      if (LOGLIST.get(P-2).nari) {
        tmpPiece.nari = false;
        //playerS.turnChange();
      }

      //if take piece
      Piece tkpiece = LOGLIST.get(P-2).takePiece;
      if (tkpiece != null) {
        tkpiece.setPosition(LOGLIST.get(P-2).newTrout);
        tkpiece.onField = true;
        if (pieceTableA.mine == playerS.turn) pieceTableB.rmPiece(tkpiece.name);
        else pieceTableA.rmPiece(tkpiece.name);
        tkpiece.mine = !tkpiece.mine;
      }
      tmpPiece.setPosition(tmpTrout);
      playerS.turnChange();
      P--;
    }
  }

  void REDO() {
    if (P >= LOGLIST.size()+1) println("NO MORE REDO!");
    else {
      //MOVE PIECE
      //println(LOGLIST);
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