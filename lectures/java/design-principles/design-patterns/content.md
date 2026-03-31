# Design Patterns<br>and Principles


## What we'll cover
* What is a Design Pattern? 
* Four Essential Elements of a Pattern
* Classifying Design Patterns 
* Brief introduction to: 
  * Creational Patterns
  * Structural Patterns
  * Behavioral Patterns
	
 




# What is a Design Pattern?
* A pattern that arises from the means by which a set of objects communicate.
* A recognized & established way of solving a problem by object orientation patterns.
* A named solution to a problem in a context.
* Has been proven effective, stable, and scalable.
* Thoroughly tested strategies which have been proven effective, stable, and scalable.


# Purpose of a Design Pattern
* Assists with the design of a system.
* Establish vocabulary which communicates a problem, solution, and potential consequences
* This is true for chess and true for programming: Raw experience can teach you enough to play a fair game, but a master studies the game of past masters; Identify patterns of play.
	* Uncle Bob











# Four Essential Elements of a Pattern
1. Pattern Name
2. Problem
3. Solution
4. Consequences

# 1. Pattern name
* a word or two we can use to describe a design
	* problem
	* solution
	* consequence
* Naming increases design vocabulary
* Enables discussion and design at a higher level of abstraction.
* "Bisected Oval Pattern"

# 2. Problem
* Describes when to apply pattern
* Explains problem and its context
* Sometimes problems will include a list of conditions that must be met before it makes sense to apply the pattern.
* "Is our subject facing forward?"

# 3. Solution
* Describes the elements that make up the design, their relationships, responsibilities, and collaborations.
* Provides an abstract description of a design problem and how a general arrangement of elements solves it.
* "_Oval bisection_ allows early planning for placement of facial features"

# 4. Consequences
* The results and trade-offs of applying the pattern.
* Address memory, time, and language implementation issues.
* Include impact on a system's flexibilitiy, extensibility, portability.
* "Yields a forward facing portrait. Does not support profile portraits."








# Classifying Design Patterns
* 3 Major types of design patterns:
	* Creational - Defer part of object creation to another class
	* Structural - Composition of classes or objects
	* Behavioral - Characterize the ways in which classes or objects interact and distribute responsibility







<hr><hr>
<hr><hr>







# Creational Patterns
* Defers part of object creation to another class
* Some Examples:
  * Builder
	* Factory
	* Prototype


### Two Recurring Themes of Creational Patterns
1. They encapsulate knowledge about which concrete classes the system uses
	* Abstracts the instantiation process
2. Hide how instances of classes are created and put together
	* Helps make a system independent of how its objects are created, composed, or represented




<hr><hr>

## Creational Patterns: Builder
* Problem - Separate the construction of a complex object from its representation so that the same construction process can create different representations

### Brief Example
* Here, the `LicenseBuilder` is a _builder_ of `License` objects.
```java
public void demo() {
		License license = new LicenseBuilder()
            .setBirthDate(new Date()),
            .setName("John"),
            .setAddressLine1("123 Square Lane"),
            .setCity("Milford"),
            .setState("Delaware"),
            .setZipCode(19720);
            .setLicenseNumber(1238913312)
            .build();
}
```




## Creational Patterns: Factory
* Problem - Separate the construction of a complex object from its representation so that the same construction process can create different representations

### Brief Example
* Here, the `LicenseFactory` leverages a `LicenseBuilder` to produce instances of `License` objects.

```java
public class LicenseFactory {
  private LicenseBuilder builder;

  public LicenseFactory(LicenseBuilder builder) {
    this.builder = builder;
  }

  public License createLicense(String addressLine1, String addressLine2, String city, String state, String zipcode) {
      return builder
              .setAddressLine1(addressLine1)
              .setAddressLine2(addressLine2)
              .setCity(city)
              .setState(state)
              .setZipcode(zipcode)
              .createLicense();
  }
  public License createLicense(String firstName, String lastName, Date birthdate, Long licenseNumber) {
      return builder
              .setFirstName(firstName)
              .setLastName(lastName)
              .setBirthDate(birthdate)
              .setLicenseNumber(licenseNumber)
              .createLicense();
  }
}
```


