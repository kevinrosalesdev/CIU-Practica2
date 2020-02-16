import gifAnimation.*;

Model2D model2d;
Model3D model3d;
Controller controller;
boolean mouseStatus = false;
boolean isMenu = true;
PFont font;

//GifMaker ficherogif;
//int frameCounter;

void setup(){
  surface.setTitle("Solid of Revolution");
  font = loadFont("CenturyGothic-48.vlw");
  fill(255);
  size(1000,1000,P3D);
  stroke(255);
  strokeWeight(2);
  model2d = new Model2D();
  controller = new Controller(model2d, 2*PI/100);
  noLoop();
  
  //ficherogif = new GifMaker(this, "animation.gif");
  //ficherogif.setRepeat(0);
  //ficherogif.addFrame();
  //frameCounter = 0;
}

void draw(){
  //frameCounter++;
  //if(frameCounter == 10){
    //ficherogif.addFrame();
    //frameCounter = 0;
  //}
  
  background(0);
  if(isMenu) drawMenu();
  else{
    if(model3d != null){
      translate(mouseX, mouseY-500, -250);
      shape(model3d.getSor());
      controller.rotate3dModel();
    }else{
      rect(width/2, 0, 1, height);
      drawOutline();
      textFont(font, 20);
      text("M: Menú y controles", 0.8*width, 0.95*height);
    }
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

void drawMenu(){
 
  textAlign(CENTER);
  textFont(font, 45);
  fill(156,228,255);
  text("Sólido de Revolución", 0.5*width, 0.2*height);
  
  textFont(font, 25);
  text("Este prototipo recoge puntos de un perfil del sólido de revolución.\n" + 
       "Con dicho perfil se creará un objeto tridimensional por medio de una \n" +
       "superficie de revolución.", 0.5*width, 0.35*height);
  
  fill(130,130,245);
  text("¡Presiona 'ENTER' para crear!", 0.5*width, 0.5*height);
  
  fill(255,255,255);
  text("CONTROLES", 0.5*width, 0.7*height);
  
  textFont(font, 20);
  textAlign(LEFT);
  text("CLICK IZQUIERDO: Punto del perfil del sólido de revolución", 0.125*width, 0.75*height);
  text("CLICK DERECHO: Generar/eliminar objeto tridimensional", 0.125*width, 0.775*height);
  text("RETROCESO: Elimina el último punto del perfil del sólido de revolución", 0.125*width, 0.80*height);
  text("A/W/S/D: Rota el objeto tridimensional", 0.125*width, 0.825*height);
  text("FLECHA IZQUIERDA/FLECHA DERECHA: Cambia el color del objeto tridimensional", 0.125*width, 0.85*height);
  text("M: Abre este menú", 0.125*width, 0.875*height);
  
  noFill();
  stroke(255);
  rect(0.10*width, 0.65*height, 0.8*width, 0.3*height, 5);
}

void mousePressed(){
  if (isMenu) return;
  if (mouseButton == LEFT && model3d == null) controller.manageNewPoint();
  if (mouseButton == RIGHT && model3d == null && model2d.getPoints().size() >= 2){
    model3d = new Model3D();
    controller.setModel3D(model3d);
    controller.fillVertex();
  }else if(mouseButton == RIGHT && model3d != null){
    controller.cleanModel2D();
    model3d = null;
  }
}

void keyPressed(){
  if(isMenu && (key == ENTER)){
    isMenu = false;
    loop();
  }
  if(!isMenu && (key == 'M' || key == 'm')){
    isMenu = true;
    loop();
  }
  if(!isMenu && model3d != null){
    if (key == CODED) controller.manageColor();
    else controller.updateKeyStatus(true);
  }
  if(!isMenu && model3d == null && key == BACKSPACE){
    controller.removeLastPoint();
  }
}

void keyReleased(){
  if(!isMenu && model3d != null){
    controller.updateKeyStatus(false);
  }
}
