/* STARFIELD by Elias A.
 * A Processing project for Mr. Rhinelander's APCSA class at Armbrae Academy, Halifax, Canada.
 * Due 23 November 2018
 */

// These store the location of the origin of stars. Defaults to the center of the screen at the beginning
static int x, y;
Particle[] particle = new Particle[100];

void setup() {
  size(500,500);
  x = width / 2;
  y = height / 2;
  rectMode(CENTER);
  noStroke();
  // Array initializers
  particle[0] = new OddballParticle(x, y);
  particle[1] = new JumboParticle(x, y);
  for (int i = 2; i < particle.length; i++) particle[i] = new NormalParticle(x, y);
  background(0);
  frameRate(30);
}

void draw() {
  background(0);
  for (int i = 0; i < particle.length; i++) {
    // Show the particle if the distance from origin is greater than 5 pixels. Eliminates constant appearance of particles at the center
    if(sqrt((particle[i].getX()-x)*(particle[i].getX()-x)+(particle[i].getY()-y)*(particle[i].getY()-y)) > 5) particle[i].show();
    particle[i].move();
    // If the particle is off-screen generate a new one at (x, y)
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
  protected float x, y, initialSpeed, speed, angle;
  protected int i;
  protected color c;

  NormalParticle() {
    this.x = mouseX;
    this.y = mouseY;
    this.speed = this.initialSpeed = (float)(Math.random()*5)+2;
    this.angle = (float)(Math.random()*TWO_PI);
    this.i = 0;
    this.c = color((int)(Math.random()*128)+128,(int)(Math.random()*128)+128,(int)(Math.random()*128)+128);
  }
  NormalParticle(int x, int y) {
    this.x = x;
    this.y = y;
    this.speed = this.initialSpeed = (float)(Math.random()*10)+5;
    this.angle = (float)(Math.random()*TWO_PI);
    this.i = 0;
    this.c = color((int)(Math.random()*128)+128,(int)(Math.random()*128)+128,(int)(Math.random()*128)+128);
  }

  public void move() {
    this.x += Math.sin(this.angle)*this.speed;
    this.y += Math.cos(this.angle)*this.speed;
    this.speed *= 0.9995;
    this.i++;
  }
  public void show() {
    fill(c);
    // The size of the particle is dependent on its speed and the number of times it has moved, which furthers the three-dimensional illusion
    rect(this.x, this.y, this.initialSpeed * this.i / 50, this.initialSpeed * this.i / 50);
  }

  public float getX() {
    return x;
  }
  public float getY() {
    return y;
  }
}
class OddballParticle implements Particle
{
  private float x, y;
  private color c;

  OddballParticle() {
    this.x = mouseX;
    this.y = mouseY;
    this.c = color((int)(Math.random()*128)+128,(int)(Math.random()*128)+128,(int)(Math.random()*128)+128);
    
  }
  OddballParticle(int x, int y) {
    this.x = x;
    this.y = y;
    this.c = color((int)(Math.random()*128)+128,(int)(Math.random()*128)+128,(int)(Math.random()*128)+128);
  }

  public void show() {
    fill(c);
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

class JumboParticle extends NormalParticle {
  JumboParticle() {
    super();
  }
  JumboParticle(int x, int y) {
    super(x, y);
  }
  
  public void show() {
    fill(this.c);
    rect(this.x, this.y, 2 * this.initialSpeed, 2 * this.initialSpeed);
  }
}
interface Particle {
  public void move();
  public void show();
  public float getX();
  public float getY();
}
