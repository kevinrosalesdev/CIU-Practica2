class Point{

  float x, y, z;
  
  Point(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  float getX(){
    return x;
  }
  
  float getY(){
    return y;
  }
  
  float getZ(){
    return z;
  }
  
  String toString(){
    return "(" + x + "," + y + "," + z + ")";
  }
}
