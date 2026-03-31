# HTML Content Models
(This lecture may need review for quality)






-
-
## Content Models
* _Content Model_ refers to the set of rules that define what type of content each element is allowed to have.
* Mostly, this translates into what other elements are allowed to be nested inside which other elements.
* Block Level Elements
* inline Elements



-
-
### Choosing which element to use
* Each element has two main aspects that make it different from another element.
    * How a browser will display it by default
    * What browsers and search engines will assume about the content of that element.
* This is called the _semantic value_ of an element.

-
-
### NON-SEMANTIC ELEMENTS
* `div` and `span` are _non-semantic_ elements.
* They don’t add any information for non-human readers.
    * But they’re great when you only need to add styles!


-
-
### Block Level Elements
* Block-level elements render on a new line by default.
* Block-level elements can wrap inline or other block-level elements.

-
#### Examples of block level elements
* The `<div>` tag is a block-level division or section in an HTML document.
* `div` can contain anything, but has no semantic value.
```HTML 
<div> 
    <p> some content </p>
<div> 
```


-
#### Inline Elements
* Your code can have many inline elements but they will all still be displayed on the same line.
* Having new line characters in the content or between the tags in your code won’t make any difference.
* Remember, HTML doesn’t care about new line characters, spaces, etc. All those space characters get translated into a single space anyway.

-
### Examples of Inline Elements
* `<span>` tag is inline division in an HTML document.
* It can contain any non-block content
* has no semantic value

```HTML
<p><span>Some</span> content. </p>
```