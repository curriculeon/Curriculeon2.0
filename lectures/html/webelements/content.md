# What is HTML

## Overview
* What is HTML
* HTML Tags
* HTML Elements
* HTML Semantics
* Basic HTML Elements
* Comments



* An `HTML` element is everything from the start tag to the end tag:

```html
<tagname>Content goes here...</tagname>
```

# Examples of some HTML elements:

```html
<h1>My First Heading</h1>
```

```html
<p>My first Paragraph</p>
```

<table>

    <tr>
        <th>Start tag</th>
        <th>Element content</th>
        <th>End tag</th>
    </tr>

    <tr>
        <td>&lt;h1&gt;</td>
        <td>My First Heading</td>
        <td>&lt;/h1&gt;</td>
    </tr>

    <tr>
        <td>&lt;p&gt;</td>
        <td>My first paragraph.</td>
        <td>&lt;/p&gt;</td>
    </tr>

    <tr>
        <td>&lt;b&gt;</td>
        <td>My first bold typographical emphasis.</td>
        <td>&lt;/b&gt;</td>
    </tr>

    <tr>
        <td>&lt;br&gt;</td>
        <td>none</td>
        <td>none</td>
    </tr>


    <tr>
        <td>&lt;img&gt;</td>
        <td>none</td>
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
* is the root of an HTML document.







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