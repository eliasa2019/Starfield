int width = 300;
int height = 300;
NormalParticle[] particle = new NormalParticle[100];

void settings() {
  size(width, height);
}
void setup() {
  for (int i = 0; i < particle.length; i++) particle[i] = new NormalParticle();
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
  setup();
}

class NormalParticle implements Particle {
	float x, y, speed, angle;
  int[] colour = new int[3];
  
  NormalParticle() {
    this.x = width / 2;
    this.y = height / 2;
    this.speed = (float)(Math.random()*5)+3;
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
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}
