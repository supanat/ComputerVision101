

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
  //rect(10,10,100,100);

  loadPixels();
  cam.loadPixels();
  
    
    for (int x = 0; x < cam.width; x++) {
            for (int y = 0; y < cam.height; y++){
              
              
              int index = getOneDirectionLocation(x,y);
              
               float r,g,b;
                r = red (cam.pixels[index]);
                g = green (cam.pixels[index]);
                b = blue (cam.pixels[index]);
                
                //g *= 10;
                
                
                float maxdist = 200;
                float d = dist(x,y,mouseX,mouseY);
                float adjustbrightness = (maxdist-d)/maxdist;
                
                r *= adjustbrightness;
                g *= adjustbrightness;
                b *= adjustbrightness;
                
                
                if(adjustbrightness>0)
                {
                  r *= 10;
                }
                
                
                
                r = constrain(r,0,255);
                g = constrain(g,0,255);
                b = constrain(b,0,255);
                

                color outColor = color(r,g,b);
                pixels[index] = outColor;
          }
    }
    

    
  
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





