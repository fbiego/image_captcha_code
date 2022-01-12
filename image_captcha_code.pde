

void setup(){

  size(300, 300, P2D);
  smooth();

  String timeNow  =year() +""+month() + "" + day() + "_" +hour() + "" +minute() + ""+ second();
  generate(timeNow, 10);
  
  
}


void generate(String folder, int count){
  
  JSONObject json = new JSONObject();
  
  for (int x = 0; x < count; x++){
    background(255);
    fill(0);
    String k = str(int(random(1000, 10000)));
    String v = str(int(random(1000, 10000)));
    if (!json.isNull(k)){
      --x;
      continue;
    }
    json.setString(k, v);
    textAlign(CENTER, CENTER);
    textSize(60);
    text(v, 150, 150);
    save("generated/" + folder + "/" + k +".jpg");
  }
  saveJSONObject(json, "generated/" + folder + "/mapping.json");
  exit(); 
}
