//PShape rectangle;

//void setup(){
//  size(500,500,P2D);
//  //Forma
//  rectangle = createShape(RECT, -50, -25, 100, 50);
//  //Aspecto de dibujo
//  rectangle.setStroke(color(255));
//  rectangle.setStrokeWeight(4);
//  rectangle.setFill(127);
//}

//void draw(){
//  background(50);
//  //Situamos en el puntero
//  translate(mouseX, mouseY);
//  rectangle.setFill(color(map(mouseX, 0, width, 0, 255)));
//  shape(rectangle);
//}

//size(640, 360, P3D);
//background(0);

//noFill();
//stroke(255);

////Prisma
//translate(width*0.2, height*0.15, 0);
//box(100);

////Esfera
//translate(width/2, height*0.35, 0);
//sphere(100);

Model2D model2d;
Model3D model3d;
Controller controller;
boolean mouseStatus = false;

void setup(){
  surface.setTitle("Solid of Revolution");
  size(1000,750,P3D);
  noFill();
  stroke(255);
  strokeWeight(5);
  model2d = new Model2D();
  controller = new Controller(model2d, 0.01, 0.1);
}

void draw(){
  background(0);
  rect(width/2, 0, 3, height);
  drawOutline();
  if(model3d != null) shape(model3d.getSor());
  println(model2d.getPoints());
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
  if (mouseButton == LEFT) controller.manageNewPoint();
  if (mouseButton == RIGHT){
    model3d = new Model3D();
    controller.setModel3D(model3d);
    controller.fillVertex();
  }
}

void keyPressed(){
  if(key == ' '){
    controller.cleanModel2D();
  }else if(key == BACKSPACE){
    controller.removeLastPoint();
  }
}
