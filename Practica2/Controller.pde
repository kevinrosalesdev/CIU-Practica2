class Controller{
  
  Controller(){
    
  }
  
  void manageNewPoint(){
    if (mouseX > width/2 + 3){
      Point p = new Point(mouseX, mouseY);
      model2d.addPoint(p);
      point(p.getX(), p.getY());
    }
  }
  
}
