//global variables here

SnowFlake storm []; //an array (collection) of snowflakes
/*
since the objects are in an array, every time we need to access
or do anything with them, we need to loop through the array,
using indexes
*/
int SnowFlakeArrayLength = 2000;
int mode = (int)(Math.random()*2+1);

void setup()
{
  //basic settings;
  imageMode(RGB);
  frameRate(60);
  size(500,500);
  background(0,0,0);
  //initialize (put objects into) storm, the array of snowflakes
  storm = new SnowFlake [SnowFlakeArrayLength];
  for (int i = 0; i < SnowFlakeArrayLength; i++)
  {
    storm[i] = new SnowFlake();
  }
}

void draw()
{
  if(mode == 2)
  {
    /*
    in order to use the pixel[] array, we need to load the image
    into the array every time the screen refreshes
    */
    loadPixels();
  }
  for (int i = 0; i < SnowFlakeArrayLength; i++)
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
  if(mouseButton == LEFT)
  {
    //draw red catcher stuff
    fill(255,0,0);
    noStroke();
    ellipse(mouseX,mouseY,20,20);
  }
  if(mouseButton == RIGHT)
  {
    //erase red stuff
    fill(0);
    ellipse(mouseX, mouseY, 100, 100);
  }
}

void keyPressed()
{
  /*
  redraws the screen;
  randomizes the mode;
  */
  if (key == ' ')
  {
    background(0);
    mode = (int)(Math.random()*2+1);
    for (int i = 0; i < SnowFlakeArrayLength; i++)
    {
      storm[i].myX = (int)(Math.random()*(width-19)+10);
      storm[i].myY = (int)(Math.random()*(width-19)+10);
      storm[i].isMoving = true;
    }
    //println(mode);
  }
}

class SnowFlake
{
  //member varables here
  int myX,myY;
  boolean isMoving;

  SnowFlake()
  {
    //initializes member variables
    myX = (int)(Math.random()*(width-19)+10);
    myY = (int)(Math.random()*(height-19)+10);
    isMoving = true;
  }

  void show()
  {
    //draws white ellipse
    noStroke();
    fill(255);
    ellipse(myX,myY,10,10);
  }

  void lookDown() 
  {
    /*
    checking pixels below the snowflake for impact;
    the pixels checked must be on the screen and are not any point on the "erase" ellipse;
    mode1 uses get() function;
    mode2 uses pixels[] array;
    */
    if(myY+7 < height)
    {
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
    }
  } 

  void erase() 
  {
  //draws a slightly bigger black ellipse to "erase" the snowflake
    fill(0);
    stroke(0);
    ellipse(myX, myY, 12, 12);
  }

  void move()
  {
    //moves the snowflake down by one
    if (isMoving == true)
    {
      myY++;
    }  
  }

  void wrap() 
  {
  //when snowflakes get to bottom, resets to top, looping effect 
    if(myY >= height)
    {
      myY = 0;
      myX = (int)(Math.random()*(width-19)+10);
    }
  }

}