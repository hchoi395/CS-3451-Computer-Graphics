void setup() {
  size(600, 600);  //screen setup
}

void draw1(float x, float y, float width, float height, int temp) {
  float s = width * .5;
  float t = height * .5;
  if (width < 12) {
    return;
  } else {
    if (width == 100) {
      fill(0, 51, 102);
    }
    if (width == 50) {
      fill(0, 50, 204);
    }
    if (width == 25) {
      fill(0, 121, 151);
    }
    if (width == 12.5) {
      fill(102, 102, 255);
    }
    
      rect(mouseX - x / 2, y, width, height);
      rect(600 - mouseX - x / 2, y + 300, width, height);
    
    if (width == 25) {
      temp++;
    }
    
    draw1(-mouseX / temp + x + width * 2.5, y - t, width / 2, height / 2, temp + 1); 
    draw1(mouseX / temp + x - width * 3.5, y + t * 2, width / 2, height / 2, temp + 1);
    draw1(x + s * 2, - mouseX / (temp * 2) + y + width * 1.75, width / 2, height / 2, temp + 1);
    draw1(x - s * 4, mouseX / (temp * 2) + y - width * 1.25, width / 2, height / 2, temp + 1);
  }
}

void draw2(float x, float y, float width, float height, float temp) {
  float s = width * .5;
  float t = height * .5;
  if (width < 12) {
    return;
  } else {
    if (width == 100) {
      fill(0, 51, 102);
    }
    if (width == 50) {
      fill(0, 50, 204);
    }
    if (width == 25) {
      fill(0, 121, 151);
    }
    if (width == 12.5) {
      fill(102, 102, 255);
    }
    
    rect(x, 600 - mouseX - y / 2, width, height);
    rect(x + 300, mouseX - y / 2, width, height);
    
    if (width == 25) {
      temp++;
    }
  
    draw2(mouseX / (temp * 2) + x - s * 2.5, y + height, width / 2, height / 2, temp + 1);
    draw2(-mouseX / (temp * 2) + x + s * 3.5, y - height * 2, width / 2, height / 2, temp + 1);
    draw2(x - height / 2, mouseX / temp + y - t * 7, width / 2, height / 2, temp + 1);
    draw2(x + height, -mouseX / temp + y + t * 5, width / 2, height / 2, temp + 1);
  }
}

void draw() {
  background(200);  //background setup
  draw1(100, 100, 100, 100, 1);    
  draw2(100, 100, 100, 100, 1);
  fill(0, 21, 151);
  rect(300 - 200 / 2, 300 - 200 / 2, 200, 200);  //center square
}
