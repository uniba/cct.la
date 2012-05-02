Particle[] particles = new Particle[20000];

int m  = 0;  // margin
int ww = 1000; // window width
int wh = 200; // window height
PImage img = createImage(ww, wh, ARGB);

void setup() {
  frameRate(60);
  size(ww, wh);
  noStroke();
  background(255); 
  for (int i=0; i<particles.length; i++) {
    particles[i] = new Particle(m+random(ww-m*2), m+random(wh-m*2));
  }
}

void draw() {
  int[] p = new int[ww*wh+1];
  for (int i=0; i<particles.length; i++) {
    particles[i].move();
    p = particles[i].draw2d(p);
  }
  img.pixels = p;
  img.updatePixels();
  background(255);
  image(img, 0, 0);
  processingDraw();
}


class Particle {
  float x, y, s, ss, d;
  color c;
  Particle (float xpos, float ypos) {
    this.x  = xpos;
    this.y  = ypos;
    this.s  = 0.2;
    this.ss = this.s;
    this.d  = random(TWO_PI);
    this.c  = color(int(random(255)), int(random(255)), int(random(255)), 255);
  }
  public void move() {
    assignGravity();
    this.x += sin(this.d) * this.ss;
    this.y += cos(this.d) * this.ss;
    checkCollision();
  }
  public int[] draw2d(int[] i) {
    int tx = int(this.x);
    int ty = int(this.y);
    int p  = ww*ty + tx;   
    if (0 <= p && p <= ww*wh) {
      i[ww*ty + tx] = this.c;
    }
    return i;
  }
  private void checkCollision() {
    if ( this.x <=m || this.x >= ww-m || this.y <= m || this.y >= wh-m) {
      this.d -= PI;
    }   
  }
  private void assignGravity() {
    this.ss += (this.ss - this.s) * 0.01;
    if (this.x > ww/2-1 && this.x < ww/2) {
      this.ss -= this.ss * 0.5;
    }
  }
}
