color green = color(0, 255, 0);
int dia = 800;
int i = 0;
int radius = dia / 2 - 25;
float rotation = 0;

ArrayList<Obstacle> points = new ArrayList<Obstacle>();

import processing.serial.*;

Serial myPort;  // The serial port
String arduino = "/dev/ttyACM0";

void setup() {
  myPort = new Serial(this, arduino, 9600);
  size(800, 800);
}

void draw() {
  String myString;
  while (myPort.available() > 0) {
    myString = myPort.readStringUntil(10);
    if (myString != null) {
      println(myString);
      try
      {
        rotation = radians(Float.parseFloat(myString.split(",")[0]));
      }
      catch(Exception e)
      {
        
      }
      
      try
      {
        float dist = Float.parseFloat(myString.split(",")[1]);
        points.add(new Obstacle(map(dist, 0, 150, 0, dia / 2), rotation));
      }
      catch(Exception e)
      {
      }
      
      
   
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
    }
  }
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
  strokeWeight(1.5);
  circle(0, 0, dia - 50);
  circle(0, 0, dia / 3 * 2 - 50 / 3 * 2);
  circle(0, 0, dia / 3 - 50 / 3);
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
