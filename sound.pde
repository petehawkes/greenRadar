// 
// Simple sin wave sound

void changeFrequency(float fader) {
  freqCount+=fader/10;
}

void updateFrequency() {
  if (freqCount > 0) {
    freqCount*=.5;
  }
  float freq = map(freqCount, 200, 0, 1500, 60);
  sine.setFreq(freq);
}

void stop() {
  // always close Minim audio classes when you are done with them
  //wood.close();
  minim.stop();
  super.stop();
}


