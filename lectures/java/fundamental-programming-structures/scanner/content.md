# Types



## Overview
* What is Scanner
* How to create scanner
* How to read input from scanner
* How to not read input from scanner
* How to read integer from Scanner
* How to read Double from Scanner
* How to read any Object-Type using Scanner



### What is Scanner
* `Scanner` is a built-in java type that reads and returns input from a specified `InputStream`.
* Often, `Scanner` is used with an `InputStream` of `System.in` to allow us to read and return input directly typed from the System.

### How to create Scanner

```java
public class MainApplication {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
    }
}
```


### How to read input from scanner

```java
public class MainApplication {
    public static void main(String[] args) {
        OutputStream output = System.out;
        InputStream input = System.in;
        Scanner scanner = new Scanner(input);

        output.println("What is your first name?");
        String firstName = scanner.nextLine();

        output.println("What is your last name?");
        String lastName = scanner.nextLine();

        output.println("What is your email?");
        String name = scanner.nextLine();

        output.println("What is your age?");
        String age = scanner.nextLine();
    }
}
```


### How to not read input from scanner
* If the following information confuses you, just know this: `Scanner` is only useful for its `.nextLine()` method.
    * Aside from `scanner.nextLine()`, the methods defined within `Scanner` have some counter-intuitive behaviors.    
    * ↑ this means you should **not** use other `Scanner` methods unless you are positive about the appropriateness of their use.

#### `scanner.next()`
* the `scanner.next()` method **does not return the input from the nextline**.    
    * this method is tempting to use because intuitively, one would assume their "next input" would be whatever comes after pressing the `Enter` key.
    * Instead, `scanner.next()` will return any new input after _**it's** current_ cursor-position on the terminal.
    * ↑ this means a user can press the `Enter` key, but `scanner.next()` will not read the input on _next line_ until _**it's** cursor-position_ has reached that point, rather than the _**terminal's** cursor-position_.
    * How do synchronously move the cursor using `.next()`? Who cares! Don't use it.

#### `scanner.nextInt()`
* the `scanner.nextInt()` method **does not return the input from the nextline as an `int`**.
    * this method is tempting to use because intuitively, one would assume their "next `int`" would be whatever `int` comes after pressing the `Enter` key.
    * Instead, `scanner.nextInt()` will attempt to return new input after _**it's** current_ cursor-position on the terminal as an `int`.
    * How do synchronously move the cursor using `.next()`? Who cares! Don't use it.

#### `scanner.nextDouble()`
* the `scanner.nextDouble()` method **does not return the input from the nextline as an `Double`**.
    * this method is tempting to use because intuitively, one would assume their "next `Double`" would be whatever `Double` comes after pressing the `Enter` key.
    * Instead, `scanner.nextDouble()` will attempt to return new input after _**it's** current_ cursor-position on the terminal as an `Double`.
    * How do synchronously move the cursor using `.nextDouble()`? Who cares! Don't use it.    



### Refresher: How to read input from scanner

```java
public class MainApplication {
    public static void main(String[] args) {
        OutputStream output = System.out;
        InputStream input = System.in;
        Scanner scanner = new Scanner(input);

        output.println("What is your first name?");
        String firstName = scanner.nextLine();

        output.println("What is your last name?");
        String lastName = scanner.nextLine();

        output.println("What is your email?");
        String name = scanner.nextLine();

        output.println("What is your age?");
        String age = scanner.nextLine();
    }
}
```


### How to read `int` from scanner

```java
public class MainApplication {
    public static void main(String[] args) {
        OutputStream output = System.out;
        InputStream input = System.in;
        Scanner scanner = new Scanner(input);

        output.println("What is your age?");
        String ageAsString = scanner.nextLine();
        int age = Integer.parseInt(ageAsString);

        output.println("How many siblings do you have?");
        String siblingsAsString = scanner.nextLine();
        int siblings = Integer.parseInt(siblingsAsString);

        output.println("How many cousins do you have?")
        String cousinsAsString = scanner.nextLine();
        int cousins = Integer.parseInt(cousinsAsString);

        output.println("How many uncles do you have?")
        String unclesAsString = scanner.nextLine();
        int uncles = Integer.parseInt(unclesAsString);

        output.println("How many aunts do you have?")
        String auntsAsString = scanner.nextLine();
        int aunts = Integer.parseInt(auntsAsString);
    }
}
```

### How to read `double` from scanner

```java
public class MainApplication {
    public static void main(String[] args) {
        OutputStream output = System.out;
        InputStream input = System.in;
        Scanner scanner = new Scanner(input);

        output.println("What is your age?");
        String ageAsString = scanner.nextLine();
        double age = Double.parseDouble(ageAsString);

        output.println("What is 1/2 as a decimal?");
        String halfAsString = scanner.nextLine();
        double half = Double.parseDouble(halfAsString);

        output.println("What is 1/3 as a decimal?");
        String thirdAsString = scanner.nextLine();
        double third = Double.parseDouble(thirdAsString);

        output.println("What is 1/4 as a decimal?");
        String fourthAsString = scanner.nextLine();
        double fourth = Double.parseDouble(fourthAsString);
    }
}
```



### How to simplify `Scanner` use
* The following `IOConsole` class couples `Scanner`, `InputStream`, and `OutputStream` to allow us to more easily express the aforementioned codeblocks.

```java
public class IOConsole {
    private Scanner scanner;

    public IOConsole() {
        this.scanner = new Scanner(System.in);
    }

    public String getStringInput(String prompt) {
        System.out.println(prompt);
        String userInput = scanner.nextLine();
        return userInput;
    }

    public Double getDoubleInput(String prompt) {
        String userInputAsString = getStringInput(prompt);
        Double userInput = Double.parseDouble(userInputAsString);
        return userInput;
    }

    public Integer getIntegerInput(String prompt) {
        return getDoubleInput(prompt).intValue();
    }
    
}
```



### Refresher: How to read `String` from IOConsole

```java
public class MainApplication {
    public static void main(String[] args) {
        IOConsole console = new IOConsole();
        String firstName = console.getStringInput("What is your first name?");
        String lastName = console.getStringInput("What is your last name?");
        String email = console.getStringInput("What is your email?");
    }
}
```


### How to read `int` from IOConsole

```java
public class MainApplication {
    public static void main(String[] args) {
        IOConsole console = new IOConsole();
        int age = console.getIntegerInput("What is your age?");
        int siblings = console.getIntegerInput("How many siblings do you have?");
        int cousins = console.getIntegerInput("How many cousins do you have?")
        int uncles = console.getIntegerInput("How many uncles do you have?")
        int aunts = console.getIntegerInput("How many aunts do you have?")    
    }
}
```

### How to read `double` from IOConsole

```java
public class MainApplication {
    public static void main(String[] args) {
        IOConsole console = new IOConsole();
        double age = console.getDoubleInput("What is your age?");
        double half = console.getDoubleInput("What is 1/2 as a decimal?");    
        double third = console.getDoubleInput("What is 1/3 as a decimal?");
        double fourth = console.getDoubleInput("What is 1/4 as a decimal?");
    }
}
```