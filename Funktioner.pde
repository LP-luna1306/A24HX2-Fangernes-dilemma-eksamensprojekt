// Indirekte funktioner -> her ligger alle de funktioner som ikke ligger direkte i hoveddelen, de ligge her fordi 1) overskuelighed 2) genanvendelse


//Funktion som bruges til at lave knapper -> alle størrelser og farver
void button(int x, int y, int length, int height, color normalColor) { //x=x i øverstvenstrehjørne, y=y i øverstvenstrehjørne, length, height, farve når man ikke trykker

  //Gør farven lysere, hvis musen viler på knappen
  if (mouseX > x && mouseX < x + length && mouseY > y && mouseY < y + height) { //(Shiffman, 3.2: Built-in Variables (mouseX, mouseY) - Processing Tutorial, 2015)
    normalColor = color(red(normalColor)*1.4, green(normalColor) * 1.4, blue(normalColor) * 1.4);
  }

  //Knappens farve (skal være før rect())
  fill(normalColor);

  //Tegner knappen
  rect(x, y, length, height, 28);
}


//Tegner cirklerne
void drawCirkelLines() {  //(Shiffman, 8.2: Defining a Class Part I - Processing Tutorial, 2015)
  for (int i=0; i<=9; i++) {
    row1[i].drawCirkel();
    row2[i].drawCirkel();
  }
}


//Funktion som tæller hvor mange runder er spillet
void roundCount() {
  if (playerChoice[round]!=2 && enemyChoice[round]!=2) {
    round +=1;
  }
  println("round: " + round); //(Shiffman, 4.4: Using println() - Processing Tutorial, 2015)
}


//Funktion som registere spillerens valg, når brugeren trykker på knapperne
void playerChoice(int x1, int x2, int y, int length, int height) {

  if (mousePressed && mouseclick) { // hvis man klikker på musen og stopper med at klikke på musen ((Shiffman, 3.3: Events (mousePressed, keyPressed) - Processing Tutorial, 2015))
    if (mouseX > x1 && mouseX < x1 + length && mouseY > y && mouseY < y + height) { // hvis man klikker på samarbejd knappen
      if (round < 10) { // tjekker at vi er inden for arraystørrelsen
        row2[round].ændreFarve(2); // ændre farven på rundens cirkel til grøn
        playerChoice[round] = 0; // logger resultatet til pointæling m.m.(0 betyder samarbejd)
        println("playerChoice" + playerChoice[round]); //debugging
        mouseclick = false; // forhindre at alle cirklerne bliver grønne
      }
    } else if (mouseX > x2 && mouseX < x2 + length && mouseY > y && mouseY < y + height) { // hvis man klikker på forræd knappen
      if (round < 10) { // tjekker at vi er inden for arraystørrelsen
        row2[round].ændreFarve(3); // ændre farven på rundens cirkel til rød
        playerChoice[round] = 1; // logger resultatet til pointæller m.m. (1 betyder forræd)
        println("playerChoice" + playerChoice[round]); //debugging
        mouseclick = false; // forhindre alle cirkler bliver røde
      }
    }
  }
}


// Funktion som registrer når man stopper med at trykke på musen
void mouseReleased() { //(Proccesing, u.d.)
  mouseclick=true;
}


//Funktion som registere modstanderens valg, ved brug af stradegien "suspicous tit for tat" (Kuhn, 2024)
void enemyChoice() {

  if (round >= 1 && round < 10) {
    if (playerChoice[round] == 0) { // Hvis spilleren samarbejdede i sidste rundte
      enemyChoice[round] = 0; // Logger at modtsander samarbejderen
      println("enemyChoice" + enemyChoice[round]); //debugging
      row1[round].ændreFarve(2); // Skifter farven på cirklen til grøn
    } else if (playerChoice[round] == 1) { // Hvis spilleren forådte i sidste rundte
      enemyChoice[round] = 1; // Modtsanderen foråder også
      println("enemyChoice" + enemyChoice[round]); //debugging
      row1[round].ændreFarve(3); // Skifter cirklens farve til rød
    }
  } else if (round==0 && playerChoice[0] !=2) {
    enemyChoice[round] = 1; // Modtsanderen foråder også
    println("enemyChoice" + enemyChoice[round]); //debugging
    row1[round].ændreFarve(3); // Skifter cirklens farve til rød
  }
}


//Funktion som afslutter playscreen(), når alle 10 runder er spillet
void roundender() {
  if (round>=10) {
    playscreen=false;
    endscreen=true;
  }
}


//Funktion som tæller alle point
void pointcounter() {

  //Tjekker om round=0, fordi vi minusser round med 1 og hele programmet så vil crashe 
  if (round >= 0 && enemyChoice[round] !=2 && playerChoice[round] !=2) {

    //optæller pointene basseret på arrayene med de loggede beslutninger
    if (enemyChoice[round] == 0 && playerChoice[round] == 0) { //Begge samarbejder
      enemyPoint += 3;
      playerPoint += 3;
    } else if (enemyChoice[round] == 1 && playerChoice[round] == 1) { //Begge foræder
      enemyPoint += 1;
      playerPoint += 1;
    } else if (enemyChoice[round] == 1 && playerChoice[round] == 0) { //Fjenden forædder, mens spilleren samarbejder
      enemyPoint += 5;
    } else if (enemyChoice[round]== 0 && playerChoice[round] == 1) { //Fjenden samarbejder, mens spilleren forræder
      playerPoint += 5;
    } else if (enemyChoice[round]==2) { //Debugging
      println("M FEJL");
    } else if (playerChoice[round]==2) { //Debugging
      println("S FEJL");
    }
  }

  //rektangelens farve (skal være før rect())
  fill(200, 100, 75);

  //tegner spillerens rektangelen
  rect(width/20, height/10, width/4, height/6, 10); //tegner rektanglen der viser spillerens point

  //Teksten i spillerens point kasse
  fill(255);
  textSize(height/25);
  text("Dine point:" + playerPoint, width/20 + width/8, height/10 + height/12);

  //rektangelens farve (skal være før rect())
  fill(200, 100, 75); //buttonpens farve som skal være før rect()

  //tegner modstanderens rektangelen
  rect((width-width/20)-width/4, height/10, width/4, height/6, 10); //tegner rektanglen der viser modstanderens point

  //Teksten i modstanderens point kasse
  fill(255);
  textSize(height/25);
  text("Modstanders point:" + enemyPoint, (width - width/20) - width/4 + width/8, height/10 + height/12);
}


//Funktion som nulstiller alle variabler inden et nyt spil
void reset() {

  //"Knapper" der starter/slutter de forskellige skærme
  startscreen = true;
  playscreen = false;
  endscreen = false;

  //viser at et tryk på musen er afsluttet og at pointene for en round er talt
  mouseclick = true;

  //variabel der tæller antal runder i et spil
  round = 0; //starter ved -1 så første round vil være 0 (vi tæller ved at +1), hvilket er første lokation i et array

  //tæller pointene
  enemyPoint = 0;
  playerPoint =0;

  //Gør alle cirklerne hvide igen
  for (int i=0; i<=9; i++) {       //Initiere cirklerne igen
    row1[i] = new Cirkel(i*(width/10)+width/20, height/2-height/10, 1);
    row2[i] = new Cirkel(i*(width/10)+width/20, height/2+height/10, 1);
  }

  //Sletter loggen af rundter
  for (int i = 0; i < 11; i++) {
    enemyChoice[i] = 2; // 2 er bare en tilfældig værdi
    playerChoice[i] = 2;
  }
}
