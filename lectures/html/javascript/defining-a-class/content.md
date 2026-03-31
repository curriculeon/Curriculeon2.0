# Introduction to Object Oriented Programming

## Overview
* Procedural programming vs. OOP
* Classes
* Encapsulation
* Relationships between classes
* Objects and Instance variables
* Single responsibility
* Methods
* Object Construction
* Mutators & Accessors




## What is procedural programming?
* Procedural (structured) programming consists of designing a set of procedures (algorithms) to solve a problem.
* The procedural paradigm suggests that a programmer will:
	* firstly, identify _which algorithms_ to manipulate data
	* secondly, identify _which structures_ use which algorithms.


#### Why do we use procedural programming?
* **Small** problems are easily resolved with a procedural implementation


#### Why do we not use procedural programming?
* Procedural implementations scale poorly.
* As the program grows in size, its complexity increases.
	* behaviors become tightly-coupled
	* debugging becomes more difficult
	* code-changes and maintenance becomes more difficult
	* testing a single aspect becomes nearly impossible

#### Why do we use OOP?
* **Large** problems can more be more easily scaled using the OOP paradigm.
* OOP allows users to break problem down into small logical objects
* OOP allows users to view code-details within the context of a specific object
* OOP allows users to more easily debug code
* OOP allows greater testability of code



#### Object Oriented Programming (OOP)
* An object-oriented program is made of objects
* Each object has specific functionalities, which users access via the object's **methods**.
* The OOP paradigm suggests that a programmer will
	* firstly identify *which structures* to manipulate data
	* secondly identify *what algorithms* each structure will use



#### The 3 aspects of an object
* **Identity** - **What is its location?**
	* How is that object distinguished from other objects of the same type?
* **State** - **What does it store?**
	* What is the value of the internal objects this object contains?
* **Behavior** - **How does it act?**
	* What services or actions this object can perform?



<hr><hr>

## Classes
* A **class** is a template, or blueprint from which objects are made
	* it is the cookie-cutter to a cookie
	* it is the _classification_ of an object.


#### Class naming conventions
* Class names must begin with a letter followed by any combination of letters, digits, and underscores.
  * By convention, class names start with a capital letter.
	* You cannot use a Java _reserved word_ to name a variable or class.
* Whitespace is irrelevant to the Java compiler


<hr><hr>

## Encapulsation
* Classes *encapsulate* several **data-fields** and behaviors into a single entity.
* **Encapsulation** is combining class-members (methods and variables) in a single scope.




## Encapsulation
* "Wraps" several data fields into a single entity


#### Sample

* Script

```javascript
class Person{ // class signature
    // constructor
    constructor(firstName, lastName, age){
        this.firstName = firstName;
        this.lastName = lastName;
    }
}
```


* Usage

```javascript
let leon = new Person("Leon", "Hunter", 27);
```


* Output

```
```






### Instance-Functions (Methods)
* behaviors of an object are made available to users via the object's **methods**
* methods which are invoked on an **object** are **instance-methods**
* method-names should describe the intended behavior of the object
* methods of an object have hidden implementation
* methods describe a "can perform" relationship.


### Instance-Variables (Fields)
* An instance-variable, or field are representative of the _properties_ or _attributes_ of a `Class`.
* By aggregating the values of an instance's fields, we derive the instance's _state_.
* field-values of an object are made available to users via the object's **getters**
* variable-values of an object can be manipulated by the user via the object's **setters**
* the aggregation of an object's variable's values determines the object's **state**.
* fields describe a "has a" relationship.



<hr><hr>

## Constructors
* a method which creates a new instance of a class (an object)
* describes the initial **state** of an object



### Nullary Constructor
* A method is said to be _nullary_ when it takes no arguments as a parameter.


#### Sample

* Script

```javascript
class Person{ // class signature

	constructor(){ // constructor signature
        console.log("A person object has been created");
    }
}
```

* Usage

```javascript
let person = new Person();
```


* Output

```
A person object has been created
```


### Default Constructor
* The _default_ constructor is a _nullary_ constructor with an empty body.
* If no constructor is defined explicitly in a class, the default constructor is provided by the compiler.

#### Sample

* Script

```javascript
class Person{ // class signature
    // no constructor defined

    sayHello(){
        print("Hello");
    }
}
```




* Usage

```javascript
let person = new Person();
person.sayHello();
```


* Output

```
Hello
```





### Non-nullary Constructor

* A method is said to be _non-nullary_ when it takes at least 1 argument as a parameter.


#### Sample


* Script

```javascript
class Person{ // class signature
    // constructor
    constructor(firstName, lastName, age){
        this.firstName = firstName;    
        this.lastName = lastName;
    }
}
```


* Usage

```javascript
let leon = new Person("Leon", "Hunter", 27);
```


* Output

```
```











<hr><hr>


## Setters<br>(Mutators)
* Mutators change initial, or subsequent, values of an object.
* _Setters_ are a specific type of mutator which expliticly reassign the reference of a field.

### Sample

* Script

```javascript
class Person{  // class signature
    // constructor
    constructor(firstName, lastName, age){
        this.firstName = firstName;
        this.lastName = lastName;
    }

    setFirstName(newFirstName){
        this.firstName = newFirstName;
    }

    setLastName(this. new_lastName){
        this.firstName = new_lastName;
    }
```


* Usage

```javascript
let leon = new Person("Leon", "Hunter", 27);
let bobFirstName = "Robert";
leon.setFirstName(bobFirstname);
```


* Output

```
```




## Getters<br>(Accessors)
* Accessors are methods used to retrieve or compute data from an object.
* _Getters_ are specific types of accessors which retrieve a reference from the object.


### Sample

* Script

```javascript
class Person{ // class signature
    // constructor
    constructor(firstName, lastName, age){
        this.firstName = firstName;
        this.lastName = lastName;
    }

    setFirstName(newFistName){
        this.firstName = newFirstName;
    }

    setLastName(newLastName){
        this.firstName = newLastName;
    }

    getFirstName() {
        return this.firstName;
    }

    getLastName() {
        return this.lastName;
    }
}
```


* Usage

```javascript
let leon = new Person("Leon", "Hunter", 27);
let bobFirstName = "Robert";
leon.setFirstName(bobFirstName);
let newFirstName = leon.getFirstName();
print(newFirstName);
```


* Output

```
Robert
```




