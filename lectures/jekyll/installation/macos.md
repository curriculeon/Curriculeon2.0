# Jekyll Installation - MacOS


## Install Ruby
* Execute the command below to ensure `Ruby` is installed.
	* `ruby -v`
* If your output displays `command not found`, then execute the command below to download and install Ruby 
	* `brew install ruby`
* If your output displays `You don't have write permissions for the /Library/Ruby/Gems/2.6.0 directory`, then execute the command below to export `GEM_HOME`
	* `export GEM_HOME="$HOME/.gem"`


## Install Jekyll
* Execute the command below to ensure `Ruby` is installed.
	* `ruby -v`
* Execute the command below to ensure `Gem` is installed.
	* `gem -v`
* Execute the command below to install `Jekyll`
	* `gem install jekyll bundler`
* Execute the command below to ensure `Jekyll` was installed successfully
	* `jekyll -v`

[<img src="./install-jekyll.gif">](install-jekyll.gif)


## _Optional: Install rbenv_
* `rbenv` is used to install a new version of `Ruby` and the `bundler` gem:

* Install `rbenv` by running the following command in the Terminal:

```bash
brew install rbenv
```

* Execute the command belolw to add the following line to add an auto-initializer for `rbenv`

	```bash
	echo eval "$(rbenv init -)" >> ~/.bash_profile
	echo eval "$(rbenv init -)" >> ~/.zshrc

	source ~/.bash_profile
	source ~/.zshrc
	```

* Use `rbenv` to install a new version of Ruby. For example, to install Ruby 2.7.2, run the following command:

```bash
rbenv install 2.7.2
```

* Set the global Ruby version to the newly installed version by running the following command:

```python
rbenv global 2.7.2
```

* Verify that the correct version of Ruby is being used by running the following command:
	* `ruby -v`

* Finally, install the bundler gem using the following command:
	* `gem install bundler`

* This should install the bundler gem for the newly installed version of Ruby and allow you to use it without needing root privileges.