# Loops

#### `while` loop

* executes a statement _while_ a condition is `true`
* The while loop will never execute if the condition is false at the outset

```java
public static void main(String[] args) {
    Integer randomValue = ThreadLocalRandom.current().nextInt(0, 2);
    Boolean condition = randomValue == 1;
    while(condition) {
        randomValue = ThreadLocalRandom.current().nextInt(0, 2);
        System.out.println("The value was 1");
    }
}
```


#### `do`/`while` loop

* to ensure a code block is executed at least once, use a `do`/`while` loop.

```java
public static void main(String[] args) {    
    Boolean condition;
    do {
        Integer randomValue = ThreadLocalRandom.current().nextInt(0, 2);
        System.out.println("The value was 1");
        condition = randomValue == 1;
    } while(condition);
}
```

#### Determinate Loops
* The `for` loop is a general construct to support iteration controlled by a _counter_ or similar variable that is updated after every iteration.


* `for` loop expression

```java
for (int counter = 0; counter < 10; counter++) {
    System.out.println(counter);
}
```

* `while` loop equivalent


```java
int counter = 0
while(counter < 10) {
    System.out.println(counter);
    counter++
}
```


### Nested Loops
* Loops can be nested. However, be wary of variable scoping


* Invalid variable scoping

```java
for(int i = 0; i < 5; i++) {
    // variable `i` cannot be redeclared in the same scope
    for(int i = 0; i < 5; i++) {
        System.out.println(i);
    }
}
```

* Valid variable scoping

```java
for(int i = 0; i < 5; i++) {
    for(int j = 0; j < 5; j++) {
        System.out.println(j);
    }
}
```



### Statements That Break Control Flow

The same break statement that you use to exit a switch can also be used to break out of a loop

```java
public static void main(String[] args) {
    Double interestRate = 0.01;
    Double balance = 20000D;
    Double payment = 200D;
    Double years = 0D;
    while (years <= 100) {
        balance += payment;
        double interest = balance * interestRate / 100;
        balance += interest;
        if (balance >= goal) {
            break;
        }
        years++;
    }
```


The continue statement transfers control to the header of the innermost enclosing loop

```java
public static void main(String[] args) {
    Scanner userInputGrabber = new Scanner(System.in);
    Integer goal = 1000;
    Integer sum = 0;
    while (sum < goal) {
        System.out.print("Enter a number: ");
        String userInput = userInputGrabber.nextInt();
        Integer userInputAsInteger = Integer.parseInt(userInput);
        if (userInputAsInteger < 0) {
            continue;
        }
        sum += userInputAsInteger; // not executed if n < 0
    }
}
```
