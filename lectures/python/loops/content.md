# Loops
* A loop is a block of instruction(s) that repeats multiple times as long as a condition is true.
* The intent of a loop is to re-execute the same lines of code several times in a program






## While Loop
* The while loop is used to repeat a section of code an unknown number of times until a specific condition is met

#### While Loop General Syntax

```python
while condition:
    statement(s)
```

#### While Loop Example

* Script


```python
i = 0
while i < 5:
    print("Hello")
    i += 1
```


* Output

```
Hello
Hello
Hello
Hello
Hello
```






## For Loop
* Used to iterate over a sequence

#### General Syntax

```python
for item in sequence:
    statement(s)
```

#### Example

* Script

```python
sequence = ["The", "Quick", "Brown", "Fox"]
for item in sequence:
    print(item)
```


* Output

```
The
Quick
Brown
Fox
```





## Break statement

* The same `break` statement is used to exit out of a loop


```python
payment_per_year = 10000
interest_rate = 0.05
current_year = 0
balance = 0
while (current_year <= 100):
    balance += payment_per_year
    interest = balance * interest_rate / 100
    balance += interest
    if (balance >= goal):
        break
    current_year += 1
```


* The `pass` statement transfers control to the header of the innermost enclosing loop

```python
while (sum < goal):
    input_number_as_string = input("Enter a number: ")
    input_number_as_integer = int(input_number_as_string)
    if (input_number_as_integer < 0):
        pass
    sum += n # not executed if n < 0
```




## Nested Loops
* Loops defined within loops are called _nested loops_.


```python
for i in range(3):
    print(i)
    for j in range(5):
        print(j)
```
