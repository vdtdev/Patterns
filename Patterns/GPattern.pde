/**
 * PATTERNS: GPattern Class
 * ---------------------------------------
 * Abstract base class for all patterns
 * ---------------------------------------
 * @author Wade Harkins (vdtdev@gmail.com)
 * @version 1.0.20130606
 */
abstract class GPattern {

  private boolean perPoint=true;
  protected float drawSize=1.0;
  private PVector lastPos = new PVector(0.0, 0.0), curPos = new PVector(0.0, 0.0);
  protected int foreColor=0, fillColor=0;
  private boolean autoWrap=true;

  public GPattern(){
    config();
  }

  // color setters/getters

  /**
   * Set the stroke color
   * @param c Stroke color
   */
  public void setFGColor(int c) {
    this.foreColor=c;
  }

  /**
   * Set the fill color
   * @param c Fill color
   */
  public void setFillColor(int c) {
    this.fillColor=c;
  }

  public int getFGColor() {
    return this.foreColor;
  }
  public int getFillColor() {
    return this.fillColor;
  }



  /**
   * Wrap p so it is within the visible screen coordinates
   * @param p PVector to wrap
   * @return Wrapped PVector
   */
  protected final PVector wrapPoint(PVector p) {
    float tx, ty;
    tx=p.x; 
    ty=p.y;
    while (tx>width) {
      tx-=width;
    }
    while (tx<0.0) {
      tx+=width;
    }
    while (ty>height) {
      ty-=height;
    }
    while (ty<0.0) {
      ty+=height;
    }
    return new PVector(tx, ty);
  }

  /**
   * Enable/disable per-point rendering and auto-wrapping
   * @param perpoint Enable/disable per-point rendering
   * @param autowrap Enable/disable auto-wrap. Ignored if perpoint is false
   */
  protected final void setMode(boolean perpoint, boolean autowrap) {
    this.perPoint=perpoint;
    if (this.perPoint) {
      this.autoWrap=autowrap;
    }
    else {
      this.autoWrap=false;
    }
  }

  public void render() {
    if (perPoint) {
      lastPos=curPos;
      curPos=nextPos(lastPos);
      if (autoWrap) {
        curPos=wrapPoint(curPos);
      }
      pushStyle();
      strokeWeight(drawSize);
      stroke(getFGColor());
      fill(getFillColor());
      this.update(curPos, lastPos);
      popStyle();
    }
    else {
      pushStyle();
      strokeWeight(drawSize);
      stroke(getFGColor());
      fill(getFillColor());
      this.update(null, null);
      popStyle();
    }
  }

  /**
   * Determine the next point to be drawn
   * If not overridden it simply returns the last point
   * @param last The last drawn point
   * @return the next point
   */
  protected abstract PVector nextPos(PVector last);
  
  /**
   * Pattern internal configuration
   */
  protected abstract void config();
  
  public void setParam(String name, Object value){
    // null method so it doesn't need to be overridden
  }
  
  /**
  * Generic way to get parameters from a GPattern class; cast result to desired type
  * If not overridden, this method simply returns null
  * @param name Name of parameter to retrieve
  * @return Value as object, default is null
  */
  public Object getParam(String name){
    // returns null; override to make useful
    return null;
  }
  
  protected abstract void update(PVector current, PVector last);
}

