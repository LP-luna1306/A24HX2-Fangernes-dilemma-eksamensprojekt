//Hoveddelen -> Her er alle globale variabler + skærmfunktioner bliver kaldt


//Globale variabler:

//"Knappper" der starter/slutter de forskellige skærme
boolean startscreen = true;
boolean playscreen = false;
boolean endscreen = false;

//Viser at et tryk på musen er afsluttet og at pointene for en round er talt
boolean mouseclick = true;

//tæller antal roundr spillet indtil videre
int round = 0;

//tæller pointene
int enemyPoint = 0;
int playerPoint =0;

//Deklerere cirklerne (Shiffman, 8.2: Defining a Class Part I - Processing Tutorial, 2015) 
Cirkel[] row1 = new Cirkel[11];
Cirkel[] row2 = new Cirkel[11];

//Deklerere array der "husker" de forskellige valg taget (array størrelsen er 11, for ellers crasher alt) (Shiffman, 9.2: Declare, Initialize, and Use an Array - Processing Tutorial, 2015)
int[] enemyChoice = new int [11]; //"hukommelse" for hvilket valg modstanderen har taget i hvilken rundte
int[] playerChoice = new int [11]; //"hukommelse" for hvilket valg spilleren har taget i hvilken rundte



//Initialisere og kalder skærmfunktionerne:

void setup() {
  fullScreen(); //sætter vinduet til at fylde hele skærmen

  //Initiere cirklerne  
  //(Shiffman, 8.2: Defining a Class Part I - Processing Tutorial, 2015) (Shiffman, 9.3: Arrays of Objects - Processing Tutorial, 2015) (Shiffman, 6.3: For Loop - Processing Tutorial, 2015)
  for (int i=0; i<=9; i++) {
    row1[i] = new Cirkel(i*(width/10)+width/20, height/2-height/10, 1);
    row2[i] = new Cirkel(i*(width/10)+width/20, height/2+height/10, 1);
  }

  //Initialiserer arrays for modstanderens og spillerens valg (Shiffman, 6.3: For Loop - Processing Tutorial, 2015)  (Shiffman, 9.2: Declare, Initialize, and Use an Array - Processing Tutorial, 2015)
  for (int i = 0; i < 11; i++) {
    enemyChoice[i] = 2; // 2 er bare en tilfældig værdi (hvis en plads i arrayet er 2 ved er der fejl!!)
    playerChoice[i] = 2;
  }
}


void draw() {
  //baggrunden sættes til sort (0 er sort på gråskalaen) (Proccesing, u.d.)
  background(0); 


  //Tænder og slukker for skærmene (screens) (Shiffman, 5.2: If, Else If, Else - Processing Tutorial, 2015)
  if (startscreen == true) {
    startscreen();
  } else if (playscreen == true) {
    playscreen();
    drawCirkelLines();
  } else if (endscreen == true) {
    endscreen();
  }
}
