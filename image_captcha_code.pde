


void setup(){
  String timeNow  =year() +""+month() + "" + day() + "_" +hour() + "" +minute() + ""+ second();
  println(timeNow);
  size(300, 300, P2D);
  smooth();

  generate(timeNow, 1);
  
}

void generate(String folder, int count){
  background(100);
  
  
  for (int x = 0; x < count; count++){
    background(100);
    String k = str(int(random(1000, 10000)));
    String v = str(int(random(1000, 10000)));
    textAlign(CENTER, CENTER);
    textSize(20);
    text(v, 150, 150);
    save("generated/" + folder + "/test.jpg");
  }
  exit(); 
}
