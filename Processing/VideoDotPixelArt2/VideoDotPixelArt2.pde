

import processing.video.*;

Capture cam;

color pink = color(255, 102, 204,100);

int videoScale = 20;
int cols, rows;


float startAngle = 0;
float angleVel = 0.5;

 String letterOrder;
 char[] letters;
 

 


void setup()
{
  size( 640, 480 );
 // smooth();
  //println( Capture.list() );
  
 letterOrder = " .`-_':,;^=+/\"|)\\<>)iv%xclrs{*}I?!][1taeo7zjLu" +
  "nT#JCwfy325Fp6mqSghVd4EgXPGZbYkOA&8U$@KHDBWNMR0Q";
  

  
  letters = new char[256];
  for (int i = 0; i < 256; i++) {
    int index = int(map(i, 0, 256, 0, letterOrder.length()));
    letters[i] = letterOrder.charAt(index);
  }
  
  
    cols =width/videoScale;
    rows =height/videoScale;
  
  
  cam = new Capture( this, width, height, 30 );
  cam.start();
  
}

void draw()
{
  background( 255 );
  

  //image( cam, 0, 0 );


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
              

              fill(c);
              stroke(0);
             //ellipse(x,y,videoScale,videoScale);
            // rect(x,y,videoScale,videoScale);
             
              //fill(0,0,0,0);
              //rect(x,y,videoScale,videoScale);
              
               int r =0;
             
                 r = int(random(60));
       
              
              textSize(50);
              fill(c);
              text(letters[r],x,y);
              
              
              
              
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





