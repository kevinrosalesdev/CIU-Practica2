class Controller {

  Model2D model2d;
  Model3D model3d;
  float theta;

  Controller(Model2D model2d, float theta) {
    this.model2d = model2d;
    this.theta = theta;
  }

  void manageNewPoint() {
    if (mouseX > width/2) {
      model2d.addPoint(new Point(mouseX, mouseY, 0));
    }
  }

  void setModel3D(Model3D model3d) {
    this.model3d = model3d;
  }

  void fillVertex() {
    PShape sor = model3d.getSor();
    ArrayList<Point> points = model2d.getPoints();
    float px, pz, pxNext, pzNext, px2, pz2, pxNext2, pzNext2;
    for (int i = 0; i < points.size()-1; i++) {

      px = (points.get(i).getX()-width/2);
      pz = (points.get(i).getZ());
      
      pxNext = (points.get(i+1).getX()-width/2);
      pzNext = (points.get(i+1).getZ());

      for (int j = 0; j < TWO_PI; j += theta) {

        px2 = px * cos(theta) - pz * sin(theta);
        pz2 = px * sin(theta) + pz * cos(theta);

        pxNext2 = pxNext * cos(theta) - pzNext * sin(theta);
        pzNext2 = pxNext * sin(theta) + pzNext * cos(theta);

        sor.vertex(px2, points.get(i).getY(), pz2);
        sor.vertex(pxNext2, points.get(i+1).getY(), pzNext2);
        
        px = px2;
        pz = pz2;
        
        pxNext = pxNext2;
        pzNext = pzNext2;
      }
    }
    sor.endShape();
  }

  void cleanModel2D() {
    model2d.getPoints().clear();
  }

  void removeLastPoint() {
    ArrayList<Point> points = model2d.getPoints();
    if (!points.isEmpty()) points.remove(points.size()-1);
  }

  void manageColor() {
    if (keyCode == RIGHT) model3d.changeColorRight();
    if (keyCode == LEFT) model3d.changeColorLeft();
  }

  void updateKeyStatus(boolean status) {
    if (key == 'S' || key == 's') model3d.isDownPressed = status;
    if (key == 'W' || key == 'w') model3d.isUpPressed = status;

    if (key == 'A' || key == 'a') model3d.isLeftPressed = status;
    if (key == 'D' || key == 'd') model3d.isRightPressed = status;
  }

  void rotate3dModel() {
    PShape sor = model3d.getSor();
    if (model3d.isDownPressed) sor.rotateX(0.01);
    if (model3d.isUpPressed) sor.rotateX(-0.01);

    if (model3d.isLeftPressed) sor.rotateY(0.01);
    if (model3d.isRightPressed) sor.rotateY(-0.01);
  }
}
