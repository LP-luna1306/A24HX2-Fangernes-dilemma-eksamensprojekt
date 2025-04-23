//Direkte funktioner -> funktioner som indgår direkte i hoveddelet kaldt skærme

//Den første skærm man møder, når man åbner spillet
void startscreen() {

  //Varibler til start knappen (er alle baseret på skærmstørrelsen, så det ikke ser dumt ud på en anden enhed) (OpenAI, 2025)
  int buttonlength = width/3;
  int buttonheight = height/4;
  int midX = (width - buttonlength) / 2;
  int midY = (height - buttonheight) / 2;

  //knappen (det sidste tal er farven)
  button(midX, midY, buttonlength, buttonheight, color(200, 100, 75)); //(OpenAI, 2025)

  //Tekst på knappen
  fill(255);
  textSize(height/6);
  textAlign(CENTER, CENTER); //(Proccesing, u.d.)
  text("START", width/2, height/2);

  //Spillet starter når man klikker på knappen
  if (mousePressed && mouseX > midX && mouseX < midX + buttonlength && mouseY > midY && mouseY < midY + buttonheight) { //(OpenAI, 2025)
    startscreen = false;
    playscreen = true;
  }
}


//Den anden skærm man møder, her spilles spillet
void playscreen() {

  //Varibler til knapperne (OpenAI, 2025)
  int buttonlength = width/4;
  int buttonheight = height/6;
  int distance = width / 20;
  int midX1 = (width/2) - buttonlength - (distance/2);
  int midX2 = (width/2) + (distance/2);
  int midY = height - buttonheight - height/12;

  //tegner cirklerne
  drawCirkelLines();

  //samarbejdknap
  button(midX1, midY, buttonlength, buttonheight, color (0, 100, 0)); //(OpenAI, 2025)

  //forræd knap
  button(midX2, midY, buttonlength, buttonheight, color (139, 0, 0));//(OpenAI, 2025)

  //tekst på knapperne
  fill(255);
  textSize(height/13);
  text("Samarbejd", midX1 + buttonlength / 2, midY + buttonheight / 2);
  text("Forræd", midX2 + buttonlength / 2, midY + buttonheight / 2);

  //tæller runderne
  roundCount();

  //Computeren som modstander
  enemyChoice();

  //Ændre farverne på cirklerne når man trykker på knapperne
  playerChoice(midX1, midX2, midY, buttonlength, buttonheight);

  //slutter playscreen() når alle roundr er blevet spillet
  roundender();

  //Tæller samt viser os pointene
  pointcounter();
}


//Den sidste skærm, her kan man se om man vandt eller tabte
void endscreen() {

  //Finder hvor meget/lidt man har tabt/vundet med
  int pointForskel = abs(playerPoint-enemyPoint); //abs() udregner kun den positive værdi (Proccesing, u.d

  //Tekst der fortæller om har vundet eller ej inkl. pointforskel
  if (playerPoint>enemyPoint) {
    fill(255);
    textSize(height/9);
    text("Du vandt!!! med " + pointForskel + " point", width/2, height/4);
  } else if (playerPoint<enemyPoint) {
    fill(255);
    textSize(height/9);
    text("Du tabte ): med " + pointForskel + " point", width/2, height/4);
  } else if (playerPoint==enemyPoint) {
    fill(255);
    textSize(height/9);
    text("Uafgjordt", width/2, height/4);
  }

  //Varibler til knappen (OpenAI, 2025)
  int x1 = width/2-width/15-width/3;
  int x2 = width/2+width/15;
  int y = height/6*3;
  int Bheight = height/4;
  int Blength = width/3;


  //Knap der starter et nyt spil
  button(x1, y, Blength, Bheight, color(200, 100, 75));
  fill(255);
  textSize(height/13);
  text("Nyt spil", x1 + Blength / 2, y + Bheight / 2);

  //Når man trykker på knappen starter playscreen()
  if (mousePressed && mouseX > x1 && mouseX < x1 + Blength && mouseY > y && mouseY < y + Bheight) {
    reset();
    startscreen=false;
    endscreen = false;
    playscreen = true;
  }

  //knap der skal gå tilbage til start
  button(x2, y, Blength, Bheight, color(200, 100, 75));
  fill(255);
  textSize(height/13);
  text("Tilbage til start", x2 + Blength / 2, y + Bheight / 2);

  //Når man trykker på knappen starter startscreen()
  if (mousePressed && mouseX > x2 && mouseX < x2 + Blength && mouseY > y && mouseY < y + Bheight) {
    reset();
    endscreen = false;
  }
}
