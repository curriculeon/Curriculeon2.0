# HTML Document Structure


-
-
## Document Structure
* DOCTYPE
* Nesting
* Body
* Links



-
-
### DOCTYPE
* The first thing on an HTML page is the doctype, which tells the browser which version of the markup language the page is using.
* <!DOCTYPE html>

-
-
### Nesting
* HTML is structured by nesting elements inside other elements. This is done by placing elements inside other containing tags.
* For example, the <p> nested inside of the <body> tags is a “child” or a “descendent” of the body.
``` HTML
<body>
	<p>A paragraph inside the body tag</p>
</body>
```

-
#### The `<html>` tag
* Like a sandwich, the HTML document has open and closing tags
* `<html>...</html>`
* Everything in an HTML document is surrounded by <html> tag

```HTML
<!DOCTYPE html>
<html>
</html>
```


-
-
#### The `<head>` tag
* Follows the <html> tag and has open and closing tags
* `<head>...</head>`
* Contains the title and metadata information about the page
* Meta information is mostly invisible to the user, but has many purposes, like providing information to search engines.
```HTML
<!DOCTYPE html>
  <html>
    <head>
      <title>My Page</title>
    </head>
  </html>
```      


-
-
### The `<body>` tag
* Follows the <head> tag and has open and closing tags
* `<body>...</body>`
* Holds the visible content of a webpage
* Headings, paragraphs, lists, quotes, images, and links are just a few of the elements that can be contained within the body tag.

``` HTML
<!DOCTYPE html>
	<html>
	  	<head>
	    	<title>Title of the page</title>
	  	</head>
	  	<body>
	    	The page content here.
		</body>
</html>
```


-
#### Headings
* HTML includes six levels of heading which are ranked according to importance, not size
* These are `<h1>, <h2>, <h3>, <h4>, <h5>, and <h6>`.
``` HTML
<h1>Written</h1>
<h2>In</h2>
<h3>Decreasing</h3>
<h4>Order</h4>
<h5>Of</h5>
<h6>Importance</h6>
```

-
#### Paragraphs
* This element, with open and closing tags, will allow you to create paragraphs.
* `<p>...</p>`
* The browser does not care about line breaks or tabs in your code. Use the `<p>`tag to split lines of text displayed on the page.

``` HTML
<body>
	<p>A paragraph inside the body tag</p>
</body>
```

-
#### Horizonal Line Break
* This element represents a sectional break between paragraphs. It can be used as an indicator when changing a subject within as section. `<hr>`

``` HTML
<html>
  <head>
    <title>first page</title>
  </head>
    <body>
        <p>This is a paragraph.</p>
        <hr>
        <p>This is another paragraph. </p>
    </body>
</html>
```

-
#### Single Line Break     
* Use the `<br />` tag to add a single line of text without starting a new paragraph.
* The `<br />` element is an empty HTML element. It has no end tag.
```HTML
<html>
  <head>
      <title>first page</title>
    </head>
  <body>
    <p>This is a paragraph.</p>
      <p>This is another paragraph. </p>
    <p>This is <br /> a line break </p>
  </body>
</html>
```

-
#### Images
* The image element has two required attributes: src and alt
* "src" of Source attribute tells the browser what image goes in the tag and where to find it
* "alt" or alternative text gives a description of the image and is needed on image tags if the image is not visible
* Three type of image files are used in HTML: .jpg(JPEG), .gif(GIF), .png(PINGs)

``` HTML
<img src="image.jpg" alt="Your image">
```


-
-
### Links
* Links are defined in HTML with the <a> element
* The "href" attribute defines the link's destination address
* Three types of links that can be used in HTML:
* Absolute, Relative, and Anchor


-
#### Absolute Links
* The file path has to include the full URL (most commonly used for external site links).


``` HTML
		<a href="www.google.com">Link to an external page.</a>
```


-
#### Relative Links
* The file path is relative to the index.html page’s location.
* Can be used to add in an image

``` HTML
		<a href="page.html">Link to a local page.</a>
```

-
#### Anchor Links
* You can tell the browser to go to a specific section of the page

``` HTML
		<a href="#projects">Link to a section on the page.</a>
```

-
-
#### Link Attributes
* With certain attributes, links can open in a new tab or perform a special action, like opening the user’s default mail application.

```HTML
<a href="www.google.com" target="_blank">Opens another tab</a>
```
```HTML
<a href="mailto: email@youremail.com">Email Us!</a>
```

-
-
## Lecture Summary
* DOCTYPE : Tells the browser which version of the markup language the page is using
* Nesting : The placement of elements inside of other containing tags
* `<body>` : Contains all the visible content of a webpage. What elements can be contained inside of the body tag?
* Links : Three different types of links. Relative, Absolute, and Anchor