<hr><hr>

## Prototype Design Pattern

### Description
* Problem
  * Need to create multiple instances of objects with similar properties and behavior.
  * Want to avoid the overhead of creating new objects from scratch each time.
  * Need a way to clone existing objects to create new objects with the same properties and behavior.
* Solution
  * Define a prototype object that serves as a template for creating new objects.
  * Clone the prototype object to create new objects with the same properties and behavior.
  * Use a copy or clone operation to create new objects instead of creating them from scratch.
* Consequences
  * Allows for efficient creation of new objects with similar properties and behavior.
  * Reduces the need to instantiate objects from scratch, saving time and resources.
  * Can improve performance and memory usage in situations where creating new objects is expensive.
  * Provides flexibility in creating objects with different configurations or states based on the prototype object.
  * May require careful handling of mutable objects to avoid unintended changes in cloned objects.


### Brief Example

```java
public class LicenseBuilder {
    private Date birthDate;
    private String firstName;
    private String lastName;
    private Long licenseNumber;
    private Character driverClass;
    private String addressLine1;
    private String addressLine2;
    private String city;
    private String state;
    private String zipcode;

    public LicenseBuilder(LicenseBuilder licenseBuilderToBeCloned) {
        this.firstName = licenseBuilderToBeCloned.firstName;
        this.lastName = licenseBuilderToBeCloned.lastName;
        this.birthDate = licenseBuilderToBeCloned.birthDate;
        this.licenseNumber = licenseBuilderToBeCloned.licenseNumber;
        this.driverClass = licenseBuilderToBeCloned.driverClass;
        this.addressLine1 = licenseBuilderToBeCloned.addressLine1;
        this.addressLine2 = licenseBuilderToBeCloned.addressLine2;
        this.city = licenseBuilderToBeCloned.city;
        this.state = licenseBuilderToBeCloned.state;
        this.zipcode = licenseBuilderToBeCloned.zipcode;
    }
}
```

<hr><hr>
<hr><hr>


# Structural Patterns
* Concerned with how classes and objects are composed to form larger structures
* Structural _class_ patterns use inheritance to compose interfaces or implementations.
* Some examples:
	* Decorator
	* Adapter
	* Proxy

## Brief Example
* Ensures that a _new instance_ of type `T` wraps the behavior of a _pre-existing_ instance of type `T`.
	* This allows the _pre existing_ instance to gain functionality during run-time rather than creating an explicit subclass.
```java
public void demo() {
	CasinoPlayerProfile player = ProfileManager.getCurrentPlayer();
	CasinoPlayerProfile blackJackPlayer = new BlackJackPlayer(player);
	blackJackPlayer.increaseProfileBalance(100);
}
```



## Behavioral Patterns
* Characterize the ways in which classes or objects interact and distribute responsibility.
* Concerned with algorithms and the assignment of responsibilities between objects
* Describes object / class patterns as well as the resulting communication patterns between them
* Some Examples:
	* Template
	* Observer
	* Command

### Template Pattern
* Create a method of high freedom to be used by a method of lower freedom
	* The degree of freedom is determined by the number of arguments passed into the method


### Example
```java
// degree of 1
public static Integer[] getRange(int start) {
    return getRange(0, start, 1);
}
// degree of 2
public static Integer[] getRange(int start, int stop) {
    return getRange(start, stop, 1);
}
// template method; degree of 3
public static Integer[] getRange(int start, int stop, int step) {
    List<Integer> list = new ArrayList<>();
    for(int i = start; i<stop; i+=step) {
        list.add(i);
    }
    return list.toArray(new Integer[list.size()]);
}
```