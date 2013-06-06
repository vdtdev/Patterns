/**
 * PATTERNS
 * ---------------------------------------
 * Standardized pattern generation
 * @author Wade Harkins (vdtdev@gmail.com)
 * @version 1.0.20130606
 */


//Checkers pattern;
GPattern pattern;

int pCheckers = 0;

int patternType=0;

void setup() {

  size(512, 512, P2D);
  smooth();
  colorMode(RGB, 255, 255, 255);

  patternType=pCheckers;
  init(patternType);
}

/**
 * Pattern selector
 * @param patternn index of pattern to use
 */
void init(int patternType) {
  switch(patternType) {
  case 0:
    pattern=new Checkers();
  }
}

void draw() {
  pattern.render();
}


void keyPressed() {

  /*
 
   To switch to the specific parameter passing (using setCheckerCount), change the declaration
   of pattern to be a Checkers object instead of a GPattern.
   
   The standard parameter passing works for both Checkers objects and GPattern objects
   
   */

  if (key=='w') {
    // the following line uses the 'standard' parameter passing method
    pattern.setParam("checkerCount", (Object)(((Float)pattern.getParam("checkerCount"))+1.0));
    // Specific parameter passing:
    // pattern.setCheckerCount(pattern.getCheckerCount()+1.0);
  }
  if (key=='q') {
    // standard parameter passing
    pattern.setParam("checkerCount", (Object)(max(2.0, ((Float)pattern.getParam("checkerCount")))-1.0));
    // Checkers-specific parameter passing
    //pattern.setCheckerCount(max(2.0, pattern.getCheckerCount()-1.0));
  }
}

