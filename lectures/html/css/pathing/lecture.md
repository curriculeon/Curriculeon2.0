# Relative and Absolute Pathing








-
-
## Lecture Overview
* Directory Structure
* Relative Paths
* Absolute Paths












-
-
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
* In the simplest case, Web Projects have a file structure that appears as following:

```
> `project-folder`
    > `index.html`
    > `assets`
        > `css`
            > `style.css`
            > `navbar-style.css`
            > `footer-style.css`
        > `js`
            > `bootstrap.js`
            > `jquery.js`
            > `my-js-file.js`
        > `img`
            > `img1.png`
            > `img2.jpg`
            > `img3.gif`
```            

