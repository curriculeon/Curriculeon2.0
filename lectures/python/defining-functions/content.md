# Defining Python Functions

## Overview
* Prerequisite Topics
* What is a Function?
* What is an Input?
* What is an output_value?
* `return` statement
* contrasting `return` and `print`





## What is a Function?
* A function is a block of **reusable** instruction(s).
* A function relates an `input` to an `output_value`.
* The intent of a function is to re-execute the same lines of in different areas of a program.
* Functions provide better modularity for an application

## Function defintions
* The _function signature_ is the first line of a function definition.
* A _function signature_ is denoted by the keyword `def`, followed by the name of the function, followed by parenthesis `()`, followed by a `:`.
* A _code block_ begins with a colon `:` and is followed by a new line and an indentation.
* A _function definition_ is a _function signature_ and its respective _code block_.



```python
# this is outside the scope of the of the function code-block
def my_function_name(): # this is the function signature
    output_value = "Hello world" # this is the beginning of the function code-block
    print(output_value) # this is the ending of the function code-block
# this is outside the scope of the of the function code-block
```


## Function Parameters
* Input parameters are denoted by the parenthesis `()`
* In simple examples, an input is typically thought to be a _numeric datatype_ or _textual datatype_
    * though, **any type is valid** as an input.





```python
# this is outside the scope of the of the function code-block
def my_function_name(input_value): # this is the function signature
    output_value = "Hello " + input_value # this is the beginning of the function code-block
    print(output_value) # this is the ending of the function code-block
    return None # explicit return
# this is outside the scope of the of the function code-block
```





## return
* The `return` statement exits a function, optionally passing back an expression to the _caller_.
    * The expression passed back to the caller is named 
* Omitting a `return` statement is the same as explicitly `return`ing `None`

```python
# this is outside the scope of the of the function code-block
def my_function_name(input_value): # this is the function signature
    output_value = "Hello " + input_value # this is the beginning of the function code-block
    return output_value # this is the ending of the function code-block
# this is outside the scope of the of the function code-block
```


## return vs print
* In contrast to `print` statements, `return` statements allow a system's _state change_ to be observable in a _programmatic_ way
* In contrast to `return` statements, `print` statements allow a system's _state change_ to be observable in a _human-readable_