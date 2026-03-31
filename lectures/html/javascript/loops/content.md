# Loops
* A loop is a block of instruction(s) that repeats multiple times as long as a condition is true.
* The intent of a loop is to re-execute the same lines of code several times in a program






## While Loop
* The while loop is used to repeat a section of code an unknown number of times until a specific condition is met

#### While Loop General Syntax

```javascript
while(condition) {
    // do stuff here
}
```

#### While Loop Example

* Script


```javascript
i = 0
while(i < 5){
    console.log("Hello")
    i += 1
}
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

#### Example

* Script

```javascript
let sequence = ["The", "Quick", "Brown", "Fox", "Jumps"];
for(let i=0; i<sequence.length; i++) {
    currentItem = sequence[i];
    console.log(currentItem)
}
```


* Output

```
The
Quick
Brown
Fox
Jumps
```





## Break statement

* The same `break` statement is used to exit out of a loop


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


* The `pass` statement transfers control to the header of the innermost enclosing loop

```javascript
while (sum < goal){
    userInputAsString = prompt("Enter a number: ")
    userInputAsInteger = parseInt(userInputAsString)
    if (userInputAsInteger < 0){
        continue
    }
    sum = sum + n // not executed if n < 0
}
```




## Nested Loops
* Loops defined within loops are called _nested loops_.


```javascript
for(let i=0; i<3; i++){
    console.log(i);
    for(let j=0; j<5; j++){
        print(j)
    }
}
```
