# HTML Element

## Overview
* What is HTML
* HTML Tags
* HTML Elements
* HTML Semantics
* Basic HTML Elements
* Comments



-
-
### What is HTML
* What are manuscript mark ups?
* What is hyper text mark up?
* What is cascading styling?


-
#### Manuscript Mark Ups
* Manuscript mark-ups use symbols which _encapsulate_ a section of a document to annotate how the section should be structured.
  * (i.e. - revision instructions by editors before any final print)
* Often enforced structure on an encapsulated **section** of the document.

-
#### Cascading Mark Up Structure
* Manuscript mark-ups often used the same symbol in different colors to denote more specific ways of structuring the same group-type.
    * These colors had a _cascading_ effect on the _mark up tags_ in the manuscripts.
        * <font color="blue">¶</font> - Create new paragraph, indent once
        * <font color="red">¶</font> - Create new paragraph, indent twice




-
#### Hyper Text Mark Up Instructions
* Inspired by the _marking up_ of paper manuscripts
* Standard _mark up_ language is used to display documents in a web browser.
* Each of these marked up documents are called _HTML documents_, and they form _web pages_ when being _hosted_ by a _server_.
* Sections of a document are denoted by encapsulating sections of text in _tags_.
    * _tags_ denote the beginning and ending of a section on a document.



* Hyper Text Mark Up Language (HTML)
* Used to create displays of content andinformation on a webpage
* Consists of a _tree_ of elements, which _wrap_, or _mark up_ content to make it appear certain way.





## HTML Tags
* An HTML tag helps the browser determine what default structure and style content display on the screen should have.
* An `HTML` element is everything from the start tag to the end tag:

```html
<tagname>Content goes here...</tagname>
```

### Examples of some HTML elements:

```html
<h1>My First Heading</h1>
```

```html
<p>My first Paragraph</p>
```

<table>

    <tr>
        <th>Element Name</th>
        <th>Start tag</th>
        <th>End tag</th>
    </tr>

    <tr>
        <td>Heading</td>
        <td>&lt;h1&gt;</td>
        <td>&lt;/h1&gt;</td>
    </tr>

    <tr>
        <td>Paragraph</td>
        <td>&lt;p&gt;</td>
        <td>&lt;/p&gt;</td>
    </tr>

    <tr>
        <td>Bold</td>
        <td>&lt;b&gt;</td>
        <td>&lt;/b&gt;</td>
    </tr>

    <tr>
        <td>Break</td>
        <td>&lt;br&gt;</td>
        <td>none</td>
    </tr>


    <tr>
        <td>Image</td>
        <td>&lt;img&gt;</td>
        <td>none</td>
    </tr>

</table>
 

## Web Elements
* Tags are used to delimit the start and end of a _web element_ or _html element_.
* Some _html elements_ are present regardless of an explicit declaration in the markup.
    * For example, the `HEAD` element is always present, even though both start and end `HEAD` tags may be missing in the markup.
* Contents of an element are placed after the start tag and before the end tag.
* The contents of an element are either, another element or text.

```html
<body>This is content of the body tag!<body>
```

### Web Element Semantics
* If an element contains another element, then the _container_ is said be a _parent_ of the _containee_.
    * If an element, `A`, has a _child_ `B`, then `A` is said to be a _parent_ of `B`
* All elements, except `<html>` have a parent.
    * Each element's parent is either another element, or `<html>`.
    * _The_ `<html>` _tag is the the root of an HTML document._
* Most elements have children elements.
    * Each element's child is either another element or text.

```html
<body>
    This is the content of body element!
    This element is a parent to the paragraph element.
    The paragraph tag is a child of this element.

    <p>This is the content of the paragraph element!<p>
</body>
```


## Basic Web Elements


### DOCTYPE
* The `<!DOCTYPE html>` should be the first line of all webpages.
* informs browser on how to render the page in standards compliant mode.



### The `<html>` tag
* The `<html>` tag informs browser that this is an HTML document.
* is the _parent_ to all other HTML web-elements on a page.
* is the the root of an HTML document.







### The `<head>`
* The `<head>` element is a container for _metadata_ (data about data).
* is placed after the `<html>` tag and before the `<body>` tag.
* HTML metadata is data about the HTML document.
* Metadata is not displayed.
* HTML Metadata typically defines
    * document title
    * character set
    * style
    * link
    * scripts
    * other meta-information

### `<title>`
* The `<title>` element sets the name of the tab of the webpage.

### `<body>`
* The `<body>` element is where all displayable content is declared.