# Operators









## Overview
* Operators
* Arithmetic Operators
* String Operators
* Logical Operators
* Relational Operators
* Parenthesis and Operator Hierarchy



### Operators
* An _operator_ is a symbol which denotes a _function_ to be done.
* An operator is followed by at least one _operand_.
* _operands_ are the _value_ (literal or variable) being _operated_ on.
















<!------------------------------------------------------------------------------->
<!------------------------------ arithmetic operators --------------------------->
<!------------------------------------------------------------------------------->

### the 5 Arithmetic Operators
1. `=` assignment
2. `+` addition
3. `-` subtraction
4. `*` multiplication
5. `/` division
6. `%` modulo



#### Assignment Operator `=`
* The assignment operator has two operands:
    * The variable name
    * The variable value



#### Addition Operator `+`
* The addition _operator_ has two _operands_:
    * _augend_ is the base value
    * _addend_ is the value to add to the base value
* By _adding_ values, we obtain a _sum_.

```javascript
let augend = 5;
let addend = 10;
let sum = augend + addend; // `sum` is 15
```





#### Subtraction Operator `-`
* The subtraction _operator_ has two _operands_:
    * _minuend_ is the base value
    * _subtrahend_ is the value to remove from the base value
* By _subtracting_ values, we obtain a _difference_.

```javascript
let minuend = 15;
let subtrahend = 10;
let difference = minuend - subtrahend // `difference` is 5
```





#### Multiplication Operator `*`
* The multiplication _operator_ has two _operands_:
    * _multiplicand_ is the base value
    * _multiplier_ is the number of _times_ we increment the _base value_.
* By _multiplying_ values, we obtain a _product_.

```javascript
let multiplicand = 5;
let multiplier = 10;
let product = multiplicand * multiplier // `product` is 50
```







#### Division Operator `/`
* The divison _operator_ has two _operands_:
    * _dividend_ is the base value
    * _divisor_ is the value to remove from the base value
* By _dividing_ values, we obtain a _quotient_.

```javascript
let dividend = 10
let divisor = 5
let quotient = dividend + divisor // `quotient` is 2
```






#### Modulo Operator `%`
* The modulo _operator_ has two _operands_:
    * _dividend_ is the base value
    * _divisor_ is the value to remove from the base value
* By _modding_ values, we obtain a _remainder_.

```javascript
let dividend = 10
let divisor = 5
let remainder = dividend + divisor // `quotient` is 2
```





















<!------------------------------------------------------------------------------->
<!------------------------------ String operators ------------------------------>
<!------------------------------------------------------------------------------->


## the 2 string operators





#### the concatenation operator,  `+`
* The concatenation _operator_ has two _operands_ which we will refer to as `body` and `appendage`:
    * _body_ is the string to be _appended_ to.
    * _appendage_ is the string to be _appended_.

```javascript
let body = "Hello ";
let appendage = "World";
let result = body + appendage;
```


#### the multiplication operator, `*`
* String multiplication _operator_ has two _operands_:
    * _multiplicand_ is the base value, and it must of `str` type.
    * _multiplier_ is the number of _times_ we increment the _base value_, and it must a _numeric type_.
* By _multiplying_ values, we obtain a _product_.

```javascript
let multiplicand = "abc";
let multiplier = 3;
let product = multiplicand * multiplier # `product` is "abcabcabc";
```

















<!------------------------------------------------------------------------------->
<!------------------------------ logical operators ------------------------------>
<!------------------------------------------------------------------------------->


## the 6 Logical Operators
1. `not` _conditional_ negation
2. `and` _conditional_ and
3. `or` _conditional_ or







#### the _unary_ `not` operator
* Returns true if the operand to the right evaluates to false.
* Returns false if the operand to the right is true.

```javascript
let rightOperand = true;
let outcome = not rightOperand # outcome is `false`;
```


```javascript
let rightOperand = false;
let outcome = not rightOperand # outcome is `true`;
```








#### the _binary_ `and` operator
* Returns true if both of the operands evaluate to true.
* Both operands are evaluated before the `and` operator is applied.
* The following code blocks have identical behavior in all cases


```javascript
let doorIsUnlocked = door.isUnlocked();
let doorIsOpen = door.isOpen();
let canWalkThroughDoor = doorIsUnlocked and doorIsOpen;
```

* if `door` is not unlocked, then continue to evaluate if door is open









#### the _binary_ `&&` operator
* Expression resolves to `true` if both of the operands evaluate to `true`.
* if the operand on the left returns `false`, the operation resolves to `false` without evaluating the operand on the right.



##### Example

* The following code blocks have identical behavior in all cases

```javascript
let canWalkThroughDoor = door.isUnlocked() and door.isOpen()
```

