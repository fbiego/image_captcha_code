
int no_of_images = 50;

void setup(){

  size(300, 300);
  smooth();

  String timeNow = year() +""+month() + "" + day() + "_" +hour() + "" +minute() + ""+ second();
  generate(timeNow, no_of_images);
  
  
}


void generate(String folder, int count){
  
  JSONArray json = new JSONArray();
  
  for (int x = 0; x < count; x++){
    background(255);  // background color
    fill(0);          // text color
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
    textSize(60);
    text(v, 150, 150);
    save("generated/" + folder + "/" + k +".jpg");
  }
  saveJSONArray(json, "generated/" + folder + "/mapping.json");
  exit(); 
}
