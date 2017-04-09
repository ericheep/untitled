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

    // for heap sort
    0 => int end;

    fun void sort(int arr[]) {
        sort(arr, arr.size());
    }

    fun void sort(int arr[], int step) {
        arr.size() => int n;

        if (type == INSERT) {
            insertSort(arr, n);
        }
        if (type == SELECTION) {
            selectionSort(arr, n);
        }
        if (type == BUBBLE_ITERATIVE) {
            bubbleIterativeSort(arr, n);
        }
        if (type == BUBBLE_RECURSIVE) {
            bubbleRecursiveSort(arr, n);
        }
        if (type == MERGE) {
            int aux[n];
            for (0 => int i; i < n; i++) {
                arr[i] => aux[i];
            }
            mergeSort(arr, aux, 0, n - 1);
        }
        if (type == QUICK) {
            quickSort(arr, 0, n - 1);
        }
        if (type == HEAP) {
            heapSort(arr, n);
        }

    }

    fun void insertSort(int arr[], int n) {
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

    fun void selectionSort(int arr[], int n) {
        for (0 => int i; i < n - 1; i++) {
            i => int min;

            for (i + i => int j; j < n; j++) {
                if (arr[j] < arr[min])
                    j => min;
            }

            indexSwap(arr, min, i);
        }
    }

    fun void bubbleIterativeSort(int arr[], int n) {
        for (0 => int i; i < n - 1; i++) {

            for (0 => int j; j < n - 1 - i; j++) {
                if (arr[j] > arr[j + 1]) {
                    indexSwap(arr, j, j + 1);
                }
            }
        }
    }

    fun void bubbleRecursiveSort(int arr[], int n) {
        for (0 => int i; i < n - 1; i++) {
            if (arr[i] > arr[i + 1]) {
                indexSwap(arr, i, i + 1);
            }
        }

        if (n - 1 > 1) {
            bubbleRecursiveSort(arr, n - 1);
        }
    }

    fun void mergeSort(int arr[], int aux[], int low, int high) {
        if (high == low) {
            return;
        }

        low + ((high - low) >> 1) => int mid;

        mergeSort(arr, aux, low, mid);          // split / merge left  half
        mergeSort(arr, aux, mid + 1, high);     // split / merge right half
        merge(arr, aux, low, mid, high);        // merge the two half runs

    }

    fun void merge(int arr[], int aux[], int low, int mid, int high) {

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

    fun void quickSort(int arr[], int start, int end) {
        if (start >= end) {
            return;
        }

        partition(arr, start, end) => int pivot;
        quickSort(arr, start, pivot - 1);
        quickSort(arr, pivot + 1, end);
    }

    fun int leftChild(int i) {
        return (2 * i + 1);
    }

    fun int rightChild(int i) {
        return (2 * i + 2);
    }

    fun int partition(int arr[], int start, int end) {
        arr[end] => int pivot;
        start => int pIndex;

        for (start => int i; i < end; i++) {
            if (arr[i] <= pivot) {
                indexSwap(arr, i, pIndex);
                pIndex++;
            }

        }
        indexSwap(arr, pIndex, end);

        return pIndex;
    }

    fun void heapify(int arr[], int i) {
        leftChild(i) => int left;
        rightChild(i) => int right;

        i => int largest;

        if (left < end && arr[left] > arr[i]) {
            left => largest;
        }
        if (right < end && arr[right] > arr[largest]) {
            right => largest;
        }
        if (largest != i) {
            indexSwap(arr, i, largest);
            heapify(arr, largest);
        }
    }

    fun void buildHeap(int arr[]) {
        (end - 2) /2 => int i;
        while (i >= 0) {
            heapify(arr, i--);
        }
    }

    fun void heapSort(int arr[], int n) {
        n => end;

        buildHeap(arr);

        while (end != 1) {
            indexSwap(arr, 0, end - 1);
            end--;
            heapify(arr, 0);
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
        chout <= "\n";
    }

}

Sort s;
s.setHeap();

[0, 5, 2, 3, 1] @=> int mixed[];

s.sort(mixed, 5);
s.print(mixed);


