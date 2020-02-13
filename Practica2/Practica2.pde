Model2D model2d;
Model3D model3d;
Controller controller;
boolean mouseStatus = false;

void setup(){
  surface.setTitle("Solid of Revolution");
  size(1000,1000,P3D);
  stroke(255);
  strokeWeight(2);
  model2d = new Model2D();
  controller = new Controller(model2d, 2*PI/100);
}

void draw(){
  background(0);
  if(model3d != null){
    translate(mouseX, mouseY);
    shape(model3d.getSor());
  }else{
    rect(width/2, 0, 1, height);
    drawOutline();
  }
}

void drawOutline(){
  ArrayList<Point> points = model2d.getPoints();
  if(points.isEmpty()) return;
  if(points.size() == 1){
    Point p = points.get(0);
    point(p.getX(), p.getY());
  }else{
    for(int i = 0; i < points.size() - 1; i++){
      Point p = points.get(i);
      Point nextP = points.get(i+1);
      line(p.getX(), p.getY(), nextP.getX(), nextP.getY());
    }
  }
}

void mousePressed(){
  if (mouseButton == LEFT && model3d == null) controller.manageNewPoint();
  if (mouseButton == RIGHT && model3d == null && model2d.getPoints().size() >= 2){
    model3d = new Model3D();
    controller.setModel3D(model3d);
    controller.fillVertex();
  }
}

void keyPressed(){
  if(key == ' '){
    controller.cleanModel2D();
    model3d = null;
  }else if(model3d == null && key == BACKSPACE){
    controller.removeLastPoint();
  }
}
