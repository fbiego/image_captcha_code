
int no_of_images = 10;

void setup(){

  size(300, 300);
  smooth();
  colorMode(HSB, 360, 100, 100);
  
  String timeNow = year() +""+month() + "" + day() + "_" +hour() + "" +minute() + ""+ second();
  //generate(timeNow, no_of_images);
  scramble("1234");
  
}

void noise(){
  
  fill(0);          
  stroke(0);      
  strokeWeight(2);
  for(int y = 0; y < 1000; y++){
    int a = randI(0, 300);
    int b = randI(0, 300);
    circle(a, b, 4);
  }
  
  for(int y = 0; y < 200; y++){
    int a = randI(0, 300);
    int b = randI(0, 300);
    int c = randI(0, 300);
    int d = randI(0, 300);
    line(a, b, c, d);
  }
  
}

void scramble(String code){
  background(360);  // background color
  noise();    // generate random lines & dots
  fill(randC(100));  // text color
  textAlign(CENTER, CENTER);
  textSize(80);
  //text(code, 150, 150);
  text(code.charAt(0), 75, randI(100, 200));
  fill(randC(100));
  text(code.charAt(1), 125, randI(100, 200));
  fill(randC(100));
  text(code.charAt(2), 175, randI(100, 200));
  fill(randC(100));
  text(code.charAt(3), 225, randI(100, 200));
}

int randI(int min, int max){
  return int(random(min, max));
}

color randC(int b){
  return color(randI(0, 360), 100, b);
}


void generate(String folder, int count){
  
  JSONArray json = new JSONArray();
  
  for (int x = 0; x < count; x++){
    
    JSONObject j = new JSONObject();
    String k = str(randI(1000, 10000));
    String v = str(randI(1000, 10000));
    
    File f = dataFile("generated/" + folder + "/" + k +".jpg");
    boolean exist = f.isFile();

    if (exist){
      --x;
      continue;
    }
    j.setString(k, v);
    json.setJSONObject(x, j);
    scramble(v);
    save("generated/" + folder + "/" + k +".jpg");
  }
  saveJSONArray(json, "generated/" + folder + "/mapping.json");
  exit(); 
}