```javascript
let canWalkThroughDoor = false
if(door.isUnlocked()){
    if(door.isOpen()) {
        canWalkThroughDoor = true
    }
}
```












#### the _binary_ `or` operator
* Returns `true` if at least one of the operands evaluates to true.
* Both operands are evaluated before the `or` operator is applied.


```javascript
let doorIsUnlocked = door.isUnlocked();
let doorIsOpen = door.isOpen();
let canWalkThroughDoor = doorIsUnlocked or doorIsOpen;
```

* if `door` is not unlocked, then continue to evaluate if door is open








#### the _binary_ `or` operator
* Expression resolves to `true` if one of the operands evaluate to `true`.
* if left operand is `true`, the operation resolves to `true` without evaluating the operand on the right.




#### the _binary_ `||` operator
#### Example
* The following code blocks have identical behavior in all cases

```javascript
let canWalkThroughDoor = door.isUnlocked() || door.isOpen();
```

```javascript
let canWalkThroughDoor = false;

if(door.isUnlocked()){
    canWalkThroughDoor = true;
}

if(door.isOpen()){
    canWalkThroughDoor = true; 
}
```




























<!------------------------------------------------------------------------------->
<!------------------------------ relational operators --------------------------->
<!------------------------------------------------------------------------------->


## Relational Operators
* there are 6 relational operators that compare two numbers and return a value.





### the 6 Relational Operators
1. `<` _less than_
2. `>` _greater than_
3. `<=` _less than or equal to_
4. `>=` _greater than or equal to_
5. `==` _equal to_
6. `!=` _not equal to_


### Relational Operators
* Each operand is a numeric or _boolean_ value.
* _Boolean_ values are either _true_ or _false_.
* The result of a relational operation is a _boolean_ value. 



### `<` Less than
* `true` if left operand is less than right operand, otherwise `false`.

```javascript
operand1 = 0
operand2 = 1
outcome = operand1 < operand2 # outcome is `true`
```

```javascript
operand1 = 1
operand2 = 0
outcome = operand1 < operand2 # outcome is `false`
```





### `>` Greater than
* `true` if left operand is greater than right operand, otherwise `false`.

```javascript
operand1 = 1
operand2 = 0
outcome = operand1 > operand2 # outcome is `true`
```

```javascript
operand1 = 0
operand2 = 1
outcome = operand1 > operand2 # outcome is `false`
```




### `<=` Less than or equal to
* `true` if left operand is less than or equal to right operand, otherwise `false`.


```javascript
operand1 = 0
operand2 = 1
outcome = operand1 <= operand2 # outcome is `true`
```

```javascript
operand1 = 1
operand2 = 0
outcome = operand1 <= operand2 # outcome is `false`
```


```javascript
operand1 = 0
operand2 = 0
outcome = operand1 <= operand2 # outcome is `true`
```




### `>=` Greater than or equal to
* `true` if left operand is greatre than or equal to right operand, otherwise `false`.


```javascript
operand1 = 0
operand2 = 1
outcome = operand1 >= operand2 # outcome is `false`
```

```javascript
operand1 = 1
operand2 = 0
outcome = operand1 >= operand2 # outcome is `true`
```


```javascript
operand1 = 0
operand2 = 0
outcome = operand1 >= operand2 # outcome is `true`
```






### `==` Equal to
* `true` if left operand is equal to right operand, otherwise `false`.


```javascript
operand1 = 0
operand2 = 1
outcome = operand1 == operand2 # outcome is `false`
```

```javascript
operand1 = 1
operand2 = 0
outcome = operand1 == operand2 # outcome is `false`
```


```javascript
operand1 = 0
operand2 = 0
outcome = operand1 == operand2 # outcome is `true`
```















### Increment / Decrement Operators







### `+=` Increment Operator
* `+=` modifies the operand to the left to by adding the operand to the right to it.

```javascript
startingValue = 10
startingValue += 5 # startingValue is `15`
```

```javascript
startingValue = 10
startingValue = startingValue + 5 # startingValue is `15`
```





### `-=`, Decrement Operator
* `-=` modifies the operand to the left to by subtracting the operand to the right from it.
* the following blocks of code are behaviorally equivalent

```javascript
startingValue = 10
startingValue -= 5 # startingValue is `5`
```

```javascript
startingValue = 10
startingValue = startingValue - 5 # startingValue is `5`
```





### Parentheses and Operator Hierarchy

* `a and b or c`
* means
* `(a and b) or c`

```javascript
4 + 5 * 8 == 44
(4 + 5) * 8 == 72
```

* `*`, `/` have higher precedence than `+`, `-`






Since += associates right to left, the expression

`a += b += c`

means

`a += (b += c)`
