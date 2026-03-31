# Test Driven Development - Shortcomings of God-Object Design










## Lecture Overview
* Untestable God-Object Design
* Converting from Untestable God-Object Design to Testable Divide-And-Conquer Design
* Testing a Divide-And-Conquer Designic Structure













#### God-Object Antipatterns
##### Shortcomings of God-Object Design
* God-Object structures can **only** be tested by running the entire application.
    * God-Object structures do not support testing of individual behaviors
* God-Object structures often _add implementation_ without _adding behavior_.
* _Behaviors_ are independently testable units code.
* TDD ensures behaviors are established prior to implementation
    * enforces the existence of a behavior




#### Untestable God-Object Design Example
* The program below can only be tested manually by a user of the application
* The program below does not allow us to created automated tests for different inputs

```java
public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    String[] invalidCharArray = "!@#$%^&*()".split("");
    List<String> invalidChars =Arrays.asList(invalidCharArray);

    System.out.println("Create a username:");
    String userName = scanner.nextLine();
    String[] userNameCharacterArray = userName.split("");
    for(String currentCharacter : userNameCharacterArray) {
        if(invalidChars.contains(currentCharacter)) {
            System.out.println("Invalid username!");
            return;
        }
    }
    System.out.println("Username is valid!");
}
```






#### Converting from God-Object Design to Divide-And-Conquer Design
#### Part 1
* We begin by first _decoupling_ the _behaviors_ of the application
* Here, we abstract validation logic to separate method
* This allows us to later call the method in a test to ensure our validation algorithm works as expected.

```java
public static Boolean isValid(String userName) {
    String[] invalidCharArray = "!@#$%^&*()".split("");
    List<String> invalidChars = Arrays.asList(invalidCharArray);
    String[] userNameCharacterArray = userName.split("");
    for (String currentCharacter : userNameCharacterArray) {
        if (invalidChars.contains(currentCharacter)) {
            System.out.println("Invalid username!");
            return false;
        }
    }
}
```




#### Converting from God-Object Design to Divide-And-Conquer Design
#### Part 2
* Here, we replace our tightly-coupled validation logic with a method call to our `isValid` method.

```java
public static void main(String[] args) {
    Scanner scanner = new Scanner(System.in);
    System.out.println("Create a username:");
    String userName = scanner.nextLine();
    if (isValid(userName)) {
        System.out.println("Username is valid!");
    }
}
```









### Positive and Negative Testing
* There are two main testing strategies in software testing: positive testing and negative testing.
* Positive testing determines that your application works as expected.
* Negative testing ensures that your application can gracefully handle invalid input or unexpected user behavior.





#### Positive Testing a Divide-And-Conquer Design
* Here, we ensure that our application returns `true` upon invoking `isValid` with a `String` whose value contains no special-characters

```java
public class MainApplicationTest {
    @Test
    public void test1() {
        Assert.assertTrue(MainApplication.isValid("fred"));
    }

    @Test
    public void test2() {
        Assert.assertTrue(MainApplication.isValid("John"));
    }

    @Test
    public void test3() {
        Assert.assertTrue(MainApplication.isValid("George"));
    }
}
```




#### Negative Testing a Divide-And-Conquer Design
* Here, we ensure that our application returns `false` upon invoking `isValid` with a `String` whose value contains special-characters

```java
public class MainApplicationTest {
    @Test
    public void test1() {
        Assert.assertFalse(MainApplication.isValid("Freddy!"));
    }

    @Test
    public void test2() {
        Assert.assertFalse(MainApplication.isValid("@perscholas"));
    }

    @Test
    public void test3() {
        Assert.assertFalse(MainApplication.isValid("$500.50"));
    }
}
```














#### TDD Behavior Enforcement
* Writing tests for a particular behavior ensures:
    * the _interface_ for a particular behavior exists in the application, regardless of whether it has been implemented.
    * that the implementation of a behavior of an entity can be altered and retested for validity.
    * a client can view potential use-cases of an individual behavior of an application