import java.util.*;

//You can use enum for more than two states
//In this case 1 represents green and 0 represents black
enum Color {
    GREEN,
    BLACK
}

class CA {

    //Length of each cell
    private int sizeOfCell = 8;

    private int columns, rows;

    public boolean autoGenerate = false;

    //The board that is shown
    private int[][] board;

    private int rowIndex = 0;

    //Input your desired rule
    private Rule rule = new Rule(110);      


    //Constructor
    public CA() {
        this.columns = width/this.sizeOfCell;
        this.rows = height/this.sizeOfCell;
        this.board = new int[this.rows][this.columns];
        this.IC();
    }

    //Your initial condition
    private void IC() {
        //for (int i = 0; i < this.columns; i++)
        //    if (i%11 == 0)
        //        this.board[rowIndex][i] = 1;
                
        this.board[rowIndex][columns/2+11+3] = 1;
    }


    public void generate() {
        if (this.rowIndex < this.rows-1) {
            int[] nextRow = rule.applyRule(this.board[rowIndex]);
            this.board[++rowIndex] = nextRow;
        }
    }


    public void display() {
        //Display the board
        for ( int i = 0; i < rows;i++) {
            for ( int j = 0; j < columns;j++) {
                if ((board[i][j] == 1))
                    fill(76, 187, 23);
                else
                    fill(1);
                stroke(1);
                rect(j*this.sizeOfCell, i*this.sizeOfCell, this.sizeOfCell, this.sizeOfCell, 60, 60, 60, 60);
            }
        }
    }
}
