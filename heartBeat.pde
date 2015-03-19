//
// HEART BEAT DETECTION
// Polar Heart Monitor: http://www.amazon.com/Polar-T31-Non-Coded-Transmitter-Belt/dp/B000N4N4UG/
// Polar Heart Rate Interface from Sparkfun: https://www.sparkfun.com/products/8661

void checkBeat() {
  validData = 0;
  port.write('G');
  port.write('1');
  port.write(CR);

  if (beatCount != rspArgArray[1]) {
    beatCount = rspArgArray[1];
    triggerBeat();
    //println("beat");
  }
}

void triggerBeat() {
  //println("triggerBeat");
  beat.trigger();  
  if (mouseX>0 && mouseX < width && mouseY >0 && mouseY < height) {
    psystems.add(new ParticleSystem(360, new PVector(mouseX, mouseY)));
  }
}


void makeFalseBeat() {
  if (millis() - beatStamp > 1000) {
    triggerBeat();
    beatStamp = millis();
  }
}


void makePulse() {
  psystems.add(new ParticleSystem(360, new PVector(mouseX, mouseY)));
}


void serialEvent(Serial port) {
  if (port.readBytesUntil(CR, rspCharArray) != 0) {
    // Read bytes until we get to the end of the packet converting
    // each ASCII digit into a number.  We make use of the space
    // character between sets of digits to delimit numbers.
    //    Argument 0: Status Flags
    //    Argument 1: Second Count
    //    Argument 2: Heartrate
    //
    int ArgIndex = 0;
    int CharIndex = 0;
    for (int i=0; i<3; i++) rspArgArray[i] = 0;
    while (rspCharArray[CharIndex] != CR) {
      if (rspCharArray[CharIndex] != ((byte) ' ')) {
        rspArgArray[ArgIndex] = (rspArgArray[ArgIndex]*10) + (rspCharArray[CharIndex] - ((byte) '0'));
      } 
      else {
        ArgIndex++;
      }
      CharIndex++;
    }
    validData = 1;
  }
}

