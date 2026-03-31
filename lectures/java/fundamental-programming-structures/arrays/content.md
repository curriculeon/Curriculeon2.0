# Fundamental Programming Structures in Java: Arrays



## What we'll cover
* Arrays
* ArrayLists
* Wrapper Classes





## Arrays
* An array is a data structure that stores a collection of values of the same type.
* each individual value is accessible by using specifting its index.
* Declare an array variable by specifying the array type, which is the element type, followed by `[]`, and the array variable name
  * In the example below, the array-type is `int`
  * In the example below, the array variable name is `array`

```java
int[] array;
```

* Use the new operator to create the array.
* Once an array is created its length cannot change
  * In the example below, the array is of length `100`.

```java
int[] array = new int[100];
```


* To find the number of elements of an array, use array.length

```java
int[] array = new int[100];
int numberOfElements = array.length;
```


### Array Initializers and Anonymous Arrays

* Below is are two shortcuts for creating an array object and supplying initial values at the same time.

```java
int[] smallPrimes = new int[] { 17, 19, 23, 29, 31, 37 };
int[] smallerPrimes = { 2, 3, 5, 7, 11, 13 };
```


### Array Copying

Arrays can be set from one variable to another. However, then both variables refer to the same array.

```java
int[] smallPrimes = new int[] { 17, 19, 23, 29, 31, 37 };
int[] luckyNumbers = smallPrimes;
luckyNumbers[5] = 12; // now smallPrimes[5] is also 12
```


* To copy all values of one array to a new array, use `Arrays.copyOf` method.

```java
int[] copiedLuckyNumbers = Arrays.copyOf(luckyNumbers, luckyNumbers.length);
```






### The "for each" Loop
* Used to iterate through each element in an iterable object (Array, List, Collection, etc.)

* **General Syntax**

```java
for (VariableType variableName : iterableType) {
  // body of for loop
  // ...
}
```

* **Example Syntax**

```java
int[] smallPrimes = new int[] { 17, 19, 23, 29, 31, 37 };
for (int currentPrime : smallPrimes) {
  System.out.println(currentPrime);
} 
```

* **Standard-`For` Equivalent**


```java
int[] smallPrimes = new int[] { 17, 19, 23, 29, 31, 37 };
int numberOfElements = smallPrimes.length;
for (int currentLoopNumber = 0; currentLoopNumber < numberOfElements; currentLoopNumber++) {
  int currentPrime = smallPrimes[currentLoopNumber];
  System.out.println(currentPrime);
}
```

* **`While` Equivalent**

```java
int[] smallPrimes = new int[] { 17, 19, 23, 29, 31, 37 };
int numberOfElements = smallPrimes.length;
int currentLoopNumber = 0;
while(currentLoopNumber < numberOfElements) {
  int currentPrime = smallPrimes[currentLoopNumber];
  System.out.println(currentPrime);
  currentLoopNumber++;
}
```



### Array Sorting
* To sort an array of numbers, you can use one of the sort methods in the Arrays class:
* This method uses a tuned version of the QuickSort algorithm that is claimed to be very efficient on most data sets.
  * [Arrays API](https://docs.oracle.com/javase/7/docs/api/java/util/Arrays.html)

```java
int[] a = new int[10000];
Arrays.sort(a)
```



### Multidimensional Arrays
* Multidimensional arrays use more than one index to access array elements
* Declaring a two-dimensional array in Java

```java
double[][] balances;
```



You cannot use the array until you initialize it.

```java
balances = new double[NYEARS][NRATES];
```



```java
int[][] magicSquare =
{
    {16, 3, 2, 13},
    {5, 10, 11, 8},
    {9, 6, 7, 12},
    {4, 15, 14, 1}
};

balances[i][j]
```
