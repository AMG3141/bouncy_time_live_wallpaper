BouncyTime theTime;

void setup() {
    fullScreen();
    background(0);
    
    // [116] "Cascadia Code Regular" .\data\CascadiaCode-Regular.otf
    textFont(createFont("CascadiaCode-Regular.otf", min(width, height)/15));
    
    theTime = new BouncyTime(new PVector(random(width), random(height)), new PVector(random(-3, 3), random(-3, 3)));
}

void draw() {
    /*float col = map(hour() * minute() * second(), 0, 23 * 59 * 59, 0, 255);
    background(col);
    
    float r = map(hour(), 0, 23, 0, 100);
    float g = map(minute(), 0, 59, 0, 100);
    float b = map(second(), 0, 59, 0, 100);
    background(r, g, b);
    */
    background(0);
    theTime.move();
}
