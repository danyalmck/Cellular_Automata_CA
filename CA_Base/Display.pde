CA ca;

void setup() {
    fullScreen();
    frameRate(10);
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

    else if (key == 'p' || key == 'P') {
        ca.autoGenerate = false;
        ca.previousGeneration();
    }

    else if (key == 'n' || key == 'N') {
        ca.autoGenerate = false;
        ca.nextGeneration();
    }

}
