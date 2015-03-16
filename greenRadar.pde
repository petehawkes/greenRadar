/**
 * Multiple Particle Systems
 * by Daniel Shiffman.  
 * 
 */
import processing.opengl.*;
ArrayList psystems;

boolean falseBeat = true;
int beatStamp = 0;

//
// MAP STUFF
PImage myMap;
PGraphics buffer;
PImage img;


//
// SOUND
import ddf.minim.*;
import ddf.minim.signals.*;

AudioSample beat;
Minim minim;
AudioOutput out;
SineWave sine;

int freqCount = 0;

//
// SERIAL

// Include the serial library
import processing.serial.*;

// Variable declaration
Serial port;                           // The serial port
byte[] rspCharArray = new byte[32];    // Where we'll put the raw data read from the HRMI device
int[] rspArgArray = new int[3];        // Where we'll put the converted response values
int validData = 0;
int CR = 13; // <CR> constant


int beatCount = 0;
float fader =100;

void setup() {
  size(1024, 768, OPENGL);
  colorMode(RGB, 255, 255, 255, 100);
  psystems = new ArrayList();
  smooth();

  //
  // MAP
  myMap = loadImage("santamonica.png");
  buffer = createGraphics(1024, 768, P3D);

  //
  // SOUND
  minim = new Minim(this);
  beat = minim.loadSample("echo_mod.mp3");
  beat.setGain(0);

  out = minim.getLineOut(Minim.STEREO);
  sine = new SineWave(440, 0.5, out.sampleRate());
  sine.portamento(200);
  out.addSignal(sine);

  //
  // SERIAL
  if (!falseBeat) {
    port = new Serial(this, "/dev/tty.usbserial-A700e5Pv", 9600);
    port.bufferUntil(CR);  
    port.write('S');
    port.write('0');
    port.write(CR);
  }


  background(0);
}




void draw() {
  background(0);
  if (mousePressed) {
    fader += (60-fader)*.1;
    
   
  } else {
    fader += (100-fader)*.1; 
  }
  
   image(myMap, 0, 0);
    fill(0, fader);
    rect(0, 0, width, height);


  if (!falseBeat) {
    checkBeat();
  } 
  else {
    makeFalseBeat();
  }

  updateFrequency();

  // Cycle through all particle systems, run them and delete old ones
  for (int i = psystems.size()-1; i >= 0; i--) {
    ParticleSystem psys = (ParticleSystem) psystems.get(i);
    psys.run();
    if (psys.dead()) {
      psystems.remove(i);
    }
  }
}




// When the mouse is pressed, add a new particle system
void mousePressed() {
 // makePulse();
}


