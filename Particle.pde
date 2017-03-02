class Particle
{
  PVector location;
  float size;
  color body_color;
  float noise_z;
  
  Particle(float x, float y, float z, color c)
  {
    location = new PVector(x, y, z);
    size = 4;
    body_color = c;
    noise_z = random(10);
  }
  
  void update()
  {
    float z = map(noise(noise_z), 0, 1, -height / 5, height / 5);
    location = new PVector(location.x, location.y, z);
    noise_z += 0.05;
  }
  
  void display()
  {
    noStroke();

    pushMatrix();
    translate(location.x, location.y, location.z);
    fill(body_color);
    box(size);
    popMatrix();

  }
}