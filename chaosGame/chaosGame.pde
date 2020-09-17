ArrayList<Point> p;
ArrayList<Float> k;
int la;
PVector o;
int n;

void setup() {
  size(800, 800);
  background(0);
  translate(width/2, height/2);
  n=6;
  la=-1;
  p=new ArrayList<Point>();
  k=new ArrayList<Float>();
  for (int i=0; i<n; i++) {
    float x=height/2.1*sin(2.0*PI*i/n);
    float y=height/2.1*-cos(2.0*PI*i/n);
    p.add(i, new Point(x, y, 0.5));
    k.add(1.0/n);
  }
  strokeWeight(0.3);
  stroke(255, 0, 255);
  fill(255, 0, 255);
  o=p.get(0).p.copy();
}

void draw() {
  translate(width/2, height/2);
  for (int i=0; i<3000; i++) {
    next();
  }
  println(frameCount);
  if (frameCount>1000) {
    noLoop();
  }
}

void next() {
  int ne=int(random(n));
  /*while (n==l) {
   n=int(random(p.size()));
   }*/
  la=ne;
  o.lerp(p.get(ne).p, 0.5);
  point(o.x, o.y);
}

class Point {
  PVector p;
  float c;

  Point(float x, float y, float c_) {
    strokeWeight(6);
    stroke(255);
    fill(255);    
    point(x, y);
    p=new PVector(x, y);
    c=c_;
  }

  PVector get(PVector q) {
    return p.copy().add(q.copy().sub(p.copy()).mult(c));
  }
}
