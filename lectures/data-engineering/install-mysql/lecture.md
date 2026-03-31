# Install DBeaver


## Mac OS
* Execute the command below to uninstall `mysql` from `brew`
	* `brew uninstall mysql`
* Execute the command below to purge myql
	* `cd /usr/local`
	* `sudo rm -rf mysql*`
* Execute the command below to install `mysql` from `brew`
	* `brew install mysql`
* Execute the command below to see further instructions on configuration
	* `brew info mysql`
* Execute the command below to verify MySQL is installed
	* `sudo ps ax | grep mysql`
	* only a single line of stdout should appear
* Execute the _respective_ command below to export `mysql` to your `$PATH`
    1. `echo "export PATH=/usr/local/mysql/bin:$PATH" >> ~/.bash_profile`
    2. `echo "export PATH=/usr/local/mysql/bin:$PATH" >> ~/.zshrc`
* Execute the _respective_ command below to refresh the system environment variables
    * `source ~/.bash_profile`
    * `source ~/.zshrc`
* Execute the command below to begin `mysql` services
    * `brew services start mysql`



## Linux OS
* Execute the command below to install MySQL
    * `placeholder command`

## Windows OS
* Execute the command below to install mysql
    * `placeholder command`