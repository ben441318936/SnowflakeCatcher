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
int SnowFlakeArrayLength = 100;
public void setup()
{
  //your code here
  frameRate(10);
  size(500,500);
  background(0);
  storm = new SnowFlake [SnowFlakeArrayLength];
  for (int i=0; i < SnowFlakeArrayLength; i++)
  {
    storm[i] = new SnowFlake();
  }
}
public void draw()
{
  //your code here
  for (int i=0; i < SnowFlakeArrayLength; i++)
  {
    storm[i].erase();
    storm[i].reset();
    storm[i].lookDown();
    storm[i].move();
    storm[i].show();
  }
}
public void mouseDragged()
{
  //your code here
  fill(255,0,0);
  noStroke();
  ellipse(mouseX,mouseY,20,20);

}

class SnowFlake
{
  //class member variable declarations
  int myX,myY;
  boolean isMoving;
  SnowFlake()
  {
    //class member variable initializations
    myX = (int)(Math.random()*501);
    myY = (int)(Math.random()*501);
    isMoving = true;
  }
  public void show()
  {
    //your code here
    //stroke(0);
    noStroke();
    fill(255);
    ellipse(myX,myY,10,10);

  }
  public void lookDown()
  {
    //your code here
    if(get(myX,myY+11) != color(0))
    {
      isMoving = false;
    }
    else 
    {
      isMoving = true;
    }
  }
  public void erase()
  {
    //your code here
    fill(0);
    stroke(0);
    ellipse(myX, myY, 11, 11);

  }
  public void move()
  {
    //your code here
    if (isMoving == true)
    {
      myY++;
    }
    
  }
  public void reset()
  {
    //your code here
    if(myY == 500)
    {
      println("swag");
      myY = 0;
      myX = (int)(Math.random()*501);
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
