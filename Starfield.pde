/* STARFIELD by Elias A.
 * A Processing project for Mr. Rhinelander's APCSA class at Armbrae Academy, Halifax, Canada.
 * Due 23 November 2018
 */

int width = 700;
int height = 700;
int x = width / 2;
int y = height / 2;
Particle[] particle = new Particle[100];

void settings() {
  size(width, height);
}

void setup() {
  rectMode(CENTER);
  particle[0] = new OddballParticle(width / 2, height / 2);
  particle[1] = new JumboParticle(width / 2, height / 2);
  for (int i = 2; i < particle.length; i++) particle[i] = new NormalParticle(x, y);
  background(0);
}

void draw() {
  background(0);
  for (int i = 0; i < particle.length; i++) {
    if(sqrt((particle[i].getX()-x)*(particle[i].getX()-x)+(particle[i].getY()-y)*(particle[i].getY()-y)) > 5)    // If particle's coords are sufficiently away enough from the origin
    particle[i].show();
    particle[i].move();
    if (particle[i].getX() < 0 || width < particle[i].getX() || particle[i].getY() < 0 || height < particle[i].getY()) {
      switch(i) {
      case 0:
        particle[i] = new OddballParticle(x, y);
        break;
      case 1:
        particle[i] = new JumboParticle(x, y);
        break;
      default:
        particle[i] = new NormalParticle(x, y);
      }
    }
  }
}

void mouseClicked() {
  x = mouseX;
  y = mouseY;
  particle[0] = new OddballParticle();
  particle[1] = new JumboParticle();
  for (int i = 2; i < particle.length; i++) particle[i] = new NormalParticle();
  background(0);
}

class NormalParticle implements Particle {
  private float x, y, speed, angle;
  int[] colour = new int[3];

  NormalParticle() {
    this.x = mouseX;
    this.y = mouseY;
    this.speed = (float)(Math.random()*10)+5;
    this.angle = (float)(Math.random()*TAU);
    for (int i = 0; i < colour.length; i++) this.colour[i] = (int)(Math.random()*128)+128;
  }
  NormalParticle(int x, int y) {
    this.x = x;
    this.y = y;
    this.speed = (float)(Math.random()*10)+5;
    this.angle = (float)(Math.random()*TAU);
    for (int i = 0; i < colour.length; i++) this.colour[i] = (int)(Math.random()*128)+128;
  }

  public void move() {
    this.x += Math.sin(this.angle)*this.speed;
    this.y += Math.cos(this.angle)*this.speed;
    this.speed *= 0.999;
  }
  public void show() {
    fill(this.colour[0], this.colour[1], this.colour[2]);
    rect(this.x, this.y, this.speed / 3, this.speed / 3);    // Size is dependent on speed
  }

  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
}
interface Particle {
  public void move();
  public void show();
  public float getX();
  public float getY();
}
class OddballParticle implements Particle
{
  private float x, y;

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
    rect(this.x, this.y, 4, 4);
  }
  public void move() {
    this.x += Math.random()*10 - 5;
    this.y += Math.random()*10 - 5;
  }

  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
}

class JumboParticle extends NormalParticle implements Particle {
  private float x, y, speed, angle;
  int[] colour = new int[3];

  JumboParticle() {
    this.x = mouseX;
    this.y = mouseY;
    this.speed = (float)(Math.random()*10)+20;
    this.angle = (float)(Math.random()*TAU);
    for (int i = 0; i < colour.length; i++) colour[i] = (int)(Math.random()*128+128);
  }
  JumboParticle(int x, int y) {
    this.x = x;
    this.y = y;
    this.speed = (float)(Math.random()*10);
    this.angle = (float)(Math.random()*TAU);
    for (int i = 0; i < colour.length; i++) colour[i] = (int)(Math.random()*128+128);
  }

  public void show() {
    fill(this.colour[0], this.colour[1], this.colour[2]);
    rect(this.x, this.y, 10, 10);
  }
  public void move() {
    this.x += Math.sin(this.angle)*this.speed;
    this.y += Math.cos(this.angle)*this.speed;
    this.speed *= 0.999;
  }

  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
}
