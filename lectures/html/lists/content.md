# Lists


## Lecture Overview
* Unordered Lists
* Ordered Lists
* Definition Lists


### Unordered Lists
* Unordered lists show up by default with bullets and have opening and closing tags, `<ul></ul>`
* Each list item starts with the `<li>` tag and ends with `</li>`

```HTML
    <ul>
       <li>Order</li>
       <li>Doesn’t</li>
       <li>Matter</li>
    </ul>
```
#### Styling of the Item Marker
* The CSS `list-style-type` property is used to define the style of the list item marker
* Three different styles to choose: `disc` (bullets), `circle` (empty circle), and `square` (solid square)

#### Discs (bullets)
```HTML
  <ul style="list-style-type:disc;">
    <li>Coffee</li>
    <li>Ginger Ale</li>
    <li>Capri Sun</li>
  </ul>
```


#### Circles (empty)
```HTML
  <ul style="list-style-type:circle;">
    <li>Coffee</li>
    <li>Ginger Ale</li>
    <li>Capri Sun</li>
  </ul>
```


### Ordered Lists
* An ordered list begins with the opening tag `<ol>` and ends with the closing tag `</ol>`
* List items will be by default marked with numbers and will be within the  list item opening and closing tags `'<li></li>'`

```HTML
  <ol>
    <li>Coffee</li>
    <li>Ginger Ale</li>
    <li>Capri Sun</li>
  </ol>
```

#### Styling of the Item Markers
* The type attribute of the `<ol>` tag, specifies the type of the list item marker
* List items can be numbered with numbers (default), uppercase and lowercase letters, and lowercase and uppercase roman numerals.


#### Numbers
```HTML
  <ol type="1">
    <li>Coffee</li>
    <li>Ginger Ale</li>
    <li>Capri Sun</li>
  </ol>
```


#### Uppercase Letters
```HTML
  <ol type="A">
    <li>Coffee</li>
    <li>Ginger Ale</li>
    <li>Capri Sun</li>
  </ol>
```



#### Uppercase Roman Numerals
```HTML
    <ol type="I">
      <li>Coffee</li>
      <li>Ginger Ale</li>
      <li>Capri Sun</li>
    </ol>
```


#### Lowercase Roman Numerals
```HTML
    <ol type="i">
      <li>Coffee</li>
      <li>Ginger Ale</li>
      <li>Capri Sun</li>
    </ol>
```




### Definition Lists
* A definition list is a list of terms, with a description of each term
* The `<dl>` tag specifies the definition list, the `<dt>` tag specifies the term or name, and the `<dd>` tag describes each term

```HTML
    <dl>
      <dt>Coffee</dt>
        <dd>- black hot drink</dd>
      <dt>Capri Sun</dt>
        <dd>- clear cold fruity drink</dd>
    </dl>
```
