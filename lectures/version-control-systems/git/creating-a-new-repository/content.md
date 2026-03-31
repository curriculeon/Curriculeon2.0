# Creating a Repository

## Create a Repository on the Web
1. Navigate to [`github.com/new`](https://github.com/new)

## Create a Repository on your local machine
1. Navigate to the root folder of the project you would like to become a repository.
2. `git init`
	* this generates a `.git` folder in this directory.
	* the `.git` tells this directory that it is a git-repository, enabling subsequent `git` commands in this directory.
3. `git add .`
	* adds all _changes_ in this directory to the repository
	* _this modifies the contents of the aforementioned `.git` folder_
4. `git remote add origin https://github.com/your-github-username/your-repository-name`
	* sets the location of the repository
	* _this ensures all of our files are stored at the url we specify_
5. `git commit -m 'my update message'`
	* commits these changes to be pushed onto the web
	* _this modifies the contents of the aforementioned `.git` folder_
6. `git push -u origin master`
	* _pushes_ the committed changes onto the web, making them accessible through the web.
	* _the local `.git` is compared to the remote `.git`, and respective changes are written as a new commit_