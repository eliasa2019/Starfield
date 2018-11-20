/* STARFIELD by Elias A.
 * A Processing project for Mr. Rhinelander's APCSA class at Armbrae Academy, Halifax, Canada.
 * Due 23 November 2018
 */

int width = 700;
int height = 700;
Particle[] particle = new Particle[100];

void settings() {
  size(width, height);
}

void setup() {
  rectMode(CENTER);
  particle[0] = new OddballParticle(width / 2, height / 2);
  particle[1] = new JumboParticle(width / 2, height / 2);
  for (int i = 2; i < particle.length; i++) particle[i] = new NormalParticle(width / 2, height / 2);
  background(0);
}

void draw() {
  background(0);
  for (int i = 0; i < particle.length; i++) {
    particle[i].show();
    particle[i].move();
    if (particle[i].getX() < 0 || width < particle[i].getX() || particle[i].getY() < 0 || height < particle[i].getY()) {
      switch(i) {
      case 0:
        particle[i] = new OddballParticle(width / 2, height / 2);
        break;
      case 1:
        particle[i] = new JumboParticle(width / 2, height / 2);
        break;
      default:
        particle[i] = new NormalParticle(width / 2, height / 2);
      }
    }
  }
}

void mouseClicked() {
  particle[0] = new OddballParticle();
  particle[1] = new JumboParticle();
  for (int i = 2; i < particle.length; i++) particle[i] = new NormalParticle();
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
  float x, y, speed, angle;
  int[] colour = new int[3];

  JumboParticle() {
    this.x = mouseX;
    this.y = mouseY;
    this.speed = (float)(Math.random()*10);
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
    rect(this.x, this.y, 8, 8);
  }
  public void move() {
    this.x += Math.sin(this.angle)*this.speed;
    this.y += Math.cos(this.angle)*this.speed;
    this.speed *= 0.99;
  }

  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
}
