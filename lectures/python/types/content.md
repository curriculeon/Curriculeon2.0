# Types



## Overview
* Data Types
* Object-type
* Variable Initialization / Assignment Statements
* Variable Declaration
* Variable Instantation
* Casting



### Data Types
* In Object Oriented Programming (OOP) languages, "Everything is an _Object_".
* The simplest program one could write is named the `"Hello, World!" program`

```python
print("Hello, World!")
```

[<img src="./hello-world-program.gif">](./hello-world-program.gif)


### Object Type
* In Object Oriented Programming, an _object_ is _any value in memory referenced by an identifier_.
* An object can be a
    * variable
    * data structure
    * function
    * method
* Because "everything is an object", all variables can be _assigned_ to the `Object` _type_.
* A _type_ is the name of the _class_ of an object.
* A _class_ is a template, or blueprint from which objects are created
	* it is the cookie-cutter to a cookie
	* it is the _classification_ of an object.
* An _object_ is an instance of a class.
* All objects have the following three traits:
    * objects have a state
    * objects have behaviors
    * objects have an identity


```python
age = 27
age_greeting = "My age is "        
age_output = age_greeting + age

print(nameOutput)
```

* Output

```
My age is 27
```








### Variable Initialization
* Any expression which states a _variable type_, a _variable name_, an equal operator (`=`), followed by a _variable value_, is considered an **assignment statement**.
* All _assignment statements_ result in variable initialization or reinitialization.
    * General Syntax: `variable_name = ${some-value-here}`
    * Example 1: `age = 27;`
    * Example 2: `name = "Leon Hunter"`
    * Example 3: `account_balance = 999999.99`










### Why is Type relevant?
* The declared type of a variable determines which behaviors it will be able to perform.
* In OOP, _methods_ denote behavior.
* _Methods_ are functions defined within the scope of a class.
* In pure OOP languages, all functionality is achieved through _methods_, not _functions_.


### Notable Object Behaviors
* The two most notable object behaviors are `.toString()` and `.equals()`

#### .toString()
* An `Object` can convert to string

```python
age_as_integer = 27
age_as_string = age_as_integer.toString()
```

#### .equals()
* An Object can compare its equivalence


```python
age_as_integer = 27
age_as_string = str(age_as_integer)
are_objects_equal = age_as_integer.equals(age_as_string)
```









### What is Casting?
* Because [the declared type of a variable determines which behaviors it will be able to perform](#why-is-type-relevant), assigning variables to `Object` gives access to very few behaviors.
* An `Object` can be treated as a more-specific type through a mechanism called _down-casting_.
    * Downcasting gives access to more behaviors.
* An `Object` can be treated as a less-specific type through a mechanism called _up-casting_.
    * Upcasting restricts access to more-specific behaviors.




### How to Cast


* **Example 1:**

```python
age_as_string = "27"
age_as_integer = int(age_as_string)
age_as_integer_type = type(age_as_integer)
age_as_string_type = type(age_as_string)

print(age_as_integer_type)
print(age_as_string_type)
```


* **Example 2:**

```python
is_name_leon = "true"
age_as_integer_type = type(age_as_integer)
age_as_string_type = type(age_as_string)

print(age_as_integer_type)
print(age_as_string_type)
```



* **Example 2:**

```python
nameAsObject = object("Leon Hunter")
nameAsString = str(nameAsObject)
```



### More Casting examples



* **Example 1:**

```python
 ageAsInteger = int("27")
```


* **Example 2:**

```python
isMaleBoolean = bool("true")
```



* **Example 2:**

```python
nameAsString = str("Leon Hunter")
```

