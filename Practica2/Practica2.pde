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
Controller controller;
boolean mouseStatus = false;

void setup(){
  background(0);
  size(500,500);
  noFill();
  stroke(255);
  strokeWeight(5);
  model2d = new Model2D();
  controller = new Controller();
}

void draw(){
  rect(width/2, 0, 3, height);
  println(model2d.points);
}

void mouseClicked(){
  controller.manageNewPoint();
}
