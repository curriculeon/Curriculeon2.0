---
layout: slides
---

# Fundamental Programming Structures in Java: Arrays




<!-- supertopic -->

## What we'll cover

<p class="fragment fade-up">Arrays</p>
<p class="fragment fade-up">ArrayLists</p>
<p class="fragment fade-up">Wrapper Classes</p>





<!-- supertopic -->
## Arrays
* An array is a data structure that stores a collection of values of the same type.
* each individual value is accessible by using specifting its index.


<!-- subtopic -->

Declare an array variable by specifying the array type - which is the element type followed by [] - and the array variable name

```java
int[] a;
```

Use the new operator to create the array.

```java
int[] a = new int[100];
```


<!-- subtopic -->

To find the number of elements of an array, use array.length

```java
for (int i = 0; i < a.length; i++)
    System.out.println(a[i]);
```


<!-- subtopic -->

Once you create an array, you cannot change its size


<!-- subtopic -->

### The "for each" Loop

The enhanced for loop

```java
for (variable : collection) statement
```


<!-- subtopic -->

```java
for (int element : a) System.out.println(element);
```

### Array Initializers and Anonymous Arrays

shortcut for creating an array object and supplying initial values at the same time

```java
int[] smallPrimes = { 2, 3, 5, 7, 11, 13 };
```


<!-- subtopic -->

anonymous array:
```java
new int[] { 17, 19, 23, 29, 31, 37 }
```


<!-- subtopic -->

``` java
smallPrimes = new int[] { 17, 19, 23, 29, 31, 37 };
//is shorthand for
int[] anonymous = { 17, 19, 23, 29, 31, 37 };

smallPrimes = anonymous;
```

### Array Copying

You can copy one array variable into another, but then both variables refer to the same array:

```java
int[] luckyNumbers = smallPrimes;
luckyNumbers[5] = 12; // now smallPrimes[5] is also 12
```


<!-- subtopic -->

Figure 3.14 shows the result. If you actually want to copy all values of one array into a new array, you use the copyOf method in the Arrays class

```java
int[] copiedLuckyNumbers = Arrays.copyOf(luckyNumbers, luckyNumbers.length);
```


<!-- subtopic -->

### Command-Line Parameters

`java Example foo bar baz 1 2 3`
```java
public class Example {
  public static void main(String[] args) {
    for(String clArg : args) {
      System.out.println(clArg);
    }
  }
}
```

<!-- subtopic -->

### Array Sorting

To sort an array of numbers, you can use one of the sort methods in the Arrays class:

```java
int[] a = new int[10000];
...
Arrays.sort(a)
```

This method uses a tuned version of the QuickSort algorithm that is claimed to be very efficient on most data sets.

[Arrays API](https://docs.oracle.com/javase/7/docs/api/java/util/Arrays.html)


<!-- subtopic -->

### Multidimensional Arrays

Multidimensional arrays use more than one index to access array elements

Declaring a two-dimensional array in Java

```java
double[][] balances;
```

<!-- subtopic -->

You cannot use the array until you initialize it.

```java
balances = new double[NYEARS][NRATES];
```


<!-- subtopic -->

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




<!-- supertopic -->

## ArrayLists
An ArrayList is a generic class that stores data like an array, but with dynamic sizing and methods.


<!-- subtopic -->

> `ArrayList<Integer> intArrList = new ArrayList<Integer>();`

or

> `ArrayList<Integer> intArrList = new ArrayList<>();`


<!-- subtopic -->

### Wrapper Classes
Generic classes (like ArrayList) cannot take primitive types as it's type parameter.<br/>
Luckily, Java has "wrapper classes" to fix this, and will "autobox" and "unbox" the values.
```java
ArrayList<Integer> intArrList = new ArrayList<Integer>();
for(int i = 0; i < 5; i++) {
  intArrList.add(i);
}
```


<!-- subtopic -->

### Wrapper Classes
A wrapper class is, essentially, the Object representation of the primitive type.<br/>
They also, sometimes, have helpful methods and class constants within them that the primitives don't.<br/>
For example, Integer has a

> `public static String toBinaryString(int i)`

method to return the bit string of a number.<br/>
Double has the `NEGATIVE_INFINITY`, `POSITIVE_INFINITY`, and `NaN` constants.<br/>


<!-- subtopic -->

|primitive|Wrapper|
|---------|-------|
|int|Integer|
|byte|Byte|
|short|Short|
|long|Long|
|char|Character|
|float|Float|
|double|Double|
|boolean|Boolean|


<!-- subtopic -->

```java
String[] arr = {"Foo", "Bar", "Baz"};
ArrayList<String> arrList = new ArrayList<>();
for(String word : arr) {
  arrList.add(word);
}
arrList.get(0);
arrList.set(2, "new one");
arrList.remove(1);
arrList.size();
```


<!-- subtopic -->

### Copying Arrays and ArrayLists

```java
int[] arr1 = {1, 2, 3};
int[] arr2 = arr1;
```

This is just one array with two things referencing it.

You need `Arrays.copyOf()` to quickly do a copy of an array.

For arrayLists:
> `ArrayList<String> copiedList = new ArrayList<>(originalList);`


<!-- subtopic -->

You can also turn ArrayLists into arrays and vice-versa.

Look into the ArrayList and Arrays APIs to see what methods they have available.




<!-- supertopic -->

## Functional Decomposition


<!-- subtopic -->
```java
public class Example {

  public static void main(String[] args) {

    int[] arr = {1, 2, 3, 4, 5};
    int[] doubledArr = new int[arr.length];

    for(int i = 0; i < arr.length; i++) {
      doubledArr[i] = arr[i] * 2;
    }

    int[] quadArr = new int[arr.length];

    for(int i = 0; i < arr.length; i++) {
      quadArr[i] = doubledArr[i] * 2;
    }

    for(int item : quadArr) {
      System.out.println(item);
    }
  }
}
```


<!-- subtopic -->
```java
public class Example {
  public static void main(String[] args) {
    int[] arr = {1, 2, 3, 4, 5};
    int[] doubledArr = doubleArr(arr);
    int[] quadArr = doubleArr(doubledArr);

    printArr(quadArr);
  }

  public static int[] doubleArr(int[] arr) {
    int[] doubled = new int[arr.length];
    for(int i = 0; i < arr.length; i++) {
      doubled[i] = arr[i] * 2;
    }
    return doubled;
  }

  public static void printArr(int[] arr) {
    for(int item : arr) {
      System.out.println(item);
    }
  }
}
```


<!-- subtopic -->
### Var Args
Essentially just an array and must be the last parameter in the function declaration.

```java
public static int avg(int... values) {
  int sum = 0;
  for(int value : values) {
    sum += value;
  }
  return sum / values.length;
}
```
