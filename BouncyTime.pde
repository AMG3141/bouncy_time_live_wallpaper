class BouncyTime {
    // Position of the time (bottom left corner TODO: CHECK THIS)
    private PVector pos;
    public PVector getPos() {
        return this.pos;
    }
    
    // Velocity of the time
    private PVector vel;
    public PVector getVel() {
        return this.vel;
    }
    
    // The maximum value of x the time should take so that it doesn't leave the screen
    public float getMaxX() {
        return width - textWidth(getTime());
    }
    
    // The minimum value of x the time should take so that it doesn't leave the screen
    public float getMinX() {
        return 0;
    }
    
    // The maximum value of y the time should take so that it doesn't leave the screen
    public float getMaxY() {
        return height;
    }
    
    // The minimum value of y the time should take so that it doesn't leave the screen
    public float getMinY() {
        return textAscent() * 0.8;
    }
    
    // The width of the time
    private float textWidth;
    public float getTextWidth() {
        return this.textWidth;
    }
    
    // The time to be displayed
    public String getTime() {
        return String.format("%02d:%02d:%02d", hour(), minute(), second());
    }
    
    public BouncyTime(PVector initialPos, PVector initialVel) {
        // Set initial values of position and velocity
        this.pos = initialPos;
        this.vel = initialVel;
    }
    
    public void move() {
        updatePos();
        checkEdges();
        display();
    }
    
    private void updatePos() {
        this.pos.add(this.vel);
    }
    
    private void checkEdges() {
        // Left wall
        if (this.pos.x < getMinX()) {
            this.pos.x = getMinX();
            this.vel.x *= -1;
        }
        
        // Right wall
        if (this.pos.x > getMaxX()) {
            this.pos.x = getMaxX();
            this.vel.x *= -1;
        }
        
        // Top wall
        if (this.pos.y < getMinY()) {
            this.pos.y = getMinY();
            this.vel.y *= -1;
        }
        
        // Bottom wall
        if (this.pos.y > getMaxY()) {
            this.pos.y = getMaxY();
            this.vel.y *= -1;
        }
    }
    
    private void display() {
        /*float r = map(this.pos.x, 0, width, 50, 255);
        float g = map(this.pos.y, 0, height, 50, 255);
        float b = map(this.pos.x * this.pos.y, 0, width * height, 50, 255);
        fill(r, g, b);*/
        text(getTime(), pos.x, pos.y);
    }
}
