boolean checkMap(float x, float y, PImage img) {

  int xPos = int(x);
  int yPos = int(y);

  int mapColor = img.get(xPos, yPos);

  if (mapColor < -4790000 && mapColor > -4870000) { // detect green areas
    return true;
  } 
  else {
    return false;
  }
}

