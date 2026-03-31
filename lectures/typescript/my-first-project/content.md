# My First TypeScript Project

## Overview
* Prerequisites
* Initializing Project
* Serving Project
* Modifying Config
* Linking `index.html`
* Writing the TypeScript

### Prerequisites
* npm
* TypeScript


### Part 1 - Initializing Project Config
* Execute the commands below from a terminal window

```bash
projectName="my-first-typescript"
mkdir $projectName
cd $projectName
ts --init
```

### Part 2 - Serving Project
* Execute the command below to transpile all `.ts` files in current directory to `.js` files
    * `tsc .`
* Execute the command below to transpile all `.ts` files in current directory to `.js` files automatically upon saving file changes
    * `tsc . -w`

### Part 3 - Setting Up Project Structure
* Execute the commands below to set up project structure

```bash
mkdir ./src # directory to store typescript source & webpage metafiles
mkdir ./src/static/css
mkdir ./src/static/image
mkdir ./src/static/ts
mkdir ./src/static/js
mkdir ./templates # directory to store webpage html source files
```

### Part 4 - Modifying Config
* Modify the `tsconfig.json` file by setting the `"rootDir"` key to a value of `"./src"`
* Modify the `tsconfig.json` file by setting the `"outDir"` key to a value of `"./src/static/js"`

### Part 4 - Linking index
* Execute the command below to create a new `index.html`

```bash
echo '
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="description" content="">
  <meta name="author" content="">

  <link href="./static/css/style.css" rel="stylesheet">
  <script type="text/javascript" src="./static/js/utils.js"></script>
  <script type="text/javascript" src="./static/js/header-functions.js"></script>
</head>


<body>
  <h1>The quickest of brown foxes.</h1>
  <footer>
    <script type="text/javascript" src="./static/js/footer-functions.js"></script>
  </footer>
</body>

</html>
' > ./templates/index.html
```


### Part 5 - Writing the TypeScript
* Execute the command below to create the `utils.ts` file used in the `index.html`'s `head` tag.
    * _This file will be transpiled to `utils.js`_

```bash
echo '
const log: any = (prompt) => console.log(prompt);
' > ./src/static/ts/utils.ts
```

* Execute the command below to create the `header-functions.ts` file used in the `index.html`'s `head` tag.
    *  _This file will be transpiled to `header-functions.js`_

```bash
echo '
log("Hello world!");
' > ./src/static/ts/header-functions.ts 
```

