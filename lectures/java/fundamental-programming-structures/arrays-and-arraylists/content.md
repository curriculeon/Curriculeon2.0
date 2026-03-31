

## ArrayLists
An ArrayList is a generic class that stores data like an array, but with dynamic sizing and methods.


> `ArrayList<Integer> intArrList = new ArrayList<Integer>();`

or

> `ArrayList<Integer> intArrList = new ArrayList<>();`

-

### Wrapper Classes
Generic classes (like ArrayList) cannot take primitive types as it's type parameter.<br/>
Luckily, Java has "wrapper classes" to fix this, and will "autobox" and "unbox" the values.
```java
ArrayList<Integer> intArrList = new ArrayList<Integer>();
for(int i = 0; i < 5; i++) {
  intArrList.add(i);
}
```

-

### Wrapper Classes
A wrapper class is, essentially, the Object representation of the primitive type.<br/>
They also, sometimes, have helpful methods and class constants within them that the primitives don't.<br/>
For example, Integer has a

> `public static String toBinaryString(int i)`

method to return the bit string of a number.<br/>
Double has the `NEGATIVE_INFINITY`, `POSITIVE_INFINITY`, and `NaN` constants.<br/>

-

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

-

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

-

### Copying Arrays and ArrayLists

```java
int[] arr1 = {1, 2, 3};
int[] arr2 = arr1;
```

This is just one array with two things referencing it.

You need `Arrays.copyOf()` to quickly do a copy of an array.

For arrayLists:
> `ArrayList<String> copiedList = new ArrayList<>(originalList);`

-

You can also turn ArrayLists into arrays and vice-versa.

Look into the ArrayList and Arrays APIs to see what methods they have available.

-
-

## Functional Decomposition

-
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

-
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

-
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
