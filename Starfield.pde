//your code here
void setup()
{
	//your code here
}
void draw()
{
	//your code here
}
class NormalParticle implements Particle
{
	float x, y, speed, angle;
  int[] colour = new int[3];
  
  NormalParticle() {
    this.x = width / 2;
    this.y = height / 2;
    this.speed = (float)(Math.random()*10);
    this.angle = (float)(Math.random()*Math.PI);
  }
  
  void move() {
    this.x += Math.sin(this.angle);
    this.y += Math.cos(this.angle);
  }
  void show() {
    ellipse(this.x, this.y, 2, 2);
  }
}
interface Particle
{
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
