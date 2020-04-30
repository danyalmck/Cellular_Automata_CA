public class Rule {

    private int[] ruleset = new int[8];

    public Rule(int ruleNumber) {
        this.ruleNumberConverter(ruleNumber);
    }


    private boolean ruleNumberConverter(int ruleNumber) {
        if (!(ruleNumber >= 0 && ruleNumber < 256)) {
            for (int i = 0; i < 8; i++)
                this.ruleset[i] = 0;

            return false;
        }

        String bin = Integer.toBinaryString(ruleNumber);

        for (int i = bin.length()-1, j = 7; i >= 0; i--, j--) {
            this.ruleset[j] = Character.getNumericValue(bin.charAt(i));
        }

        return true;
    }


    public int[] applyRule(int[] row) {
        int[] nextRow = new int[row.length];
        int next;
        int previous;

        for (int i = 0; i < row.length; i++) {
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
                nextRow[i] = this.ruleset[0];

            else if (row[previous] == 1 && row[i] == 1 && row[next] == 0)
                nextRow[i] = this.ruleset[1];

            else if (row[previous] == 1 && row[i] == 0 && row[next] == 1)
                nextRow[i] = this.ruleset[2];

            else if (row[previous] == 1 && row[i] == 0 && row[next] == 0)
                nextRow[i] = this.ruleset[3];

            else if (row[previous] == 0 && row[i] == 1 && row[next] == 1)
                nextRow[i] = this.ruleset[4];

            else if (row[previous] == 0 && row[i] == 1 && row[next] == 0)
                nextRow[i] = this.ruleset[5];

            else if (row[previous] == 0 && row[i] == 0 && row[next] == 1)
                nextRow[i] = this.ruleset[6];

            else if (row[previous] == 0 && row[i] == 0 && row[next] == 0)
                nextRow[i] = this.ruleset[7];
        }

        return nextRow;
    }
}
