int width = 700;
int height = 700;
Particle[] particle = new Particle[100];

void settings() {
  size(width, height);
}
void setup() {
  particle[0] = new OddballParticle(width / 2, height / 2);
  //particle[1] = new JumboParticle(width / 2, height / 2);
  for (int i = 1; i < particle.length; i++) particle[i] = new NormalParticle(width / 2, height / 2);
  background(0);
}

void draw() {
  background(0);
  for (int i = 0; i < particle.length; i++) {
    particle[i].show();
    particle[i].move();
  }
}

void mouseClicked() {
  particle[0] = new OddballParticle();
  for (int i = 1; i < particle.length; i++) particle[i] = new NormalParticle();
  background(0);
}

class NormalParticle implements Particle {
  float x, y, speed, angle;
  int[] colour = new int[3];

  NormalParticle() {
    this.x = mouseX;
    this.y = mouseY;
    this.speed = (float)(Math.random()*10);
    this.angle = (float)(Math.random()*TAU);
    for (int i = 0; i < colour.length; i++) this.colour[i] = (int)(Math.random()*128)+128;
  }
  NormalParticle(int x, int y) {
    this.x = x;
    this.y = y;
    this.speed = (float)(Math.random()*10);
    this.angle = (float)(Math.random()*TAU);
    for (int i = 0; i < colour.length; i++) this.colour[i] = (int)(Math.random()*128)+128;
  }

  public void move() {
    this.x += Math.sin(this.angle)*this.speed;
    this.y += Math.cos(this.angle)*this.speed;
    this.speed *= 0.99;
  }
  public void show() {
    fill(this.colour[0], this.colour[1], this.colour[2]);
    rect(this.x, this.y, 4, 4);
  }
}
interface Particle {
  public void move();
  public void show();
}
class OddballParticle implements Particle
{
  float x, y;

  OddballParticle() {
    this.x = mouseX;
    this.y = mouseY;
  }
  OddballParticle(int x, int y) {
    this.x = x;
    this.y = y;
  }

  public void show() {
    fill((float)(Math.random()*128)+128, (float)(Math.random()*128)+128, (float)(Math.random()*128)+128);
    rect(this.x, this.y, 8, 8);
  }
  public void move() {
    this.x += Math.random()*10 - 5;
    this.y += Math.random()*10 - 5;
  }
}
/*
class JumboParticle implements Particle extends NormalParticle
{
  int x, y;
  int[] colour;
  
  JumboParticle() {
    this.x = mouseX;
    this.y = mouseY;
  }
  JumboParticle(int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  public void show() {
    
  }
}
*/
