import processing.video.*;

Capture cam;
color trackColor;

void setup(){
  size(352,288);
  
  println(cam.list());
  
  cam= new Capture(this,width,height,30);
  
  
  
  // Start off tracking for red
  trackColor = color(255,0,0);
  smooth();
  
  cam.start();
  
}

void draw(){
  // Capture and display the video
  if (cam.available()){
      cam.read();
  }
  
   fill(trackColor);
   rect(0,0,50,50);
    
   cam.loadPixels();
   image(cam,0,0);
    
   
    // Closest record, we start with a high number
    
    float worldRecord= 1000;
    // XY coordinate of closest color
    int closestX = 0;
    int closestY = 0;
    
    // Begin loop to walk through every pixel
    for (int x = 0; x < cam.width; x++) {
      for (int y = 0; y < cam.height;y++){
    
        
        int loc = x + y*cam.width;
        // What is current color
        color currentColor =cam.pixels[loc];
        
        float r1 = red(currentColor);
        float g1 = green(currentColor);
        float b1 = blue(currentColor);
        float r2 = red(trackColor);
        float g2 = green(trackColor);
        float b2 = blue(trackColor);

        // Using euclidean distance to compare colors
        
        float d = dist(r1,g1,b1,r2,g2,b2);
        // If current color is more similar to tracked color than
        // closest color, save current location and current difference
        if (d<worldRecord){
            worldRecord = d;
            closestX = x;
            closestY = y;
         }
        
      }

    }
    
    
    if (worldRecord < 10){
        // Draw a circle at the tracked pixel
      fill(trackColor);
      strokeWeight(2.0);
      stroke(0);
      //ellipse(closestX,closestY,16,16);
      
      stroke(204, 102, 0);
      rect(closestX,closestY,24,24);
      
     }
    
    
    
}


void mousePressed(){
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*cam.width;
  trackColor = cam.pixels[loc];
  
  
  println(red(trackColor)+","+green(trackColor)+","+blue(trackColor));
  
}

