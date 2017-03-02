
ArrayList<Particle> particles;
float angle;

void setup()
{
  size(512, 512, P3D);
  hint(DISABLE_DEPTH_TEST);
  frameRate(30);

  PImage img = loadImage("Lenna.png");
  image(img, 0, 0);
  loadPixels();
  background(0);
  
  particles = new ArrayList<Particle>();
  
  int span = 4;
  for(int x = 0; x < width; x += span)
  {
    for(int y = 0; y < height ; y += span)
    {
      float r = red(pixels[x + y * width]);
      float g = green(pixels[x + y * width]);
      float b = blue(pixels[x + y * width]);
      particles.add(new Particle(x, y, 0, color(r, g, b)));
    }
  }
    
  angle = 90;
}

void draw()
{
  background(0);
  
  if(frameCount == 1 || frameCount > 90)
  {
    angle = (angle + 1) % 360;
    float radius = (height / 2.0) / tan(PI*60.0 / 360.0);
    float x = radius * cos(radians(angle));
    float z = radius * sin(radians(angle));
      
    camera(x + width / 2.0, height / 2.0, z, 
           width / 2.0, height / 2.0, 0.0, 
           0.0, 1.0, 0.0);
  }
 
  
  for(Particle p : particles)
  {
    p.update();
    p.display();
  }
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 450)
  {
     exit();
  }
  */
}