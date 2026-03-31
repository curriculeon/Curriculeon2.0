# Intro to Javascript





<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./1_intro-to-javascript.mp4">
</video>

<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./2_intro-to-javascript.mp4">
</video>


<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./3_intro-to-javascript.mp4">
</video>


## Lecture Overview
* Brief intro
* Where and How to use it
* Variables
* Syntax
* Assignment vs comparison
* Functions




### Intro
* Changes HTML Content
* Changes Attribute Values
* Changes CSS
* Can Hide and Change HTML elements

#### How Javascript Affects HTML and CSS
* One of many JavaScript HTML methods is getElementById();

```javascript
document.getElementById("demo").innerHTML = "Hello JavaScript";
```

#### Can Change Attribute Values
* Can also use the getElementByID

```javascript 
document.getElementById("demo").src = "somepng.png";
```


#### Changing CSS Values

```javascript
document.getElementById("demo").style.display = "block";
```

### Where to use it
* JavaScript code must be inserted between `<script>` and `</script>` tags.
* Can be placed in the `<head>` section
* Placed in the `<body>` section
* Can be placed externally as well

#### Placing in the head

```html
<!DOCTYPE html>
<html>
<head>
<script>
function myFunction() {
  document.getElementById("demo").innerHTML = "Paragraph changed.";
}
</script>
</head>
<body>

<h1>A Web Page</h1>
<p id="demo">A Paragraph</p>
<button type="button" onclick="myFunction()">Try it</button>

</body>
</html>
```


#### Placing in the body

```html
<!DOCTYPE html>
<html>
<body> 

<h1>A Web Page</h1>
<p id="demo">A Paragraph</p>
<button type="button" onclick="myFunction()">Try it</button>

<script>
function myFunction() {
 document.getElementById("demo").innerHTML = "Paragraph changed.";
}
</script>

</body>
</html>
```


#### External Javascript

```javascript
function myFunction() {
 document.getElementById("demo").innerHTML = "Paragraph changed.";
}
```

* External scripts are practical when the same code is used in many different web pages.
* Put the name of the script file in the src(source) attribute of a `<script>` tag.

##### Advantages of using External Javascript
* It separates HTML and code
* It makes HTML and JavaScript easier to read and maintain
* Cached JavaScript files can speed up page loads


### Variables
* **Variables** are used to **store** data values.
* JavaScript uses the var keyword to **declare** variables.
* Equal signs are used to assign values to variables.

#### Example 

```javascript
var x;

x = 6;
```

### Syntax
* How JavaScript programs are constructed:

```javascript 
var x, y, z;          // How to declare variables
x = 5; y = 6;      // How to assign values
z = x + y;         // How to compute values
```



#### Most important rules for writing fixed values
* **Numbers** are written with or without decimals
    * I.E. `10.50` or `1001`
* Strings are text, written within **double** or **single** quotes
    * I.E. `"John Doe"` or `'John Doe'`
* Discussion point 3A.3


#### Operators
* JavaScript uses **arithmetic operators** `( + - * / )` to **compute** values







