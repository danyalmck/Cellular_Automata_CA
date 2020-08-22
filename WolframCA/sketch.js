const vars = {

    sizeOfCell: 15,
    columns: 0,
    rows: 0,
    board: 0,
    rowIndex: 0
}

function setup() {
    createCanvas(displayWidth, displayHeight);

    vars.columns =  floor(width/vars.sizeOfCell);
    vars.rows =  floor(height/vars.sizeOfCell);
    vars.board = (() => {
        let board = new Array(vars.rows);
        for (let i = 0; i < vars.rows; i++)
            board[i] = new Array(vars.columns);
        return board;
    }) ();

    ca.ic();
}

function draw() {
    background(0);
    if (ca.autoGenerate)
        ca.generate();
    ca.display();
}


function keyPressed(){

    if (key == 's' || key == 'S')
        ca.autoGenerate = false;

    else if (key == 'r' || key == 'R')
        ca.autoGenerate = true;

}
