


color pink = color(255, 102, 204,150);

/*
loadPixels();
for (int i = 0; i < 300; i++) {
  pixels[i] = pink;
}
updatePixels();

*/




void setup()
{
    size(100,100);
  
    loadPixels();

    pixels[getOneDirectionLocation(10,10)]=pink;

    updatePixels();
}


int getOneDirectionLocation(int x,int y)
{
  return x + (y*width);
}
