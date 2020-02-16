class Controller{
  
  Model2D model2d;
  Model3D model3d;
  float theta;
  float dtheta;
  
  Controller(Model2D model2d, float dtheta){
    this.model2d = model2d;
    this.dtheta = dtheta;
  }
  
  void manageNewPoint(){
    if (mouseX > width/2){
      model2d.addPoint(new Point(mouseX, mouseY));
    }
  }
  
  void setModel3D(Model3D model3d){
    this.model3d = model3d;
  }
  
  void fillVertex(){
    PShape sor = model3d.getSor();
    ArrayList<Point> points = model2d.getPoints();
    float theta = 0;
    float PX, PX1, PZ1, PX2, PZ2;
    for(int i = 0; i < points.size()-1; i++){
      
      while(theta <= TWO_PI + 0.1){
        PX = (points.get(i).getX()-width/2);
        PX1 = PX * cos(theta);
        PZ1 = PX * sin(theta);
        
        PX = (points.get(i+1).getX()-width/2);
        PX2 = PX * cos(theta);
        PZ2 = PX * sin(theta);
        
        theta += dtheta;
        sor.vertex(PX1, points.get(i).getY(), PZ1);
        sor.vertex(PX2, points.get(i+1).getY(), PZ2);
      }
      theta = 0;
    }
    sor.endShape();
  }
  
  void cleanModel2D(){
    model2d.getPoints().clear();
  }
  
  void removeLastPoint(){
    ArrayList<Point> points = model2d.getPoints();
    if (!points.isEmpty()) points.remove(points.size()-1);
  }
  
  void manageColor(){
    if (keyCode == RIGHT) model3d.changeColorRight();
    if (keyCode == LEFT) model3d.changeColorLeft();
  }
  
  void updateKeyStatus(boolean status){
    if (key == 'S' || key == 's') model3d.isDownPressed = status;
    if (key == 'W' || key == 'w') model3d.isUpPressed = status;
    
    if (key == 'A' || key == 'a') model3d.isLeftPressed = status;
    if (key == 'D' || key == 'd') model3d.isRightPressed = status;
    
  }
  
  void rotate3dModel(){
    PShape sor = model3d.getSor();
    if (model3d.isDownPressed) sor.rotateX(0.01);
    if (model3d.isUpPressed) sor.rotateX(-0.01);
    
    if (model3d.isLeftPressed) sor.rotateY(0.01);
    if (model3d.isRightPressed) sor.rotateY(-0.01);
  }
}
