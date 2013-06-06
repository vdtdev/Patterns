/**
 * PATTERNS: GPattern Class
 * ---------------------------------------
 * Abstract base class for all patterns
 * ---------------------------------------
 * @author Wade Harkins (vdtdev@gmail.com)
 * @version 1.0.20130606
 */
abstract class GPattern {

  protected float drawSize=1.0;
  protected PVector lastPos = new PVector(0.0, 0.0), curPos = new PVector(0.0, 0.0);
  private int foreColor=0, fillColor=0;
  private boolean autoWrap=true;


  public void setFGColor(int c){
    this.foreColor=c;
  }
  
  public void setFillColor(int c){
    this.fillColor=c;
  }
  
  public int getFGColor(){return this.foreColor;}
  public int getFillColor(){return this.fillColor;}
  
  /**
  * Wrap p so it is within the visible screen coordinates
  * @param p PVector to wrap
  * @return Wrapped PVector
  */
  protected final PVector wrapPoint(PVector p){
    float tx,ty;
    tx=p.x; ty=p.y;
    while(tx>width){
      tx-=width;
    }
    while(tx<0.0){
      tx+=width;
    }
    while(ty>height){
      ty-=height;
    }
    while(ty<0.0){
      ty+=height;
    }
    return new PVector(tx,ty);
  }
  
  /**
   * Pattern internal configuration
   */
  protected abstract void config();
}

