#define RED_LED 9
#define GREEN_LED 10
#define BLUE_LED 11


int brightness = 255;

int gBright = 0;
int rBright = 0;
int bBright = 0;

int fadeSpeed = 10;

void setup() {
  Serial.begin(230400);
  while (!Serial) {
    ; // wait for serial port to connect. Needed for native USB port only
  }


  pinMode(GREEN_LED, OUTPUT);
  pinMode(RED_LED, OUTPUT);
  pinMode(BLUE_LED, OUTPUT);
  
  analogWrite(RED_LED, 128);
  analogWrite(GREEN_LED, 0);
  analogWrite(BLUE_LED, 0);
}

void loop() {
  if (Serial.available()) {
    int inByte = Serial.read();
    
    switch (inByte) {
    case 'r':
      do {
        inByte = Serial.read();
      } while (inByte == -1);
      analogWrite(RED_LED, inByte);
      break;

    case 'g':
      do {
        inByte = Serial.read();
      } while (inByte == -1);
      analogWrite(GREEN_LED, inByte);
      break;

    case 'b':
      do {
        inByte = Serial.read();
      } while (inByte == -1);
      analogWrite(BLUE_LED, inByte);
      break;

    }
  }
}

