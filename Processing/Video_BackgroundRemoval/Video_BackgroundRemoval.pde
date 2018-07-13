
import processing.video.*;


// Variable for capture device
Capture cam;
// Saved background
PImage backgroundImage;
// How different must a pixel be to be a foreground pixel
float threshold = 80;


PImage photo;




void setup(){
size(320,240);
cam =new Capture(this, width, height, 30);
// Create an empty image the same size as the video
backgroundImage = createImage(cam.width,cam.height,RGB);

photo = loadImage("DSC02498.jpg");

cam.start();

 }
 
void draw(){
  // Capture video
  if (cam.available()){
      cam.read();
    }


  loadPixels();
    cam.loadPixels();
    backgroundImage.loadPixels();
    photo.loadPixels();

    // Draw the video image on the background
    
   // image(photo, 0, 0);
    image(cam,0,0);
    
    
    
    // Begin loop to walk through every pixel
    for (int x = 0; x < cam.width; x++) {
        for (int y = 0; y < cam.height; y++) {
  
          
          int loc = x + y*cam.width; // Step 1, what is the 1D pixel location
          color fgColor = cam.pixels[loc]; // Step 2, what is the foreground color
          // Step 3, what is the background color
          color bgColor = backgroundImage.pixels[loc];
          // Step 4, compare the foreground and background color
          float r1 = red(fgColor);
          float g1 = green(fgColor);
          float b1 = blue(fgColor);
          float r2 = red(bgColor);
          float g2 = green(bgColor);
          float b2 = blue(bgColor);
           float diff = dist(r1,g1,b1,r2,g2,b2);

          if (diff > threshold){
          // If so, display the foreground color
            pixels[loc]= fgColor;
            } else {
              
              
              // If not, display green
             // pixels[loc] = color(0,255,0);
              
              pixels[loc] = photo.pixels[loc];
              
              
            }
  
        }
      }




      updatePixels();
 }
 
 
 void mousePressed(){
  // Copying the current frame of video into the backgroundImage object
  // Note copy takes 5 arguments:
  // The source image
  // x,y,width, and height of region to be copied from the source
  // x,y,width, and height of copy destination
 
  backgroundImage.copy(cam,0,0,cam.width,cam.height,0,0,cam.width,cam.height);
  backgroundImage.updatePixels();


}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  
  threshold +=e;
}



