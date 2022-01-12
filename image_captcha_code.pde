
int no_of_images = 10;

void setup(){

  size(300, 300);
  smooth();

  String timeNow = year() +""+month() + "" + day() + "_" +hour() + "" +minute() + ""+ second();
  generate(timeNow, no_of_images);
  
  
}

void noise(){
  background(255);  // background color
  fill(0);          
  stroke(0);        
  strokeWeight(2);
  for(int y = 0; y < 1000; y++){
    int a = int(random(0, 300));
    int b = int(random(0, 300));
    circle(a, b, 4);
  }
  
  for(int y = 0; y < 200; y++){
    int a = int(random(0, 300));
    int b = int(random(0, 300));
    int c = int(random(0, 300));
    int d = int(random(0, 300));
    line(a, b, c, d);
  }
  
}


void generate(String folder, int count){
  
  JSONArray json = new JSONArray();
  
  for (int x = 0; x < count; x++){
    noise();    // generate random lines & dots
    fill(255);  // text color
    JSONObject j = new JSONObject();
    String k = str(int(random(1000, 10000)));
    String v = str(int(random(1000, 10000)));
    
    File f = dataFile("generated/" + folder + "/" + k +".jpg");
    boolean exist = f.isFile();

    if (exist){
      --x;
      continue;
    }
    j.setString(k, v);
    json.setJSONObject(x, j);
    textAlign(CENTER, CENTER);
    textSize(100);
    text(v, 150, 150);
    save("generated/" + folder + "/" + k +".jpg");
  }
  saveJSONArray(json, "generated/" + folder + "/mapping.json");
  exit(); 
}
