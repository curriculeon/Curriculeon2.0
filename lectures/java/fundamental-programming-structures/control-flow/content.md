
# Control Flow


## What we'll cover
* Block Scope
* Conditional Statements
* Loops
* Switch Statements



### Block Scope
* A block or compound statement consists of a number of statements, surrounded by a pair of braces.
* Blocks define the scope of your variables.
* Blocks can be nested

```java
public static void main(String[] args)
{
    { // this is the scope within which `someUnreachableValue` is defined
        String someUnreachableValue = "This value cannot be reached outside the scope";
    } //  `someUnreachableValue` is not accessible beyond this line
    System.out.println(someUnreachableValue); // compile-time exception
}
```



### Naming Conflicts

* You cannot declare identically named variables in two nested blocks

```java
public static void main(String[] args)
{  // this is the scope within which `uniqueVariableName` is defined
    String uniqueVariableName = "We cannot re-declare this variable name";
    { // cannot re-declare variable `uniqueVariableName` in inner scope
        String uniqueVariableName; // compile-time exception
    }
}
```


### Conditional Statements

#### If Statements; General Syntax
* The argument of the `if` clause must be a `boolean` value.
    * the value of `condition` in the example below must be of type `boolean`.
* Execution of an `if` condition is called a _check_ or _evaluation_.
* The body of an `if` statement only executes if the value of the `condition` has a value of `true`.
* Control structure code creates branches, or different paths that the code can take.


```java
public static void main(String[] args)
{
    Scanner userInputGrabber = new Scanner(System.in);
    String userInputPrompt = "Enter your age";
    String userInput = userInputGrabber.nextLine();
    Integer userAge = Integer.parseInt(userInput);
    Integer requiredAge = 18;
    if(userAge >= requiredAge) {
        System.out.println("You are old enough to use the application");
    }
}
```


#### If Statements; Example

```java
public static void main(String[] args) {
    Scanner userInputGrabber = new Scanner(System.in);
    String userInputPrompt = "Enter your age";
    String userInput = userInputGrabber.nextLine();
    Integer userAge = Integer.parseInt(userInput);
    Integer requiredAge = 18;
    if(userAge >= requiredAge) {
        System.out.println("You are old enough to use the application");
    }
}
```




#### `if`/`else` Statements; General Syntax
* `If/Else` statements are used when you would like to execute one block or the other, but never both blocks.
* `If` statements **do not have to be** followed with an `else` statement
* `Else` statements **have to be** preceded with an `if` statement.

```java
public static void main(String[] args) {
    Integer randomValue = java.util.concurrent.ThreadLocalRandom.current().nextInt(0, 2);
    Boolean condition = randomValue == 1;
    if(condition) {
        System.out.println("The value was 1");
    } else {
        System.out.println("The value was 0");
    }
}
```



#### `if`/`else if` Statements; Example
* `if/else if` statements are used when you would like to execute one of several blocks, given that at least one condition prior to the `else if` _check_ is `false`.
* `if` statements **do not have to be** paired with an `else if` statemenst
* `else if` statements **have to be** preceded by an `if` statements or `else if` statements.
* `else if` blocks can only execute if the value of all `condition`s have a value of `false`.

```java
public static void main(String[] args) {
    Scanner userInputGrabber = new Scanner(System.in);
    String userInputPrompt = "Enter your age";
    String userInput = userInputGrabber.nextLine();
    Integer userAge = Integer.parseInt(userInput);
    Integer requiredAge = 18;
    if(userAge > requiredAge) {
        System.out.println("Your age is greater than the required age");
    } else if (userAge == requiredAge) {
        System.out.println("Your age is equal than the required age");
    }
}
```










#### `if`/`else if`/`else` Statements; Example


```java
public static void main(String[] args) {
    Scanner userInputGrabber = new Scanner(System.in);
    String userInputPrompt = "Enter your age";
    String userInput = userInputGrabber.nextLine();
    Integer userAge = Integer.parseInt(userInput);
    Integer requiredAge = 18;
    if(userAge > requiredAge) {
        System.out.println("Your age is greater than the required age");
    } else if (userAge == requiredAge) {
        System.out.println("Your age is equal than the required age");
    } else {
        System.out.println("Your age is less than the required age");
    }
}
```


## Multiple Selections - The switch Statement




```java
public static void main(String[] args) {
    Scanner userInputGrabber = new Scanner(System.in);
    String userInputPrompt = "Enter your age";
    String userInput = userInputGrabber.nextLine();
    Integer userAge = Integer.parseInt(userInput);
    switch(userAge) {
        case 15:
            System.out.println("Teenagers cannot use this application!");
            break;

        case 12:
            System.out.println("Preteens cannot use this application!");
            break;

        case 4:
            System.out.println("Children cannot use this application!");
            break;

        case 0:
            System.out.println("Babies cannot use this application!");
            break;

        default:
            System.out.println("Welcome to my application!");
    }
}
```

#### Cascading `switch` conditions

* `case` statements without breaks can cascade functions to the next `case`.


```java
public static void main(String[] args) {
    Scanner userInputGrabber = new Scanner(System.in);
    String userInputPrompt = "Enter your age";
    String userInput = userInputGrabber.nextLine();
    Integer userAge = Integer.parseInt(userInput);
    switch(userAge) {
        case 15:
            System.out.println("Teenagers cannot use this application!");

        case 12:
            System.out.println("Preteens cannot use this application!");

        case 4:
            System.out.println("Children cannot use this application!");

        case 0:
            System.out.println("Babies cannot use this application!");
            break;

        default:
            System.out.println("Welcome to my application!");
    }
}
```


### Case labels
* A _case label_ can be used to gain better control over a `switch`/`case` or `loop` control-structure.
