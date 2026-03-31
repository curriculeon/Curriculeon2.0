# Navigating the Terminal

## Part 1 - Opening The Terminal

* To open the terminal in OSX
    * hold `Command` and press `Space` to open the _spotlight search_.
    * in the search bar, enter `terminal`

* To open the git-bash terminal in Windows OS
    * press the `Windows` key to open _windows search_.
    * in the search bar, enter `git bash`.

[<img src="./imgs/open-git-bash.gif">](./imgs/open-git-bash.gif)




## Part 2 - Displaying your Username
* Upon opening the terminal, verify what your _username_ is.
    * execute `whoami` in the terminal.
    * The name of the account that is currently signed in should be displayed in the terminal's standard output.
* In the examples below, the name of the user-account is `hunte`

[<img src="./imgs/whoami.gif">](./imgs/whoami.gif)




## Part 3 - Home Directory
* To navigate to the _home directory_ execute `cd ~` in the terminal
    * `cd` is a _command_ used to _change directories_
    * `~` is an _alias_ recognized by the shell to reference the _home directory_
* Verify that you are in your home directory by executing `pwd` to _print working directory_.
    * The _file path_ pointing to a directory with your _username_ should be displayed in the terminal's standard output.

[<img src="./imgs/home-directory_pwd.gif">](./imgs/home
-directory_pwd.gif)
    


## Part 4 - Listing Files in the Current Directory
* To list all of the files in the current directory, execute `ls`

[<img src="./imgs/home-directory_ls.gif">](./imgs/home-directory_ls.gif)




## Part 5 - Opening the File Explorer
* To get a graphical representation of the file system, open the _file explorer_.
    * execute `explorer .` from the Windows git-bash terminal
    * execute `open .` from the OSX terminal

[<img src="./imgs/home-directory_file-explorer.gif">](./imgs/home-directory_file-explorer.gif)




## Part 6 - Creating an Application-Development directory
* To create a new directory, named `dev`, execute `mkdir dev` from the home-directory.
    * `mkdir` is a _command_ used to create a new directory
    * `dev` is the name of the directory to be created
* Verify that newly created directory is visible in the terminal, by executing `ls`.
    * The name of the directory, `dev`, should be displayed in the standard output.
* Verify that newly created directory is visible in the project explorer, by executing `explorer .` or `open .` respectively
    * The directory should be displayed as a folder in the project explorer

[<img src="./imgs/home-directory_mkdir-dev.gif">](./imgs/home-directory_mkdir-dev.gif)




## Part 7 - Change Directory to the `dev` directory
* To change the _current working directory_ to `dev`, execute `cd dev` from the home directory.
* Verify that the command has executed properly by executing `pwd` to display the _current working directory_.
    * The name of the current working directory, `~/dev`, should be displayed in the standard output.
* Verify that this directory is empty by executing `ls`
    * The standard output should not display anything

[<img src="./imgs/home-directory_cd-dev.gif">](./imgs/home-directory_cd-dev.gif)










