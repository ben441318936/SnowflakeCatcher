import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class SnowflakeCatcher extends PApplet {

SnowFlake storm [];
int SnowFlakeArrayLength = 500;
boolean loop = true;
int numberOfSnowflakesNotMoving = 0;
public void setup()
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
public void draw()
{
  //loadPixels();
  for (int i=0; i < SnowFlakeArrayLength; i++)
  {
    storm[i].erase();
    storm[i].lookDown();
    storm[i].wrap();
    storm[i].move();
    storm[i].show();
  }
}

public void mouseDragged()
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

public void keyPressed()
{
  if (key == ' ')
  {
    background(0);
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
  public void show()
  {
    noStroke();
    fill(255);
    ellipse(myX,myY,10,10);

  }
  public void lookDown()
  {
    if(myY+7 < height)
    {
      /*if(pixels[((myY+7)*width)+myX] != color(0,0,0))
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
      }*/
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
  public void erase()
  {
    fill(0);
    stroke(0);
    ellipse(myX, myY, 12, 12);
  }
  public void move()
  {
    if (isMoving == true)
    {
      myY++;
    }  
  }
  public void wrap()
  {
    if(myY >= height)
    {
      myY = 0;
      myX = (int)(Math.random()*(width-19)+10);
    }
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "SnowflakeCatcher" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
