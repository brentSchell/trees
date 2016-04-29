/* @pjs font="FTLTLT.ttf"; */

float[][] pix;
PImage img;
int mode = 0;
float tree_count = 0.0;
float letter_count = 0;
PFont f;
void setup() {
  size(960,600);  
  f = createFont("FTLTLT.TTF",28);
  textFont(f);
}

void draw() {
  switch(mode) {
    case 0:
      background(255);
      textAlign(CENTER);
      stroke(0,0,0);
      fill(0,0,0);
      text("Congratulations. You've reached the end.",width/2,height/2);
      text("Click here to finish.",width/2,height/2 + 50);
      break;
    case 1:
      background(255);
      tree(tree_count);
      tree_count += 0.01; // sin pattern grow?
      if (tree_count > 13.0) {
        mode = 2;  
        tree_count = 0.0;
      }
      break;
    case 2:
      textAlign(LEFT);
      letter(letter_count, false);
      letter_count += 0.2;
      if (letter_count > 80) {
        mode = 3;  
      }
      break;
    case 3:
      background(255);
      tree(13.0);
      letter(60.0, true);
      mode = 4;
      break;
    case 4:
      break;
    default:
      break;
  }  
}

void tree(float size) {
  branch(width/2, height, -PI/2, 160, color(0,0,0), size, 0);
}

void branch(float x,float y,float a,float h, color c, float size, int level) {
  if (h < 5)  {
    return;
  }
  strokeWeight(h*0.2);
  stroke(c);

  if ((int)size < level) {
    return;  
  }
  else if ((int)size == level) {
    h *= (float)(size - (int)size);
  }
  
  float x2 = x + h*cos(a);
  float y2 = y + h*sin(a);
  
  
  line(x,y,x2,y2);
  color new_c = color(red(c)+12,green(c)+1,blue(c)+8);
  
  branch(x2,y2,a+0.4, h*0.75, new_c, size, level+1);
  branch(x2,y2,a-0.6, h*0.75, new_c, size, level+1);
}

void letter(float size, boolean solid) { 
  stroke(3);
  if (solid) {
    fill(156,13,104,255);  
  } else {
    fill(156,13,104, 2);
  }
  
  String msg = "Will you Marry Me?";
  int last_letter = (int)(size/2.0);
  last_letter = min(last_letter,msg.length());
  text(msg.substring(0,last_letter),550,500);
}

void mouseReleased() {
  if (mode == 0) {
    mode = 1;  
  }
  
}