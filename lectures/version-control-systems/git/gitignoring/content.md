# Ignoring Content
* To create a `.gitingore` properly, navigate to `gitignore.io` from a browser and specify each technology that you would like to ignore the artifacts of
    * `Java`, `Selenium`, `Python`, `NodeJS`, `AngularJS`, `Jekyll`, `WordPress`, etc.
* Copy the generated contents and paste them in a file named `.gitignore` at the root directory of your project.
* Execute the command below to ensure that the respective files are explicitly removed from the current `commit`.
    * `git rm -r --cached .`