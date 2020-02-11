class Point{

  float x, y;
  
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  String toString(){
    return "(" + x + "," + y + ")";
  }
}
