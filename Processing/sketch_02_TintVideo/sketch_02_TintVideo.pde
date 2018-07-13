
import processing.video.*;

Capture webcam;

void setup()
{
  size( 640, 480 );
 // smooth();
  println( Capture.list() );
  webcam = new Capture( this, width, height, 30 );
  webcam.start();
  
}

void draw()
{
  background( 255 );
  
  tint(mouseX,mouseY,255);
  
  image( webcam, 0, 0,mouseX,mouseY);
}

void captureEvent( Capture webcam )
{
  webcam.read();
}

