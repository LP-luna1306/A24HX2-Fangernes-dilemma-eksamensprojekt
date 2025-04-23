//Klassen -> her bygges cirklerne

class Cirkel {

  //Globalde variabler i klassen
  float x; //x-koordinatet for centrum af cirkel
  float y; //y-koordinatet for centrum af cirkel
  int farve; //farven af cirklen, MEN farven er ikke angivet via RGB istedet bruger jeg 1,2,3.


  //Constructor (Shiffman, 8.4: Constructor Arguments - Processing Tutorial, 2015)
  Cirkel( int cirkelX, int cirkelY, int cirkelFarve) {
    x = cirkelX;
    y = cirkelY;
    farve = cirkelFarve;
  }


  //Funktion som tegner cirklerne
  void drawCirkel() {

    //Farvelægger cirklen
    if (farve==1) { //1->hvid
      fill(255);
    } else if (farve==2) { //2->grøn
      fill(34, 139, 34);
    } else if (farve==3) { //3->rød
      fill(139, 0, 0);
    }

    //tegner cirkelerne
    ellipse(x, y, 75, 75);
  }

  //Funktion som ændre farven på cirklerne
  void ændreFarve(int nyFarve) {
    farve = nyFarve;
  }
}
