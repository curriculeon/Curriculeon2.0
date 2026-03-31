# Creational Patterns
* Defers part of object creation to another class
* Overview
  * Builder
  * Factory
  * Prototype


### Two Recurring Themes of Creational Patterns
1. They encapsulate knowledge about which concrete classes the system uses
	* Abstracts the instantiation process
2. Hide how instances of classes are created and put together
	* Helps make a system independent of how its objects are created, composed, or represented




<hr><hr>


## Builder

#### Problem
* Separate the construction of a complex object from its representation so that the same construction process can create different representations
#### Solution
* encapsulates the construction logic and provides methods to set different attributes or configurations of the object.
#### Consequences
* improves the readability and maintainability of code by separating the construction logic from the object's class, allowing for easy modification and extension of object construction processes.
* However, it may result in more code and complexity due to the additional builder class, and may not be suitable for simple object construction scenarios.

### Brief Example

<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./1_creational-design-patterns.mp4">
</video>


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




<hr>

## Factory

#### Problem
* Separate the construction of a complex object from its representation so that the same construction process can create different representations

### Brief Example


<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./2_creational-design-patterns.mp4">
</video>


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




<hr>


## Prototype Design Pattern

#### Problem
* Need to create multiple instances of objects with similar properties and behavior.
* Want to avoid the overhead of creating new objects from scratch each time.
* Need a way to clone existing objects to create new objects with the same properties and behavior.

#### Solution
* Define a prototype object that serves as a template for creating new objects.
* Clone the prototype object to create new objects with the same properties and behavior.
* Use a copy or clone operation to create new objects instead of creating them from scratch.

#### Consequences
* Allows for efficient creation of new objects with similar properties and behavior.
* Reduces the need to instantiate objects from scratch, saving time and resources.
* Can improve performance and memory usage in situations where creating new objects is expensive.
* Provides flexibility in creating objects with different configurations or states based on the prototype object.
* May require careful handling of mutable objects to avoid unintended changes in cloned objects.


### Brief Example

<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./3_creational-design-patterns.mp4">
</video>

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

## Summary

<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./4_creational-design-patterns.mp4">
</video>