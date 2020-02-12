class Model2D{
    
  ArrayList points = new ArrayList<Point>();
  
  void addPoint(Point point){
    points.add(point);
  }
  
  ArrayList<Point> getPoints(){
    return points;
  }
}
