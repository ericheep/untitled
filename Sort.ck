// Eric Heep
// April 8th, 2017
// Sort.ck


public class Sort {

    0 => int type;
    0 => int INSERT;
    1 => int SELECTION;
    2 => int BUBBLE;
    3 => int MERGE;
    4 => int QUICK;
    5 => int HEAP;

    fun int[] sort(int arr[]) {
        sort(arr, arr.size());
    }

    fun int[] sort(int arr[], int n) {
        // switch/case like thing
        if (type == INSERT) {
            return insert(arr, n);
        }
        if (type == SELECTION) {

        }
        if (type == BUBBLE) {

        }
        if (type == QUICK) {

        }
        if (type == HEAP) {

        }

    }

    fun int[] insert(int arr[], int n) {
        for (1 => int i; i < n; i++) {

            arr[i] => int value;
            i => int j;

            while (j > 0 && arr[j - 1] > value) {
                arr[j - 1] => arr[j];
                j--;
            }

            value => arr[j];
        }
    }

    fun void setInsert() {
        INSERT => type;
    }

    fun void setSelection() {
        SELECTION => type;
    }

    fun void setBubble() {
        BUBBLE => type;
    }

    fun void setMerge() {
        MERGE => type;
    }

    fun void setQuick() {
        QUICK => type;
    }

    fun void setHeap() {
        HEAP => type;
    }

    fun void print(int arr[]) {
        for (0 => int i; i < arr.size(); i++) {
            chout <= arr[i] + " ";
        }
        chout.flush();
    }

}

Sort s;
s.setInsert();

[0, 5, 2, 3, 7, 5] @=> int mixed[];

s.sort(mixed);
s.print(mixed);


