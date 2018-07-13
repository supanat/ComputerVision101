

import processing.video.*;

Capture cam;

color pink = color(255, 102, 204,100);

int videoScale = 12;
int cols, rows;



void setup()
{
  //size( 640, 480 );
   size( 1280, 720 );
 // smooth();
  println( Capture.list() );
  
    cols =width/videoScale;
    rows =height/videoScale;
  
  
  cam = new Capture( this, width, height, 30 );
  cam.start();
  
}

void draw()
{
  background( 255 );
  

 // image( cam, 0, 0 );


  loadPixels();
  cam.loadPixels();
  
   // Begin loop for columns
    for (int i = 0; i<cols; i++) {
    // Begin loop for rows
        for (int j = 0; j< rows; j++) {
              // Where are we, pixel-wise?
              
              
              int x =i*videoScale;
              int y =j*videoScale;
              
              
              color c = cam.pixels[x + y*cam.width];
              
              
              fill(c,255);
              stroke(255,255,255,30);
             rect(x,y,videoScale,videoScale);
             
              //fill(0,0,0,0);
              //rect(x,y,videoScale,videoScale);
              
        }
    }
    

  
}

void captureEvent( Capture cam )
{
  cam.read();
}

int getOneDirectionLocation(int x,int y)
{
  return x + (y*width);
}





