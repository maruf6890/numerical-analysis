



Thread with pthread

***

```
#include <bits/stdc++.h>
#include <stdlib.h>
#include <pthread.h>
using namespace  std;

struct Args{
    int* arr;
    int start;
    int end;
};

void* threadFunc(void* args){
    Args* data=  (Args*) args;
    int* sum= new int(0);
    for(int i= data->start;  i< data-> end; i++){
        *sum+= data->arr[i]; 
    }
    return (void*) sum;
}

 int main(){
    pthread_t thread1, thread2;
    int arr[10]={1,2,3,4,5,6,7,8,9,10};
    int n=10;
    Args arg1= {arr,0,n/2};
    Args arg2= {arr,n/2,n};
    int total=0;
    
    void* result
    pthread_create(&thread1,NULL,threadFunc,&arg1) 
    pthread_create(&thread2,NULL,threadFunc,&arg2);  
    pthread_join(thread1,&result);
    total+= *((int*) result);
    delete (int*) result;
    pthread_join(thread2,&result);
    total+= *((int*) result);
    delete (int*) result;
    cout<<total<<endl;

  
  
  
  

 }
```



```
#include <bits/stdc++.h>
#include <pthread.h>
using namespace std;

struct Args {
    int* arr;
    int n;
};

void* findMax(void* arg) {
    Args* data = (Args*) arg;
    int* maxVal = new int(data->arr[0]);
    for (int i = 1; i < data->n; i++) {
        if (data->arr[i] > *maxVal) *maxVal = data->arr[i];
    }
    return (void*) maxVal;
}

void* findMin(void* arg) {
    Args* data = (Args*) arg;
    int* minVal = new int(data->arr[0]);
    for (int i = 1; i < data->n; i++) {
        if (data->arr[i] < *minVal) *minVal = data->arr[i];
    }
    return (void*) minVal;
}

int main() {
    int arr[] = {5, 2, 9, 1, 6, 3};
    int n = sizeof(arr)/sizeof(arr[0]);

    pthread_t t1, t2;
    Args args = {arr, n};

    void* result;
    pthread_create(&t1, NULL, findMax, &args);
    pthread_create(&t2, NULL, findMin, &args);

    pthread_join(t1, &result);
    int maxVal = *((int*)result);
    delete (int*) result;

    pthread_join(t2, &result);
    int minVal = *((int*)result);
    delete (int*) result;

    cout << "Maximum = " << maxVal << endl;
    cout << "Minimum = " << minVal << endl;

    return 0;
}

```



```
#include <bits/stdc++.h>
#include <thread>
using namespace std;

void findMax(int* arr, int n, int& maxVal) {
    maxVal = arr[0];
    for (int i = 1; i < n; i++)
        if (arr[i] > maxVal) maxVal = arr[i];
}

void findMin(int* arr, int n, int& minVal) {
    minVal = arr[0];
    for (int i = 1; i < n; i++)
        if (arr[i] < minVal) minVal = arr[i];
}

int main() {
    int arr[] = {5, 2, 9, 1, 6, 3};
    int n = sizeof(arr)/sizeof(arr[0]);

    int maxVal = 0, minVal = 0;

    thread t1(findMax, arr, n, ref(maxVal));
    thread t2(findMin, arr, n, ref(minVal));

    t1.join();
    t2.join();

    cout << "Maximum = " << maxVal << endl;
    cout << "Minimum = " << minVal << endl;

    return 0;
}

```


```
#include <bits/stdc++.h>
#include <thread>
using namespace std;

void sumPart(int* arr, int start, int end, int& result) {
    result = 0;
    for (int i = start; i < end; i++) {
        result += arr[i];
    }
}

int main() {
    int arr[] = {1,2,3,4,5,6,7,8,9,10};
    int n = sizeof(arr)/sizeof(arr[0]);

    int sum1 = 0, sum2 = 0;

    thread t1(sumPart, arr, 0, n/2, ref(sum1));
    thread t2(sumPart, arr, n/2, n, ref(sum2));

    t1.join();
    t2.join();

    int total = sum1 + sum2;
    cout << "Total Sum = " << total << endl;

    return 0;
}



```


```
#include <bits/stdc++.h>

#include <sys/wait.h>

#include <unistd.h>

using namespace std;

  

int main(){

    pid_t pId= fork();

    if(pId==0){

        cout<<"it is a child process"<<endl;

        execl("./child", "child", NULL);

  
  

    }else if(pId>0){

        cout<<"Parent process is just started"<<endl;

        wait(NULL);

        coLuffy

        ut<<"I am back from child process"<<endl;

  

    }else{

        cout<<"error"<<endl;

    }

}
```


```
#include <iostream>

#include <vector>

#include <thread>

using namespace std;

  
  

void merge(vector<int> & a, l,r,m){

    vector<int> temp(r-l+1);

    int i=l, j=m+1,k=0;

    while(i<=m  && j<=r)  tem[k++]=(a[i]<a[j])? a[i++]: a[j++];

    while(i<=m)tem[k++]= a[i++];

      while(j<=r)tem[k++]= a[j++];

      for(int i=0; i<k; i++) a[i+l]= temp[i];

}

void parallelMergeSort(vector<int> &a,int l ,int r,int depth=0){

if(r>=l) return;

int m=l+(r-l)/2;

if(depth<2){

 thread thread1(parallelMergeSort,ref(a),l,m,depth+1);

  thread thread2(parallelMergeSort,ref(a),m+1,r,depth+1);

  join.thread1();

  join.thread2();

}else{

    parallelMergeSort(a, l, m, depth + 1);

    parallelMergeSort(a, m + 1, r, depth + 1);

}

  

merge(a, l,r,m);

}

int main() {

    vector<int> a = {38, 27, 43, 3, 9, 82, 10};

    parallelMergeSort(a, 0, a.size() - 1);

    for (int x : a) cout << x << " ";

}
```


```
#include <iostream>
#include <vector>
#include <thread>
using namespace std;

// Partition function
int partition(vector<int>& a, int l, int r) {
    int pivot = a[r], i = l - 1;
    for(int j = l; j < r; j++) {
        if(a[j] <= pivot) swap(a[++i], a[j]);
    }
    swap(a[i + 1], a[r]);
    return i + 1;
}

// Parallel Quick Sort
void parallelQuickSort(vector<int>& a, int l, int r, int depth = 0) {
    if(l >= r) return;
    int pi = partition(a, l, r);
    if(depth < 2) { // limit threads
        thread t1(parallelQuickSort, ref(a), l, pi - 1, depth + 1);
        thread t2(parallelQuickSort, ref(a), pi + 1, r, depth + 1);
        t1.join();
        t2.join();
    } else {
        parallelQuickSort(a, l, pi - 1, depth + 1);
        parallelQuickSort(a, pi + 1, r, depth + 1);
    }
}

int main() {
    vector<int> a = {38, 27, 43, 3, 9, 82, 10};
    parallelQuickSort(a, 0, a.size() - 1);
    for(int x : a) cout << x << " ";
}

```
