# Defining Javascript Functions

### Overview
* Prerequisite Topics
* What is a Function?
* What is an Input?
* What is an output_value?
* `return` statement
* contrasting `return` and `print`
* Using a Function





### What is a Function?
* A function is a block of **reusable** instruction(s).
* A function relates an `input` to an `output_value`.
* The intent of a function is to re-execute the same lines of in different areas of a program.
* Functions provide better modularity for an application

### Function vernacular
* The _function signature_ is the first line of a function definition.
* A _function signature_ is denoted by the keyword `function`, followed by the name of the function, followed by parenthesis `()`, followed by a `{`.
* A _code block_ begins with an open curly bracket, `{`, and encapsulates several lines of code, followed by a closing curly bracket, `}`
* A _function definition_ is a _function signature_ and its respective _code block_.
* A _function call_ is the execution of a function.



```javascript
// this is outside the scope of the of the function code-block
function myFunctionName() { // this is the function signature
    output_value = "Hello world"; // this is the beginning of the function code-block
    print(output_value);// this is the ending of the function code-block
}  // this is outside the scope of the of the function code-block
```


### Function Parameters
* Input parameters are denoted by the parenthesis `()`
* In simple examples, an input is typically thought to be a _numeric datatype_ or _textual datatype_
    * though, **any type is valid** as an input.





```javascript
// this is outside the scope of the of the function code-block
function myFunctionName(input_value) { // this is the function signature
    output_value = "Hello " + input_value; // this is the beginning of the function code-block
    print(output_value); // this is the ending of the function code-block
} // this is outside the scope of the of the function code-block
```





### return
* The `return` statement exits a function, optionally passing back an expression to the _caller_.
    * The expression passed back to the caller is named 
* Omitting a `return` statement is the same as explicitly `return`ing `None`

```javascript
// this is outside the scope of the of the function code-block
function myFunctionName(input_value){ // this is the function signature
    output_value = "Hello " + input_value; // this is the beginning of the function code-block
    return output_value; // this is the ending of the function code-block
} // this is outside the scope of the of the function code-block
```


### return vs print
* In contrast to `print` statements, `return` statements allow a system's _state change_ to be observable in a _programmatic_ way
* In contrast to `return` statements, `print` statements allow a system's _state change_ to be observable in a _human-readable_


### sing a function
* To make use of a function, you must _make a call to the function_.
* _Calling_ a function only requires cognizance of the function signature: the name and parameters of the function.
  * **You do not need to know how a function is defined to make a call to a function**
* Below is an example of a function _definition_ followed by a _call_ to the function.

```javascript
function greet(username) {
  let output = "Hello " + username
  console.log(output);
}


greet("Leon");
greet("Hunter");
```

* **Script Output**

```
Hello Leon
Hello Hunter
```