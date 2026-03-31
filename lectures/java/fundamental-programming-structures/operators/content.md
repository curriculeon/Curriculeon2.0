# Operators











<!-- supertopic -->

## Overview
* Operators
* Arithmetic Operators
* Logical Operators
* Relational Operators
* Parenthesis and Operator Hierarchy





<!-- supertopic -->

### Operators
* An _operator_ is a symbol which denotes a _function_ to be done.
* An operator is followed by at least one _operand_.
* _operands_ are the _value_ (literal or variable) being _operated_ on.
















<!------------------------------------------------------------------------------->
<!------------------------------ arithmetic operators --------------------------->
<!------------------------------------------------------------------------------->




<!-- supertopic -->

### the 5 Arithmetic Operators
1. `=` assignment
2. `+` addition
3. `-` subtraction
4. `*` multiplication
5. `/` division
6. `%` modulo





<!-- subtopic -->

#### Assignment Operator `=`
* The assignment operator has two operands:
    * The variable name
    * The variable value





<!-- subtopic -->

#### Addition Operator `+`
* The addition _operator_ has two _operands_:
    * _augend_ is the base value
    * _addend_ is the value to add to the base value
* By _adding_ values, we obtain a _sum_.

```java
int augend = 5;
int addend = 10;
int sum = augend + addend; // `sum` is 15
```







<!-- supertopic -->

#### Subtraction Operator `-`
* The subtraction _operator_ has two _operands_:
    * _minuend_ is the base value
    * _subtrahend_ is the value to remove from the base value
* By _subtracting_ values, we obtain a _difference_.

```java
int minuend = 15;
int subtrahend = 10;
int difference = minuend - subtrahend; // `difference` is 5
```







<!-- subtopic -->

#### Multiplication Operator `*`
* The multiplication _operator_ has two _operands_:
    * _multiplicand_ is the base value
    * _multiplier_ is the value to remove from the base value
* By _multiplying_ values, we obtain a _product_.

```java
int multiplicand = 5;
int multiplier = 10;
int product = multiplicand * multiplier; // `product` is 50
```









<!-- subtopic -->

#### Division Operator `/`
* The divison _operator_ has two _operands_:
    * _dividend_ is the base value
    * _divisor_ is the value to remove from the base value
* By _dividing_ values, we obtain a _quotient_.

```java
int dividend = 10;
int divisor = 5;
int quotient = dividend + divisor; // `quotient` is 2
```








<!-- subtopic -->

#### Modulo Operator `%`
* The modulo _operator_ has two _operands_:
    * _dividend_ is the base value
    * _divisor_ is the value to remove from the base value
* By _modding_ values, we obtain a _remainder_.

```java
int dividend = 10;
int divisor = 5;
int remainder = dividend + divisor; // `quotient` is 2
```





















<!------------------------------------------------------------------------------->
<!------------------------------ logical operators ------------------------------>
<!------------------------------------------------------------------------------->





<!-- supertopic -->

## the 6 Logical Operators
1. `!` not
2. `&&` _conditional_ and
3. `||` _conditional_ or
4. `^` xor (exclusive or)
5. `&` and
6. `|` or









<!-- subtopic -->

#### the _unary_ `!` operator
* Returns true if the operand to the right evaluates to false.
* Returns false if the operand to the right is true.

```java
boolean rightOperand = true;
boolean outcome = !rightOperand; // outcome is `false`
```


```java
boolean rightOperand = false;
boolean outcome = !rightOperand; // outcome is `true`
```










<!-- subtopic -->

#### the _binary_ `&` operator
* Returns true if both of the operands evaluate to true.
* Both operands are evaluated before the `and` operator is applied.
* The following code blocks have identical behavior in all cases

```java
boolean canWalkThroughDoor = door.isUnlocked() & door.isOpen();
```

```java
boolean doorIsUnlocked = door.isUnlocked();
boolean doorIsOpen = door.isOpen();
boolean canWalkThroughDoor = doorIsUnlocked && doorIsOpen;
```

* if `door` is not unlocked, then continue to evaluate if door is open











<!-- subtopic -->

#### the _binary_ `&&` operator
* Expression resolves to `true` if both of the operands evaluate to `true`.
* if the operand on the left returns `false`, the operation resolves to `false` without evaluating the operand on the right.





<!-- supertopic -->

##### Example

* The following code blocks have identical behavior in all cases

```java
boolean canWalkThroughDoor = door.isUnlocked() && door.isOpen();
```

```java
boolean canWalkThroughDoor;
if(door.isUnlocked()) {
    if(door.isOpen()) {
        canWalkThroughDoor = true;
    }
}
```














<!-- subtopic -->

#### the _binary_ `|` operator
* Returns `true` if at least one of the operands evaluates to true.
* Both operands are evaluated before the `or` operator is applied.

```java
boolean canWalkThroughDoor = door.isUnlocked() | door.isOpen();
```

```java
boolean doorIsUnlocked = door.isUnlocked();
boolean doorIsOpen = door.isOpen();
boolean canWalkThroughDoor = doorIsUnlocked || doorIsOpen;
```

* if `door` is not unlocked, then continue to evaluate if door is open










