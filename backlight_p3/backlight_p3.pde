import processing.serial.*;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;


final String AR_SERIAL_NAME = "/dev/ttyACM0";

Serial AR_serial;

byte [] rgb_val = new byte[3];
byte[][] rgb_val_packet = new byte[3][2];

ColorPicker cp;

void setup() {
    size( 500, 500 );
    frameRate( 100 );
    cp = new ColorPicker( 10, 10, 400, 400, 255 );
    
    println(Serial.list());

    try {
        AR_serial = new Serial(this, AR_SERIAL_NAME, 230400);
    } catch (Exception e) {
        println("Error opening AR port: " + AR_SERIAL_NAME);
        exit();
    }
    
    rgb_val_packet[0][0] = 'r';
    rgb_val_packet[1][0] = 'g';
    rgb_val_packet[2][0] = 'b';
}



void draw ()
{
  background( 80 );
  cp.render();
  
  rgb_val = cp.get_rgb_val();
  
  send_val(rgb_val);
}


void keyPressed() {
  /*
  switch (key) {
      case('r'):
          if (rgb_val[0] + 1 <= 255) 
              ++rgb_val[0];
          break;
      case('f'):
          if (rgb_val[0] - 1 >= 0) 
              --rgb_val[0];
          break;
      case('t'):
          if (rgb_val[1] + 1 <= 255) 
              ++rgb_val[1];
          break;          
      case('g'):
          if (rgb_val[1] - 1 >= 0) 
              --rgb_val[1];
          break;
      case('y'):
          if (rgb_val[2] + 1 <= 255) 
              ++rgb_val[2];
          break;
      case('h'):
          if (rgb_val[2] - 1 >= 0) 
              --rgb_val[2];
      break;      
  }
  
  send_val(rgb_val);
  */
  
}


void send_val(byte [] rgb_val) {
    
    /*
    for (int ch = 0; ch < semg_channel; ++ch) {
        NN_serial[0].write(ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putFloat(p_semg[ch]).array());
        NN_serial[1].write(ByteBuffer.allocate(4).order(ByteOrder.LITTLE_ENDIAN).putFloat(p_semg[ch]).array());
    }
    */
    
    for (int i = 0; i < 3; ++i) {
        rgb_val_packet[i][1] = (byte) rgb_val[i];
        AR_serial.write(rgb_val_packet[i]);
    }
    for (int i = 0; i < 3; ++i)
        print(rgb_val[i]+ " ");
    println("");
}
