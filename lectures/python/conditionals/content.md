
# Control Flow


## What we'll cover
* Block Scope
* Conditional Statements
* Loops



### Block Scope
* A block or compound statement consists of a number of statements, surrounded by a pair of braces.
* Blocks define the scope of your variables.
* Blocks can be nested
* Redeclaring identically named variables in two nested blocks will re-assign the variable to the most recently executed assignment statement value




### Conditional Statements

#### If Statements General Syntax
* The argument of the `if` clause must be a `boolean` value.
    * the value of `condition` in the example below must be of type `boolean`.
* Execution of an `if` **`condition`** is called a _check_ or _evaluation_.
* The body of an `if` statement only executes if the value of the `condition` has a value of `true`.
* Control structure code created `branches`, or different paths that the code can take.


```python
if(condition): # this is a check
    statement1
    statement2
```


#### If Statements Example

```python
if(5 > 10): # this is a check
    print("5 is greater than 10!")
```




#### If/Else Statements General Syntax
* `If/Else` statements are used when you would like to execute one block or the other, but never both blocks.
* `If` statements **do not have to be** followed with an `else` statement
* `Else` statements **have to be** preceded with an `if` statement.

```python
if (condition):
    statement1
else:
    statement2
```



#### If/Else Statements Example
* `if/else if` statements are used when you would like to execute one of several blocks, given that at least one condition prior to the `else if` _check_ is `false`.
* `if` statements **do not have to be** paired with an `else if` statemenst
* `else if` statements **have to be** preceded by an `if` statements or `else if` statements.
* `else if` blocks can only execute if the value of all `condition`s have a value of `false`.

```python
if (condition1):
    statement1
elif(condition2):
    statement2
```










#### If/Else If Statements General Syntax

```python
if (condition):
    statement1
elif(condition2):
    statement2
else:
    statement3
```




### Loops

The while loop executes a statement (which may be a block statement) while a condition is true

```python
while(condition):
    statement
```
The while loop will never execute if the condition is false at the outset


If you want to make sure a block is executed at least once, ensure the initial condition is set to `True`, then internally changed to `False` to `break` out of the loop

```python
check_condition = True
while(check_condition):
    if(some_break_condition):
        check_condition = False
```



### Determinate Loops

The for loop is a general construct to support iteration controlled by a counter or similar variable that is updated after every iteration.

```python
for i in range(10):
    print(i)
```


### Nested Loops
You can have loops within loops, but be aware of variable scoping:
```python
for i in range(5):
  for j in range(5):
    print(j)
```



### Statements That Break Control Flow

The same break statement that you use to exit a switch can also be used to break out of a loop

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


The continue statement transfers control to the header of the innermost enclosing loop

```python
while (sum < goal):
    input_number_as_string = input("Enter a number: ")
    input_number_as_integer = int(input_number_as_string)
    if (input_number_as_integer == 0):
        continue
    sum += n # not executed if `input_number_as_integer` is 0
```
