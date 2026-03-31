
## Delete User Account
* Give Terminal full disk access 
* Execute the command below to list out users
	* `sudo dscl . list /Users`
* Execute the command below to delete the particular user's files
	* `sudo dscl . -delete /Users/Account_name`
* Execute the command below to delete the user
	* `sudo rm -rf /users/account`
* Execute the command below if the user is not being deleted
	* `rm -rf /private/var/db/dslocal/nodes/Default/users/postgres.plist`

	
	
```
username=pete
sudo dscl . list /Users
sudo dscl . -delete /Users/$username
sudo rm -rf /Users/$username
```
	