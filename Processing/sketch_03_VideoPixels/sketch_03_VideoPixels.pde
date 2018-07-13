

import processing.video.*;

Capture cam;


color pink = color(255, 102, 204,100);


void setup()
{
  size( 640, 480 );
 // smooth();
  //println( Capture.list() );
  cam = new Capture( this, width, height, 30 );
  cam.start();
  
}

void draw()
{
  background( 255 );
  
  image( cam, 0, 0 );
  rect(10,10,100,100);

  loadPixels();
  cam.loadPixels();
  
    
    /*
    for (int i = 0; i < (width*height)/2; i++) {
          pixels[i] = pink;
    }
    */
    
    pixels[getOneDirectionLocation(10,10)]=pink;
    
  
   updatePixels();
    
  
}

void captureEvent( Capture cam )
{
  cam.read();
}

int getOneDirectionLocation(int x,int y)
{
  return x + (y*width);
}





