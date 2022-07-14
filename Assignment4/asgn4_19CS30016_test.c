/*
Test file to check the yacc parser for our compiler
The code below contains three programs:
    - Quicksort implementation
    - Nth fibonacci number using dynamic programming
    - 0-1 knapsack problem using dynamic programming
    - and some custom codes for ensuring complete and intensive check of our syntax analyzer
The custom code is written such that its syntax remains correct and all possible keywords, statements and expressions are used
for intensive and complete testing of our syntax analyzer
*/




/* C implementation QuickSort */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define NIL -1
#define MAX 100
// A utility function to swap two elements
void swap(int* a, int* b)
{
    int t = *a;
    *a = *b;
    *b = t;
}
 
/* This function takes last element as pivot, places
   the pivot element at its correct position in sorted
    Arrayay, and places all smaller (smaller than pivot)
   to left of pivot and all greater elements to right
   of pivot */
int partition (int Array[], int low, int high)
{
    int pivot = Array[high];    // pivot
    int i = (low - 1);  // Index of smaller element
 
    for (int j = low; j <= high- 1; j++)
    {
        // If current element is smaller than or
        // equal to pivot
        if (Array[j] <= pivot)
        {
            i++;    // increment index of smaller element
            swap(&Array[i], &Array[j]);
        }
    }
    swap(&Array[i + 1], &Array[high]);
    return (i + 1);
}
 
/* The main function that implements QuickSort
 Array[] --> Arrayay to be sorted,
  low  --> Starting index,
  high  --> Ending index */
void quickSort(int Array[], int low, int high)
{
    if (low < high)
    {
        /* pi is partitioning index, Array[p] is now
           at right place */
        int pi = partition(Array, low, high);
 
        // Separately sort elements before
        // partition and after partition
        quickSort(Array, low, pi - 1);
        quickSort(Array, pi + 1, high);
    }
}
 
/* Function to print an Arrayay */
void printArrayay(int Array[], int size)
{
    int i;
    for (i=0; i < size; i++)
        printf("%d ", Array[i]);
    printf("\n");
}
 
// Driver program to test above function
/*
Program for nth fibonacci number using dynamic programming
*/
 
int lookup[MAX];
 
/* Function to initialize NIL vues in lookup table */
void _initialize()
{
  int i;
  for (i = 0; i < MAX; i++)
    lookup[i] = NIL;
}
 
/* function for nth Fibonacci number */
inline int fib(int n)
{
   if (lookup[n] == NIL)
   {
      if (n <= 1)
         lookup[n] = n;
      else
         lookup[n] = fib(n-1) + fib(n-2);
   }
 
   return lookup[n];
}





/*
Auxillary functions for 0-1 knapsack problem 
*/


// A utility function that returns maximum of two integers
int max(int a, int b) { return (a > b)? a : b; }
 
// Returns the maximum vue that can be put in a knapsack of capacity W
int knapSack(int W, int w[], int v[], int n)
{
   int i, w;
   int K[n+1][W+1];
 
   // Build table K[][] in bottom up manner
   for (i = 0; i <= n; i++)
   {
       for (w = 0; w <= W; w++)
       {
           if (i==0 || w==0)
               K[i][w] = 0;
           else if (w[i-1] <= w)
                 K[i][w] = max(v[i-1] + K[i-1][w-w[i-1]],  K[i-1][w]);
           else
                 K[i][w] = K[i-1][w];
       }
   }
 
   return K[n][W];
}



int main()
{
    int Array[] = {9, 8, 7, 6, 5, 4};
    int n = sizeof(Array)/sizeof(Array[0]);
    quickSort(Array, 0, n-1);
    printf("Sorted Arrayay: \n");
    printArrayay(Array, n);

    //driver for nth fibonacci problem
    int n1 = 40;
    _initialize();
    printf("Fibonacci number is %d ", fib(n1));


    //driver for 0-1 knapsack problem using dynamic programming
    int v[] = {60, 100, 120};
    int w[] = {10, 20, 30};
    int  W = 50;
    int n = sizeof(v)/sizeof(v[0]);
    printf("%d", knapSack(W, w, v, n));

    /*Some other random code snippets for intensive and complete checking of  the syntax analyser of our compiler*/
    auto float abcd = -45.56 ;
    volatile int defg = 89;
    char text[100];
    text="Hello World!\n";
    const char ch='a';
    extern short int a=(5^7)|9;
    signed int b=-a;
    unsigned long c= a+b;

     int l,h;
  printf("Enter the length and breadth of rectangle: \n");
  scanf("%d%d",&l,&h);
  printf("Area of rectangle is: %d",l*h);

    i=sizeof(char);
    _Bool   a;
    _Complex    b;
    _Imaginary  c;

    enum days;

    return 0;
}