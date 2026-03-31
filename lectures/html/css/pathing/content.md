# Relative and Absolute Pathing








## Lecture Overview
* Directory Structure
* Relative Paths
* Absolute Paths












### Directory Structure
* directory structure is the way an operating system's file system and its files are displayed to the user.
* Files are typically displayed in a hierarchical tree structure. 
* The tree hierarchy is dependent on how each file is nested.


-
### Example
* For example:
    * Assume we have a folder named `dev` which contains the following:
        * a folder named `my-project`
        * a file named `README.md`
    * We say `dev` is the _parent directory_ of `my-project`.
    * We say `my-project` is a _child directory_ of `dev`.
    * We say `README.md` is a sibling of `my-project`.

-
#### Web Developer File Structure
* By convention, developers typically place a `dev` folder in their _home_ directory to avoid navigational confusions.
* This convention ensures that a developer can navigate quickly to their projects via `cd ~/dev/my-project-name`.


-
#### Web Project File Structure
* In a simple case, Web Projects have a file structure that appears as following:

```
> `project-folder`
    - `index.html`
    > `assets`
        > `css`
            - `style.css`
            - `navbar-style.css`
            - `footer-style.css`
        > `js`
            - `bootstrap.js`
            - `jquery.js`
            - `my-js-file.js`
        > `img`
            - `img1.png`
            - `img2.jpg`
            - `img3.gif`
```            

* The file structure is organized with a main "project-folder" that contains an HTML file called "index.html" and a subfolder called "assets." The "assets" folder contains three subfolders: "css," "js," and "img."
* The "css" folder contains three CSS files: "style.css," "navbar-style.css," and "footer-style.css." These files contain styles that can be applied to the HTML document using CSS rules.
* The "js" folder contains three JavaScript files: "bootstrap.js," "jquery.js," and "my-js-file.js." These files contain JavaScript code that can be used to add interactivity and other features to the website.
* The "img" folder contains three image files: "img1.png," "img2.jpg," and "img3.gif." These files can be used in the HTML document to display images on the website.
* Overall, this file structure is organized in a way that separates the different types of files used in the project (HTML, CSS, JavaScript, and images) into their own folders, which can help to keep the project organized and make it easier to find and access the files.