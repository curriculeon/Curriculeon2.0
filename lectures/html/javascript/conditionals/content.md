
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


```javascript
if(condition){ // this is a check
    statement1
    statement2
}
```


#### If Statements Example

```javascript
if(5 > 10){ // this is a check
    print("5 is greater than 10!")
}
```




#### If/Else Statements General Syntax
* `If/Else` statements are used when you would like to execute one block or the other, but never both blocks.
* `If` statements **do not have to be** followed with an `else` statement
* `Else` statements **have to be** preceded with an `if` statement.

```javascript
if (condition){
    statement1
} else {
    statement2
}
```



#### If/Else Statements Example
* `if/else if` statements are used when you would like to execute one of several blocks, given that at least one condition prior to the `else if` _check_ is `false`.
* `if` statements **do not have to be** paired with an `else if` statemenst
* `else if` statements **have to be** preceded by an `if` statements or `else if` statements.
* `else if` blocks can only execute if the value of all `condition`s have a value of `false`.

```javascript
if (condition1){
    statement1
} else if(condition2) {
    statement2
}
```










#### If/Else If Statements General Syntax

```javascript
if (condition){
    statement1
} else if(condition2) {
    statement2
} else {
    statement3
}
```




### Loops

The while loop executes a statement (which may be a block statement) while a condition is true

```javascript
while(condition){
    statement
}
```
The while loop will never execute if the condition is false at the outset


If you want to make sure a block is executed at least once, ensure the initial condition is set to `True`, then internally changed to `False` to `break` out of the loop

```javascript
continueCondition = true
while(continueCondition){
    if(breakCondition){
        continueCondition = False
    }
}
```



### Determinate Loops

The for loop is a general construct to support iteration controlled by a counter or similar variable that is updated after every iteration.

```javascript
for(let i=0; i<10; i++) {
    console.log(i);
}
```


### Nested Loops
You can have loops within loops, but be aware of variable scoping:
```javascript
for(let i=0; i<10; i++) {
  console.log(i);
  for(let j=0; j<10; j++) {
      console.log(j);
  }
}
```



### Statements That Break Control Flow

The same break statement that you use to exit a switch can also be used to break out of a loop


```javascript
paymentPerYear = 10000;
interestRate = 0.05;
currentYear = 0;
balance = 0;
while (currentYear <= 100) {
    balance += paymentPerYear;
    interest = balance * interestRate / 100;
    balance += interest;
    if (balance >= goal) {
        break;
    }
    currentYear += 1;
}
```


The continue statement transfers control to the header of the innermost enclosing loop

```javascript
while (sum < goal){
    userInputAsString = prompt("Enter a number: ")
    userInputAsInteger = parseInt(userInputAsString)
    if (userInputAsInteger < 0){
        continue
    }
    sum = sum + n // not executed if n < 0W
}
```
