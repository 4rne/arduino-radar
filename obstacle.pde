class Obstacle
{
  float angle;
  float dist;
  float c = 255.0;

  Obstacle(float dist, float angle)
  {
    this.dist = dist;
    this.angle = angle;
  }

  void render()
  {
    stroke(color(0, 255, 0, c));
    strokeWeight(8);
    point(dist, dist);
  }

  void update()
  {
    c -= 0.45;
  }

  boolean isDead()
  {
    return c <= 0;
  }
}
