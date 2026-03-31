# Types



## Lecture Overview
* What are types
* Why types matter
* Examples of types


### What are types?
* JavaScript variables can hold different data types:
  * booleans
  * numbers  
  * strings
  * functions
  * objects, and more

### What Effect Do Types Have?
* The type of a variable dictates the way that you can interact with it.
* For example, you cannot divide a `string` type, because it is text.
  * However, you can divide `integer` types because it is a number.



### How to Identify Type?
* The `typeof` operator is used to identify the type of a variable.
* The `typeof` operator returns the type of a variable or an expression

#### `typeof` Example

```javascript
let age = 28;
console.log(typeof age)
```

The sample script above produces the output below

```
number
```




## JavaScript Booleans
* Booleans can only have two values: `true` or `false`.
* Booleans are used in conditional testing and controlling the flow of data in an application.





### Number Types
* There are _usually two types_ of numbers: integers, and floating points.
* Integers are whole numbers, with no decimal value.
* Floating are decimal values.
* JavaScript recognizes both types as `Number` types


#### `Number` Example

```javascript
let age = 28;
let averageHeight = 67.5
let typeOfAge = typeof(age)
let typeOfAverageHeight = typeof(averageHeight)
console.log(typeOfAge)
console.log(typeOfAverageHeight)
```

The sample script above produces the output below

```
number
number
```







### Textual Type
* There are _usually two types_ of texts: characters and `string` (or text string).
  * A character (or a _text string_) is a single character wrapped in single quotes, `'`, like `'a'`.
  * A `string` (or a _text string_) is a series of characters wrapped in double quotes, `"`, like `"John Doe"`.
* JavaScript recognizes both types as `string` types



#### `String` Example

```javascript
let age = "28";
let averageHeight = "67.5"
let typeOfAge = typeof(age)
let typeOfAverageHeight = typeof(averageHeight)
console.log(typeOfAge)
console.log(typeOfAverageHeight)
```

The sample script above produces the output below

```
string
string
```


