SnowFlake storm [];
int SnowFlakeArrayLength = 100;
boolean loop = true;
int numberOfSnowflakesNotMoving = 0;
void setup()
{
  imageMode(RGB);
  frameRate(60);
  size(500,500);
  background(0,0,0);
  storm = new SnowFlake [SnowFlakeArrayLength];
  for (int i=0; i < SnowFlakeArrayLength; i++)
  {
    storm[i] = new SnowFlake();
  }
}
void draw()
{
  loadPixels();
  for (int i=0; i < SnowFlakeArrayLength; i++)
  {
    //storm[i].isMoving=true;
    storm[i].erase();
    storm[i].lookDown();
    storm[i].wrap();
    storm[i].move();
    storm[i].show();
  }
}

void mouseDragged()
{
  if(mouseButton==LEFT)
  {
    fill(255,0,0);
    noStroke();
    ellipse(mouseX,mouseY,20,20);
  }
  if(mouseButton==RIGHT)
  {
    fill(0);
    ellipse(mouseX, mouseY, 100, 100);
  }
}

class SnowFlake
{
  int myX,myY;
  boolean isMoving;
  SnowFlake()
  {
    myX = (int)(Math.random()*(width-9)+5);
    myY = (int)(Math.random()*(height-9)+5);
    isMoving = true;
  }
  void show()
  {
    noStroke();
    fill(255);
    ellipse(myX,myY,10,10);

  }
  void lookDown()
  {
    if(myY+7 < height)
    {
      if(pixels[((myY+7)*width)+myX] != color(0,0,0))
      {
        isMoving=false;
      }
      else if(pixels[((myY+5)*width)+myX+5] != color(0,0,0))
      {
        isMoving=false;
      }
      else if(pixels[((myY+5)*width)+myX-5] != color(0,0,0))
      {
        isMoving=false;
      }
      else 
      {
        isMoving = true;  
      }
    }
  } 
  void erase()
  {
    fill(0);
    stroke(0);
    ellipse(myX, myY, 12, 12);
  }
  void move()
  {
    if (isMoving == true)
    {
      myY++;
    }  
  }
  void wrap()
  {
    if(myY >= height)
    {
      myY = 0;
      myX = (int)(Math.random()*(width-9)+5);
    }
  }
}