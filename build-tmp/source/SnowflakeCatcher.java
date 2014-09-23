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
public void setup()
{
  //your code here
  size(500,500);
  background(0);
  
  storm = new SnowFlake [100];
  for (int i=0; i <100; i++)
  {
    storm[i] = new SnowFlake();
  }
}
public void draw()
{
  //your code here
  for (int i=0; i <100; i++)
  {
    storm[i].show();
  }
}
public void mouseDragged()
{
  //your code here
}

class SnowFlake
{
  //class member variable declarations
  int myX,myY,mySpeed;
  SnowFlake()
  {
    //class member variable initializations
    myX = (int)(Math.random()*501);
    myY = 0;
    mySpeed = 1;

  }
  public void show()
  {
    //your code here
    ellipse(myX,myY,10,10);

  }
  public void lookDown()
  {
    //your code here
  }
  public void erase()
  {
    //your code here
  }
  public void move()
  {
    //your code here
  }
  public void wrap()
  {
    //your code here
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
