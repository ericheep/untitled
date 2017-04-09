// Eric Heep
// April 8th, 2017
// Sort.ck


public class Sort {

    0 => int type;

    // switch case thing
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
        if (type == INSERT) {
            return insertSort(arr, n);
        }
        if (type == SELECTION) {
            return selectionSort(arr, n);
        }
        if (type == BUBBLE_ITERATIVE) {
            return bubbleIterativeSort(arr, n);
        }
        if (type == BUBBLE_RECURSIVE) {
            return bubbleRecursiveSort(arr, n);
        }
        if (type == MERGE) {
            int aux[n];
            for (0 => int i; i < n; i++) {
                arr[i] => aux[i];
            }
            return mergeSort(arr, aux, 0, n - 1);
        }
        if (type == QUICK) {

        }
        if (type == HEAP) {

        }

    }

    fun int[] insertSort(int arr[], int n) {
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

    fun int[] selectionSort(int arr[], int n) {
        for (0 => int i; i < n - 1; i++) {
            i => int min;

            for (i + i => int j; j < n; j++) {
                if (arr[j] < arr[min])
                    j => min;
            }

            indexSwap(arr, min, i);
        }
    }

    fun int[] bubbleIterativeSort(int arr[], int n) {
        for (0 => int i; i < n - 1; i++) {

            for (0 => int j; j < n - 1 - i; j++) {
                if (arr[j] > arr[j + 1]) {
                    indexSwap(arr, j, j + 1);
                }
            }
        }
    }

    fun int[] bubbleRecursiveSort(int arr[], int n) {
        for (0 => int i; i < n - 1; i++) {
            if (arr[i] > arr[i + 1]) {
                indexSwap(arr, i, i + 1);
            }
        }

        if (n - 1 > 1) {
            bubbleRecursiveSort(arr, n - 1);
        }
    }

    fun int[] mergeSort(int arr[], int aux[], int low, int high) {
        if (high == low) {
            return arr;
        }

        low + ((high - low) >> 1) => int mid;

        mergeSort(arr, aux, low, mid);          // split / merge left  half
        mergeSort(arr, aux, mid + 1, high);     // split / merge right half
        merge(arr, aux, low, mid, high);        // merge the two half runs

    }

    fun int[] merge(int arr[], int aux[], int low, int mid, int high) {

        low => int k;
        low => int i;
        mid + 1 => int j;

        while (i <= mid && j <= high) {
            if (arr[i] < arr[j]) {
                arr[i++] => aux[k++];
            } else {
                arr[j++] => aux[k++];
            }
        }

        while (i <= mid) {
            arr[i++] => aux[k++];
        }

        for (low => int i; i <= high; i++) {
            aux[i] => arr[i];
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
s.setMerge();

[0, 5, 2, 3, 7] @=> int mixed[];

s.sort(mixed);
s.print(mixed);


