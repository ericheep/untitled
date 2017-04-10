// Eric Heep
// April 8th, 2017
// Sort.ck


public class Sort {

    0 => int m_type;
    0 => int m_iteration;
    0 => int m_innerIteration;

    // switch case
    0 => int INSERT;
    1 => int SELECTION;
    2 => int BUBBLE;
    3 => int MERGE;
    4 => int QUICK;
    5 => int HEAP;

    // for heap sort
    0 => int end;

    fun void resetStep() {
        0 => m_iteration;
    }

    fun void step(int arr[], int copy[]) {
        arr.size() => int n;
        for (0 => int i; i < n; i++) {
            arr[i] => copy[i];
        }
        sort(copy, m_iteration);
        m_iteration++;
    }

    fun int checkStep(int step) {
        if (step == m_innerIteration) {
            return true;
        } else {
            return false;
        }
        m_innerIteration++;
    }

    fun void sort(int arr[], int copy[]) {
        sort(arr, -1);
    }

    fun void sort(int arr[], int step) {
        arr.size() => int n;
        0 => m_innerIteration;

        if (m_type == INSERT) {
            insertSort(arr, n, step);
        }
        if (m_type == SELECTION) {
            selectionSort(arr, n, step);
        }
        if (m_type == BUBBLE) {
            bubbleSort(arr, n, step);
        }
        if (m_type == MERGE) {
            int aux[n];
            for (0 => int i; i < n; i++) {
                arr[i] => aux[i];
            }
            mergeSort(arr, aux, 0, n - 1, step);
        }
        if (m_type == QUICK) {
            quickSort(arr, 0, n - 1, step);
        }
        if (m_type == HEAP) {
            0 => end;
            heapSort(arr, n, step);
        }
    }

    fun void insertSort(int arr[], int n, int step) {
        for (1 => int i; i < n; i++) {
            if (checkStep(step)) return;

            arr[i] => int value;
            i => int j;

            while (j > 0 && arr[j - 1] > value) {
                arr[j - 1] => arr[j];
                j--;
            }

            value => arr[j];
        }
    }

    fun void selectionSort(int arr[], int n, int step) {
        for (0 => int i; i < n - 1; i++) {
            if (checkStep(step)) return;

            i => int min;
            for (i + 1 => int j; j < n; j++) {
                if (arr[j] < arr[min]) {
                    j => min;
                }
            }

            indexSwap(arr, min, i);
        }
    }

    fun void bubbleSort(int arr[], int n, int step) {
        for (0 => int i; i < n - 1; i++) {
            if (checkStep(step)) return;

            for (0 => int j; j < n - 1 - i; j++) {
                if (arr[j] > arr[j + 1]) {
                    indexSwap(arr, j, j + 1);
                }
            }
        }
    }

    fun void mergeSort(int arr[], int aux[], int low, int high, int step) {
        if (high == low) {
            return;
        }

        if (step == m_innerIteration) {
            return;
        }
        m_innerIteration++;

        low + ((high - low) >> 1) => int mid;

        mergeSort(arr, aux, low, mid, step);          // split / merge left  half
        mergeSort(arr, aux, mid + 1, high, step);     // split / merge right half

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

    fun void quickSort(int arr[], int start, int end, int step) {
        if (start >= end) {
            return;
        }

        if (step == m_innerIteration) {
            return;
        }
        m_innerIteration++;

        partition(arr, start, end) => int pivot;
        quickSort(arr, start, pivot - 1, step);
        quickSort(arr, pivot + 1, end, step);
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

    fun void heapSort(int arr[], int n, int step) {
        n => end;

        buildHeap(arr);

        while (end != 1) {
            if (step == m_innerIteration) {
                return;
            }
            m_innerIteration++;

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

    fun int isSorted(int arr[]) {
        1 => int sorted;
        for (0 => int i; i < arr.size() - 1; i++) {
            if (arr[i] > arr[i + 1]) {
                0 => sorted;
                break;
            }
        }
        return sorted;
    }

    fun void setInsert() {
        INSERT => m_type;
    }

    fun void setSelection() {
        SELECTION => m_type;
    }

    fun void setBubble() {
        BUBBLE => m_type;
    }

    fun void setMerge() {
        MERGE => m_type;
    }

    fun void setQuick() {
        QUICK => m_type;
    }

    fun void setHeap() {
        HEAP => m_type;
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
s.setQuick();

10 => int n;

int base[n];
int mixed[n];

for (0 => int i; i < n; i++) {
    Math.random2(0, n) => base[i] => mixed[i];
}

while (!s.isSorted(mixed)) {
    s.step(base, mixed);
    s.print(mixed);
    100::ms => now;
}