<!-- supertopic -->

#### the _binary_ `||` operator
* Expression resolves to `true` if one of the operands evaluate to `true`.
* if left operand is `true`, the operation resolves to `true` without evaluating the operand on the right.






<!-- supertopic -->

#### the _binary_ `||` operator
#### Example
* The following code blocks have identical behavior in all cases

```java
boolean canWalkThroughDoor = door.isUnlocked() || door.isOpen();
```

```java
boolean canWalkThroughDoor;
if(door.isUnlocked()) {
    canWalkThroughDoor = true;
}
if(door.isOpen()) {
    canWalkThroughDoor = true;
}
```




























<!------------------------------------------------------------------------------->
<!------------------------------ relational operators --------------------------->
<!------------------------------------------------------------------------------->




<!-- subtopic -->

## Relational Operators
* there are 6 relational operators that compare two numbers and return a boolean value.







<!-- supertopic -->

### the 6 Relational Operators
1. `<` _less than_
2. `>` _greater than_
3. `<=` _less than or equal to_
4. `>=` _greater than or equal to_
5. `==` _equal to_
6. `!=` _not equal to_




<!-- subtopic -->

### Relational Operators
* Each operand is a numeric or _boolean_ value.
* _Boolean_ values are either _true_ or _false_.
* The result of a relational operation is a _boolean_ value. 





<!-- subtopic -->

### `<` Less than
* `true` if left operand is less than right operand, otherwise `false`.

```java
int operand1 = 0;
int operand2 = 1;
boolean outcome = operand1 < operand2; // outcome is `true`
```

```java
int operand1 = 1;
int operand2 = 0;
boolean outcome = operand1 < operand2; // outcome is `false`
```







<!-- subtopic -->

### `>` Greater than
* `true` if left operand is greater than right operand, otherwise `false`.

```java
int operand1 = 1;
int operand2 = 0;
boolean outcome = operand1 > operand2; // outcome is `true`
```

```java
int operand1 = 0;
int operand2 = 1;
boolean outcome = operand1 > operand2; // outcome is `false`
```






<!-- subtopic -->

### `<=` Less than or equal to
* `true` if left operand is less than or equal to right operand, otherwise `false`.


```java
int operand1 = 0;
int operand2 = 1;
boolean outcome = operand1 <= operand2; // outcome is `true`
```

```java
int operand1 = 1;
int operand2 = 0;
boolean outcome = operand1 <= operand2; // outcome is `false`
```


```java
int operand1 = 0;
int operand2 = 0;
boolean outcome = operand1 <= operand2; // outcome is `true`
```






<!-- subtopic -->

### `>=` Greater than or equal to
* `true` if left operand is greatre than or equal to right operand, otherwise `false`.


```java
int operand1 = 0;
int operand2 = 1;
boolean outcome = operand1 >= operand2; // outcome is `false`
```

```java
int operand1 = 1;
int operand2 = 0;
boolean outcome = operand1 >= operand2; // outcome is `true`
```


```java
int operand1 = 0;
int operand2 = 0;
boolean outcome = operand1 >= operand2; // outcome is `true`
```








<!-- subtopic -->

### `==` Equal to
* `true` if left operand is equal to right operand, otherwise `false`.


```java
int operand1 = 0;
int operand2 = 1;
boolean outcome = operand1 == operand2; // outcome is `false`
```

```java
int operand1 = 1;
int operand2 = 0;
boolean outcome = operand1 == operand2; // outcome is `false`
```


```java
int operand1 = 0;
int operand2 = 0;
boolean outcome = operand1 == operand2; // outcome is `true`
```

















<!-- supertopic -->

### Increment / Decrement Operators









<!-- subtopic -->

### `++` Increment Operator
* `++` adds 1 to the variable preceding the operator

```java
int startingValue = 10;
startingValue++; // startingValue is `11`
```




<!-- subtopic -->

### `+=` Increment Operator
* `+=` modifies the operand to the left to by adding the operand to the right to it.

```java
int startingValue = 10;
startingValue += 5; // startingValue is `15`
```

```java
int startingValue = 10;
startingValue = startingValue + 5; // startingValue is `15`
```







<!-- subtopic -->

### `--` Decrement Operator
* `--` subtracts 1 from the variable preceding the operator
```java
int startingValue = 10;
startingValue--; // startingValue is `9`
```




<!-- subtopic -->

### `-=`, Decrement Operator
* `-=` modifies the operand to the left to by subtracting the operand to the right from it.
* the following blocks of code are behaviorally equivalent

```java
int startingValue = 10;
startingValue -= 5; // startingValue is `5`
```

```java
int startingValue = 10;
startingValue = startingValue - 5; // startingValue is `5`
```







<!-- supertopic -->

### Parentheses and Operator Hierarchy
## [Java order of operations](https://docs.oracle.com/javase/tutorial/java/nutsandbolts/operators.html)

* `a && b || c`
* means
* `(a && b) || c`

```java
4 + 5 * 8 == 44
(4 + 5) * 8 == 72
```

* `*`, `/` have higher precedence than `+`, `-`






Since += associates right to left, the expression

`a += b += c`

means

`a += (b += c)`
