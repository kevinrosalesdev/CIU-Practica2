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
    float PX1, PZ1, PX2, PZ2;
    for(int i = 0; i < points.size()-1; i++){
      
      while(theta <= TWO_PI + 0.1){
        PX1 = (points.get(i).getX()-width/2) * cos(theta);
        PZ1 = (points.get(i).getX()-width/2) * sin(theta);
        
        PX2 = (points.get(i+1).getX()-width/2) * cos(theta);
        PZ2 = (points.get(i+1).getX()-width/2) * sin(theta);
        
        theta += dtheta;
        print("PX1: ", PX1 + "\n");
        print("PZ1: ", PZ1 + "\n\n");
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
}
