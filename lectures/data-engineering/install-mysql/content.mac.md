# Install MySQL


## Mac OS
* Execute the commands below to uninstall `mysql` from `brew`

```bash
kill -kill `pgrep mysql`
brew deps mysql | xargs brew remove --ignore-dependencies && brew missing | xargs brew install
brew remove mysql
brew autoremove
brew cleanup
launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
sudo rm -rf /usr/local/var/mysql
```

* Execute the command below to install `mysql` from `brew`
	* `brew install mysql`
* Execute the command below to change mysql permissions
    * `sudo chown -R  _mysql:mysql /usr/local/var/mysql`
* Execute the command below to see further instructions on configuration
	* `brew info mysql`
* Execute the command below to verify MySQL is installed
	* `sudo ps aux | grep mysql`
	* _only a single line of stdout should appear_
* Execute the commands below to export `mysql` to your `$PATH`, then _source_ it.

```bash
myShell=`echo $SHELL`
if [[ "$myShell" == *"zsh"* ]]; then
  profile=`echo "~/.zshrc"`
elif [[ "$myShell" == *"bash"* ]]; then
    profile=`echo "~/.bashrc"`
fi
echo 'export PATH="/usr/local/var/mysql/bin:$PATH"' >> $profile
source $profile
```
* Execute the commands below to begin `mysql` services

```bash
brew cleanup
kill -kill `pgrep mysql`
mysqld --initialize --explicit_defaults_for_timestamp
mysql.server start
brew services restart mysql
launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.mysql.plist
brew services start mysql
```

* Execute the command below to connect to the database
    * `mysql -u root`