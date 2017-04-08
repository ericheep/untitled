// Eric Heep
// April 8th, 2017
// Sort.ck


public class Sort {

    0 => int type;

    0 => int INSERT;
    1 => int SELECTION;
    2 => int BUBBLE_ITERATIVE;
    3 => int BUBBLE_RECURSIVE;
    4 => int MERGE;
    5 => int QUICK;
    6 => int HEAP;

    fun int[] sort(int arr[]) {
        sort(arr, arr.size());
    }

    fun int[] sort(int arr[], int n) {
        // switch/case like thing
        if (type == INSERT) {
            return insert(arr, n);
        }
        if (type == SELECTION) {
            return selection(arr, n);
        }
        if (type == BUBBLE_ITERATIVE) {
            return bubbleIterative(arr, n);
        }
        if (type == BUBBLE_RECURSIVE) {
            return bubbleRecursive(arr, n);
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

    fun int[] selection(int arr[], int n) {
        for (0 => int i; i < n - 1; i++) {
            i => int min;

            for (i + i => int j; j < n; j++) {
                if (arr[j] < arr[min])
                    j => min;
            }

            indexSwap(arr, min, i);
        }
    }

    fun int[] bubbleIterative(int arr[], int n) {
        for (0 => int i; i < n - 1; i++) {

            for (0 => int j; j < n - 1 - i; j++) {
                if (arr[j] > arr[j + 1]) {
                    indexSwap(arr, j, j + 1);
                }
            }
        }
    }

    fun int[] bubbleRecursive(int arr[], int n) {
        for (0 => int i; i < n - 1; i++) {
            if (arr[i] > arr[i + 1]) {
                indexSwap(arr, i, i + 1);
            }
        }

        if (n - 1 > 1) {
            bubbleRecursive(arr, n - 1);
        }
    }

    fun void indexSwap(int arr[], int a, int b) {
        arr[a] => int temp;
        arr[b] => arr[a];
        temp => arr[b];
    }

    fun void setInsert() {
        INSERT => type;
    }

    fun void setSelection() {
        SELECTION => type;
    }

    fun void setBubbleIterative() {
        BUBBLE_ITERATIVE => type;
    }

    fun void setBubbleRecursive() {
        BUBBLE_RECURSIVE => type;
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
// s.setInsert();
s.setBubbleRecursive();

[0, 5, 2, 3, 7, 5] @=> int mixed[];

s.sort(mixed);
s.print(mixed);


