const rule = (() => {

    let ruleNumber = 110;

    let ruleSet = ((ruleNumber) => {
        let ruleset = new Array(8);

        for (let i = 0; i < 8; i++)
            ruleset[i] = 0;

        if (!(ruleNumber >= 0 && ruleNumber < 256)) {
            return ruleset;
        }

        let bin = ruleNumber.toString(2);

        for (let i = bin.length-1, j = 7; i >= 0; i--, j--) {
            ruleset[j] = parseInt(bin.charAt(i));
        }

        return ruleset;
    }) (ruleNumber);

    return {

        applyRule: function (row) {
            let nextRow = new Array(row.length);
            let next;
            let previous;

            for (let i = 0; i < row.length; i++) {
                if (i == 0) {
                    previous = row.length-1;
                    next = i+1;
                }

                else if (i == row.length-1) {
                    next = 0;
                    previous = i-1;
                }

                else {
                    next = i+1;
                    previous = i-1;
                }

                if (row[previous] == 1 && row[i] == 1 && row[next] == 1)
                nextRow[i] = ruleSet[0];

                else if (row[previous] == 1 && row[i] == 1 && row[next] == 0)
                nextRow[i] = ruleSet[1];

                else if (row[previous] == 1 && row[i] == 0 && row[next] == 1)
                nextRow[i] = ruleSet[2];

                else if (row[previous] == 1 && row[i] == 0 && row[next] == 0)
                nextRow[i] = ruleSet[3];

                else if (row[previous] == 0 && row[i] == 1 && row[next] == 1)
                nextRow[i] = ruleSet[4];

                else if (row[previous] == 0 && row[i] == 1 && row[next] == 0)
                nextRow[i] = ruleSet[5];

                else if (row[previous] == 0 && row[i] == 0 && row[next] == 1)
                nextRow[i] = ruleSet[6];

                else if (row[previous] == 0 && row[i] == 0 && row[next] == 0)
                nextRow[i] = ruleSet[7];
            }

            return nextRow;
        }
    }
}) ();
