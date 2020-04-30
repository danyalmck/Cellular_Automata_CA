CA ca;

void setup() {
    fullScreen();
    frameRate(30);
    ca = new CA();
}


void draw() {
    background(1);
    if (ca.autoGenerate)
        ca.generate();
    ca.display();
}


void keyPressed(){
    if (key == 'e' || key == 'E')
        exit();

    else if (key == 's' || key == 'S')
        ca.autoGenerate = false;

    else if (key == 'r' || key == 'R')
        ca.autoGenerate = true;

}
