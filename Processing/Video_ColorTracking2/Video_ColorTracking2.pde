import processing.video.*;

Capture cam;
color trackColor;

// Declare two arrays with 50 elements.
int[] xpos = new int[50]; 
int[] ypos = new int[50];


void setup(){
  size(352,288);
  
  println(cam.list());
  
  cam= new Capture(this,width,height,30);
  
  
  
  // Start off tracking for red
  trackColor = color(255,0,0);
 // smooth();
 
  // Initialize all elements of each array to zero.
  for (int i = 0; i < xpos.length; i ++ ) {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
  
  cam.start();
  
}

void captureEvent( Capture cam )
{
  cam.read();
}

void draw(){

  
    
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
    
    //cam.updatePixels();
    
    
    if (worldRecord < 10){
        // Draw a circle at the tracked pixel
      fill(trackColor);
      strokeWeight(2.0);
      //stroke(0);
      //ellipse(closestX,closestY,16,16);
      
      stroke(204, 102, 0);
      rect(closestX,closestY,24,24);
      
     }
    
   // line(closestX, closestY, pmouseX, pmouseY);
   
   //variableEllipse(mouseX, mouseY, pmouseX, pmouseY);
    
    drawSnake(closestX,closestY);
    
    
}

void drawSnake(int x,int y){

// Shift array values
  for (int i = 0; i < xpos.length-1; i ++ ) {
    // Shift all elements down one spot. 
    // xpos[0] = xpos[1], xpos[1] = xpos = [2], and so on. Stop at the second to last element.
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  }
  
  // New location
  xpos[xpos.length-1] = x; // Update the last spot in the array with the mouse location.
  ypos[ypos.length-1] = y;
  
  // Draw everything
  for (int i = 0; i < xpos.length; i ++ ) {
     // Draw an ellipse for each element in the arrays. 
     // Color and size are tied to the loop's counter: i.
    noStroke();
    fill(255-i*5);
    ellipse(xpos[i],ypos[i],i,i);
  }
}


void mousePressed(){
  // Save color where the mouse is clicked in trackColor variable
  int loc = mouseX + mouseY*cam.width;
  trackColor = cam.pixels[loc];
  
  
  println(red(trackColor)+","+green(trackColor)+","+blue(trackColor));
  
}

