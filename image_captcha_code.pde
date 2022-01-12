

void setup(){

  size(300, 300, P2D);
  smooth();

  String timeNow  =year() +""+month() + "" + day() + "_" +hour() + "" +minute() + ""+ second();
  generate(timeNow, 50);
  
  
}


void generate(String folder, int count){
  
  JSONArray json = new JSONArray();
  String[] s = new String[count]; 
  
  for (int x = 0; x < count; x++){
    background(255);
    fill(0);
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
