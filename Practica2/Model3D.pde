class Model3D{

  PShape sor;
  
  Model3D(){
    sor = createShape();
    sor.beginShape(TRIANGLE_STRIP);
    sor.fill(128);
    sor.stroke(255);
    sor.strokeWeight(2);
  }
  
  PShape getSor(){
    return sor;
  }
}
