import java.util.*;

class CA {

    //Length of each cell
    private int sizeOfCell = 10;

    private int columns, rows;

    public boolean autoGenerate = false;

    //Array that save each generation
    private ArrayList<int[][]> generations = new ArrayList<int[][]>();

    private int generationIndex = 1;

    private int lastGenerationIndex = 1;

    //The board that is shown
    private int[][] board;


    //Constructor
    public CA() {
        this.columns = width/this.sizeOfCell;
        this.rows = height/this.sizeOfCell;
        this.board = new int[this.columns][this.rows];
        this.init();
        // this.IC();
    }


    private void lastGeneratoin() {
        if (this.generationIndex > this.lastGenerationIndex)
            this.lastGenerationIndex = this.generationIndex;
    }


    //Initialize the board randomly
    public void init() {
        for (int i = 0; i < this.columns; i++)
            for (int j = 0; j < this.rows; j++)
                this.board[i][j] = int(random(2));

        this.generations.add(board);
    }


    private void IC() {
        //Implement your desired initial condition and run it instead of init()

        this.generations.add(board);
    }


    void generate() {

        int[][] next = new int[columns][rows];

        // Loop through every spot in our 2D array and check spots neighbors
        for (int x = 1; x < columns-1; x++) {
            for (int y = 1; y < rows-1; y++) {

                // Add up all the states in a 3x3 surrounding grid
                int neighbors = 0;
                for (int i = -1; i <= 1; i++) {
                    for (int j = -1; j <= 1; j++) {
                        neighbors += board[x+i][y+j];
                    }
                }

                // A little trick to subtract the current cell's state since
                // we added it in the above loop
                neighbors -= board[x][y];

                // Rules of Life
                if      ((board[x][y] == 1) && (neighbors <  2)) next[x][y] = 0;           // Loneliness
                else if ((board[x][y] == 1) && (neighbors >  3)) next[x][y] = 0;           // Overpopulation
                else if ((board[x][y] == 0) && (neighbors == 3)) next[x][y] = 1;           // Reproduction
                else                                            next[x][y] = board[x][y];  // Stasis
            }
        }

        // Next is now our board
        board = next;
        this.generations.add(board);
        this.generationIndex++;
        this.lastGeneratoin();
    }


    public void previousGeneration() {
        if (this.generationIndex > 0)
            this.board = this.generations.get(--generationIndex);
    }


    public void nextGeneration() {
        if (this.generationIndex < this.lastGenerationIndex)
            this.board = this.generations.get(++generationIndex);

        else if (this.generationIndex == this.lastGenerationIndex)
            this.generate();
    }


    public void display() {
        //Display the board
        for ( int i = 0; i < columns;i++) {
            for ( int j = 0; j < rows;j++) {
                if ((board[i][j] == 1))
                    fill(76, 187, 23);
                else
                    fill(1);
                stroke(1);
                rect(i*this.sizeOfCell, j*this.sizeOfCell, this.sizeOfCell, this.sizeOfCell, 60, 60, 60, 60);
            }
        }
        //Display the generation index
        fill(148, 0, 211);
        textAlign(CENTER);
        textSize(40);
        text(this.generationIndex, width/2 - 10, 30);
    }
}
