class Controller{
  
  Model2D model2d;
  Model3D model3d;
  float theta;
  float dtheta;
  
  Controller(Model2D model2d, float theta, float dtheta){
    this.model2d = model2d;
    this.theta = theta;
    this.dtheta = dtheta;
  }
  
  void manageNewPoint(){
    if (mouseX > width/2 + 3){
      model2d.addPoint(new Point(mouseX, mouseY));
    }
  }
  
  void setModel3D(Model3D model3d){
    this.model3d = model3d;
  }
  
  void fillVertex(){
    PShape sor = model3d.getSor();
    ArrayList<Point> points = model2d.getPoints();
    for(Point point : points){
      while(theta < PI){
        //sor.vertex(point.getX()-width/2, point.getY(), 0);
        float newPX = point.getX() * cos(theta);
        float newPY = point.getY();
        float newPZ = point.getX() * sin(theta);
        theta += dtheta;
        sor.vertex(newPX, newPY, newPZ);
      }
    }
    sor.endShape();
  }
  
  void cleanModel2D(){
    model2d.getPoints().clear();
  }
  
  void removeLastPoint(){
    ArrayList<Point> points = model2d.getPoints();
    points.remove(points.size()-1);
  }
}
