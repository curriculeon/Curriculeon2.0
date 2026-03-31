# Big O Notation

## What is?
* Big O notation is a way to describe the worst-case performance of an algorithm.
* It describes how the running time of an algorithm grows as the size of the input increases.
* In other words, it describes the upper bound on the running time of an algorithm.

### The Basic Idea
* The basic idea behind Big O notation is to express how much time an algorithm will take to execute.
    * the expression is written in terms of the `size` of the input, which is commonly denoted by the variable `n`.
* We use the notation `O(f(n))` to describe the running time of an algorithm, `f(n)` is a function that describes the upper bound on the running time.
* The function `f(n)` is chosen in such a way that it describes the growth rate of the running time as the input size increases.

### Example
* For example, if the running time of an algorithm is directly proportional to the size of the input, then the function `f(n)` is equal to n, and the running time is said to be `O(n)`.
* This means that the running time of the algorithm is linear with respect to the size of the input.
* On the other hand, if the running time of an algorithm is proportional to the square of the size of the input, then the function `f(n)` is equal to n^2 and the running time is said to be `O(n^2)`.
* This means that the running time of the algorithm is quadratic with respect to the size of the input.

### Notes on Big O
* It's worth noting that big O notation only provides an upper bound on the running time and it does not take into account the constant factors or lower-order terms, which can make a big difference in practice for small inputs.
* Also, the value of n, where big O notation starts to represent the running time of an algorithm is known as the "break-even point"

In conclusion, in order to determine the performance of an algorithm with Big O notation, you need to analyze how the running time of the algorithm changes as the input size increases. The goal is to find the simplest function that describes the upper bound on the running time.

<hr><hr>

## Logarithmic Functions
* There are also other functions that are commonly used to describe the running time of an algorithm, such as
    * `log(n)` which represents constant time.
    * `nlog(n)` which represents logarithmic time.
    * `1`, which represents linear logarithmic time.
* A logarithmic function, such as `log(n)` or `log` base `2` of `n` `(log2(n))`, describes an algorithm that grows more slowly as the input size increases.
* Algorithms with a logarithmic running time are generally considered to be very efficient, especially for large input sizes.

###  Logarithmic Function Example
* A logarithmic function is the inverse of an exponential function, and it describes the number of times you must divide the input in half to get down to a single item.
    * For example, in a binary search algorithm, the input is halved with each comparison, which means that `log(n)` comparisons are required to find an item in an array of n items.
* The logarithmic function is also used to represent the running time of algorithms that involve dividing a problem into smaller subproblems.
    * For example divide and conquer algorithms (e.g merge sort, quick sort) and recursive algorithms (e.g binary tree traversal, solution of recurrence relation).
* The logarithmic function also represents the performance of algorithms that operate on data structures that use hashing.
    * For example, the time complexity of the most commonly used operations on a hash table (insert, search, delete) is `O(1)` on average and `O(n)` in worst-case, but assuming that the table is well balanced, it is `O(log(n))`

In conclusion, Logarithmic functions are very powerful for describing the performance of algorithms that involve dividing a problem into smaller subproblems or using data structures that are balanced, such as balanced binary search trees or hash tables. An algorithm that has a logarithmic running time is considered to be very efficient, especially for large input sizes    