SnowFlake storm [];
int SnowFlakeArrayLength = 500;
boolean loop = true;
int numberOfSnowflakesNotMoving = 0;
int mode = (int)(Math.random()*2+1);
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
  println("mode: "+mode);
}
void draw()
{
  if(mode == 2)
  {
    loadPixels();
  }
  
  for (int i=0; i < SnowFlakeArrayLength; i++)
  {
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

void keyPressed()
{
  if (key == ' ')
  {
    background(0);
    mode = (int)(Math.random()*2+1);
    for (int i=0; i < SnowFlakeArrayLength; i++)
    {
      storm[i].myX = (int)(Math.random()*(width-19)+10);
      storm[i].myY = (int)(Math.random()*(width-19)+10);
      storm[i].isMoving = true;
    }
  }
}

class SnowFlake
{
  int myX,myY;
  boolean isMoving;
  SnowFlake()
  {
    myX = (int)(Math.random()*(width-19)+10);
    myY = (int)(Math.random()*(height-19)+10);
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
      if(mode == 2)
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
      if(mode == 1)
      {
        if (get(myX,myY+7) != color(0,0,0))
        {
          isMoving = false;
        }
        else if (get(myX+5,myY+5) != color (0,0,0))
        {
          isMoving = false;
        }
        else if (get(myX-5,myY+5) != color(0,0,0))
        {
          isMoving = false;
        }
        else 
        {
          isMoving = true;
        }
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
      myX = (int)(Math.random()*(width-19)+10);
    }
  }
}