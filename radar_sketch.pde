color green = color(0, 255, 0);
int dia = 800;
int i = 0;
int radius = dia / 2 - 25;

ArrayList<Obstacle> points = new ArrayList<Obstacle>();

void setup() {
  size(800, 800);
}

void draw() {
  i++;
  float rotation = degrees(i) / 5000;
  background(0);
  translate(dia / 2, dia / 2);
  pushMatrix();
  rotate(rotation);
  stroke(green);
  noFill();

  int step = 5;
  int max = 180;
  for (int j = 1; j < max; j += step)
  {
    noStroke();
    fill(0, map(j, 0, max, 0, 120), 0);
    triangle(0, 0, cos(radians(j)) * radius, sin(radians(j)) * radius, cos(radians(j + step)) * radius, sin(radians(j + step)) * radius);
  }

  stroke(green);
  strokeWeight(3);
  rotate(radians(360 - max));
  line(0, 0, dia, 0);
  popMatrix();
  renderBackground();
  renderPoints();
  points.add(new Obstacle(random(dia / 2), rotation));
}

void renderPoints()
{
  for(int j = 0; j < points.size(); j++)
  {
    pushMatrix();
    Obstacle p = points.get(j);
    rotate(p.angle);
    rotate(radians(135));
    p.render();
    p.update();
    if(p.isDead())
    {
      points.remove(j);
    }
    popMatrix();
  }
}

void renderBackground () {
  noFill();
  stroke(green);
  strokeWeight(3);
  circle(0, 0, dia - 50);
  strokeWeight(1);
  line(- dia / 2, 0, dia / 2, 0);
  line(0, - dia / 2, 0, dia / 2);

  strokeWeight(0.5);
  for (int j = - dia / 2; j < dia / 2; j += 20)
  {
    line(- dia / 2, j, dia / 2, j);
    line(j, - dia / 2, j, dia / 2);
  }
}
