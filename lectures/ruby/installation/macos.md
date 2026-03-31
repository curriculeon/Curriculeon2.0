# Ruby Installation

## Install `rbenv`
1. Click [here](./install-rbenv.mac.sh) to download the file for `rbenv` installation.
2. From a terminal, execute the command below to give the `install-rbenv.mac.sh` script executable permissions
  *  `chmod u+x ~/Downloads/install-rbenv.mac.sh`
3. From a terminal, execute the command below to run the `install-rbenv.mac.sh` script
  *  `~/Downloads/install-rbenv.mac.sh`
4. After the installation is complete, <u>exit out of the terminal</u>.

### What is rbenv?

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