# Test Driven Development
## Abstracting Clauses










## Lecture Overview
* Creating a Simple Test
* Single-class per method testing
* Single-package per class testing














### Creating a simple Test
* Consider a single `Die` class representative of throwing `Die`.

```java
public class Die {
    private Integer numberOfFaces;
    private Integer currentFaceValue;

    public Die(Integer numberOfFaces) {
        this.numberOfFaces = numberOfFaces;
    }

    public void roll() {
        ThreadLocalRandom randomNumberGenerator = ThreadLocalRandom.current();
        Integer randomFaceValue = randomNumberGenerator.nextInt(1, numberOfFaces);
        this.currentFaceValue = randomFaceValue;
    }

    public Integer getCurrentFaceValue() {
        return currentFaceValue;
    }

    public Integer getNumberOfFaces() {
        return numberOfFaces;
    }
}
```






### Simple-Test Pattern
* To test this class, intuition may tell you to create a `DieTest` class.
    * The `DieTest` class would likely have at least 2 methods
        * `DieTest.testRoll()`
        * `DieTest.testConstructor()`


### Simple-Test Pattern
* Testing constructor

```java
public class DieTest {
    @Test
    public void testConstructor() {
        // given
        Integer expectedFaceValue = null;
        Integer expectedNumberOfFaces = null;

        // when
        Die die = new Die(expectedNumberOfFaces);
        Integer actualFaceValue = die.getCurrentFaceValue();
        Integer actualNumberOfFaces = die.getNumberOfFaces();

        // then
        Assert.assertEquals(expectedFaceValue, actualFaceValue);
        Assert.assertEquals(expectedNumberOfFaces, actualNumberOfFaces);
    }
}
```



### Simple-Test Pattern
* Testing roll

```java
public class DieTest {
    @Test
    public void testRoll() {
        // given
        Integer numberOfFaces = 2;
        Integer unexpected = null;
        Die die = new Die(numberOfFaces);

        // when
        die.roll();
        Integer actual = die.getCurrentFaceValue();
        Boolean conformsToUpperBound = actual <= numberOfFaces;
        Boolean conformsToLowerBound = actual > 0;
    
        // then
        Assert.assertNotEquals(unexpected, actual);
        Assert.assertTrue(conformsToUpperBound);
        Assert.assertTrue(conformsToLowerBound);
    }
}
```



### Issues With this Pattern
* Consider that the constructor can consume any value. Thus, we should be adamant about testing many values for the constructor to ensure we have optimal coverage.
* By creating several variations of `testConstructor` in the `DieTest` class, we begin to bloat the `DieTest` and violate _Single Responsibility Principle_.
    * **Note: Any number of method-definitions greater than 3 is a violation of the _Rule Of Three_ paradigm.**



### Issues With this Pattern
* Consider that the `roll` can change mutate `Die` to any number of potential states. Thus, we should be adamant about creating many tests for `roll`, to ensure we have optimal coverage.
* By creating several variations of `testRoll` in the `DieTest` class, we begin to bloat the `DieTest` and violate _Single Responsibility Principle_.
    * **Note: Any number of method-definitions greater than 3 is a violation of the _Rule Of Three_ paradigm.**









### Resolving Bloat
* We can resolve these issues by better abiding by SRP.


### Resolving Class-Bloat
* For every method to be tested, a separate test-class should be created.
    * The `roll` method of the `Die` class should be tested by a `RollTest`
    * The `constructor` of the `Die` class should be tested by a `ConstructorTest`


### Resolving Package-Bloat
* For every class to be tested, a separate test-package should be created.
    * The `RollTest` class should be local to a `dietest` package
    * The `ConstructorTest` class should be local to a `dietest` package



### Beginning Abstraction
* To begin abstracting a test method, identify the _variable_ values.
* Abstract these variables as method-parameters.
* Create a private [template method](https://refactoring.guru/design-patterns/template-method) which defines the _skeleton_ of the testing-algorithm.




### Abstracting a Test Method
* When testing constructor, the variable value is `expectedNumberOfFaces`.

```java
public class ConstructorTest {
    // template method
    private void test(Integer expectedNumberOfFaces) {
        Integer expectedFaceValue = null;

        // when
        Die die = new Die(expectedNumberOfFaces);
        Integer actualFaceValue = die.getCurrentFaceValue();
        Integer actualNumberOfFaces = die.getNumberOfFaces();

        // then
        Assert.assertEquals(expectedFaceValue, actualFaceValue);
        Assert.assertEquals(expectedNumberOfFaces, actualNumberOfFaces);
    }

    @Test
    public void test0() { test(3); }

    @Test
    public void test1() { test(4); }

    @Test
    public void test2() { test(6); }
}
```




### Abstracting a Test Method
* When testing `roll`, the variable value is `numberOfFaces`.

```java
public class RollTest {
    // template-method definition
    private void test(Integer numberOfFaces) {
        // given
        Integer unexpected = null;
        Die die = new Die(numberOfFaces);

        // when
        die.roll();
        Integer actual = die.getCurrentFaceValue();
        Boolean conformsToUpperBound = actual <= numberOfFaces;
        Boolean conformsToLowerBound = actual > 0;
    
        // then
        Assert.assertNotEquals(unexpected, actual);
        Assert.assertTrue(conformsToUpperBound);
        Assert.assertTrue(conformsToLowerBound);
    }

    @Test
    public void test0() { test(2); }

    @Test
    public void test1() { test(3); }

    @Test(expected=NullPointerException.class)
    public void test2() { test(null); }
}
```






### Summary
* As more test-cases for each method is considered, we can add a new call to the template method with the respective arguments.
* This avoids enforcement of `WET` principle, ensuring that each test-case is following an identical test-algorithm.

