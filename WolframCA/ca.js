const ca = (() => {

    return {

        autoGenerate: true,

        ic: function () {

            for (let i = 0; i < vars.rows; i++)
                for(let j = 0; j < vars.columns; j++)
                    vars.board[i][j] = 0;

            vars.board[vars.rowIndex][Math.floor(vars.columns/2)] = 1;
        },

        generate: function () {
            if (vars.rowIndex < vars.rows-1) {
                let nextRow = rule.applyRule(vars.board[vars.rowIndex]);
                vars.rowIndex++;
                vars.board[vars.rowIndex] = nextRow;
                console.log(vars.rowIndex);
            }
        },

        display: function () {
            //Display the vars.board
            for (let i = 0; i < vars.rows;i++) {
                for (let j = 0; j < vars.columns;j++) {
                    if ((vars.board[i][j] == 1))  fill(76, 187, 23);
                    else  fill(1);

                    stroke(1);
                    rect(j*vars.sizeOfCell, i*vars.sizeOfCell, vars.sizeOfCell, vars.sizeOfCell, 60, 60, 60, 60);
                }
            }
        }
    }
}) ();
