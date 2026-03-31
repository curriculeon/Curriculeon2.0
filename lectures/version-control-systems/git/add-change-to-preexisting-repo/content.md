# Adding Changes to a Preexisting Repo



### Prequisites
* `git` or `GitBash` installed on your machine




### Part 1 - Cloning a Preexisting Project
* From a browser, navigate to the URL of the GitHub repository you would like to clone.
* Copy the URL of the repository your clipoboard.
* From a terminal, do the following:
   * Create a `dev` directory in your home directory.
      * `mkdir ~/dev`
   * Change directories to `~/dev`
      * `cd ~/dev`
   * Clone project into `~/dev` directory and _alias_ project directory as `my-project`
      * `git clone {repository_url} my-project`


### Part 2 - Adding Changes to Preexisting Git Repository
1. navigate to the root directory of the project on your local machine
2. add changes
	* `git add .`
3. commit change
	* `git commit -m 'update message'`
4. push changes to web
	* `git push -u origin master`
5. Refresh the webpage to ensure your changes are visible.