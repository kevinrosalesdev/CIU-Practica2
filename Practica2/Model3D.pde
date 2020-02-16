class Model3D {

  PShape sor;
  int[][] colors;
  int index;
  boolean isUpPressed, isDownPressed, isLeftPressed, isRightPressed;

  Model3D() {
    sor = createShape();
    colors = new int[][]{{255, 0, 0}, {0, 255, 0}, {0, 0, 255}, {255, 255, 0}, {0, 255, 255}, {255, 0, 255}, {255, 255, 255}};
    index = 0;
    sor.beginShape(TRIANGLE_STRIP);
    sor.fill(colors[index][0], colors[index][1], colors[index][2]);
    sor.stroke(255);
    sor.strokeWeight(2);
    isUpPressed = false;
    isDownPressed = false;
    isLeftPressed = false;
    isRightPressed = false;
  }

  PShape getSor() {
    return sor;
  }

  void changeColorRight() {
    index++;
    if(index > colors.length - 1) index = 0;
    sor.setFill(color(colors[index][0], colors[index][1], colors[index][2]));
  }
  
  void changeColorLeft() {
    index--;
    if(index < 0) index = colors.length - 1;
    sor.setFill(color(colors[index][0], colors[index][1], colors[index][2]));
  }
}
