/**
 * Example of GPattern
 * -----------------------
 * uses per-point rendering w/o autoWrap
 * supports getParam/setParam for checkerCount
 * ---------------------------------------
 * @author Wade Harkins (vdtdev@gmail.com)
 * @version 1.0.20130606
 */
class Checkers extends GPattern {

  private float checkerCount=8.0;
  private boolean white=true;
  private PVector xshift, yshift;

  public void setCheckerCount(float c) {
    //print(width/checkerCount);
    checkerCount=c;
    xshift=new PVector(width/checkerCount, 0.0);
    yshift=new PVector(-width, height/checkerCount);
  }

  public float getCheckerCount() {
    return checkerCount;
  }

  // @Override
  public void setParam(String name, Object value) {
    if (name=="checkerCount") {
      setCheckerCount((Float)value);
    }
  }

  public Object getParam(String name) {
    if (name=="checkerCount") {
      return (Object)getCheckerCount();
    }
    return null;
  }
  protected PVector nextPos(PVector last) {
    print(last.x + "," + last.y + ";");
    PVector n = last;
    if (n.y<height) {
      // shift to the right
      if (n.x<width) {
        n.add(xshift);
        white=!white;
      }
      else {
        // wrap to next row
        n.add(yshift);
        if (checkerCount%2==0) {
          white=!white;
        }
      }
    }
    else {
      n=new PVector(0.0, 0.0);
    }
    return n;
  }
  // configuration/construction
  protected void config() {
    setFGColor(color(0));
    setFillColor(color(0));
    setMode(true, true);
    setCheckerCount(8.0); // default size
    this.drawSize=1.0;
  }

  protected void update(PVector current, PVector last) {
    setFillColor(white?color(255, 255, 255):color(0));
    PVector l, c;
    l=last;
    l.sub(xshift); // make up for the fact that it starts at 0,0
    rect(l.x, l.y, width/checkerCount, height/checkerCount);
  }
}

