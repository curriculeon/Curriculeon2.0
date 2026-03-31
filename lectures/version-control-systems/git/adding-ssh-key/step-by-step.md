# Generating SSH Key for Authentication

### Generating a new SSH key
* To create a new ssh key, using the provided email as a label, the command below substituting your Github email address
   ```bash
   ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```

* An output comparable to the below text displays    
	```
	Generating public/private ed25519 key pair.
	```
    
* Press enter upon being prompted to `Enter a file in which to save the key`. This accepts the default file location.    
    ```
    Enter a file in which to save the key (/Users/you/.ssh/id_rsa): [Press enter]
    ```
    
*  Press enter upon being prompted to `Enter passphrase (empty for no passphrase): [Type a passphrase]`.    
    ```
    Enter passphrase (empty for no passphrase): [Type a passphrase]
    Enter same passphrase again: [Type passphrase again]
    ```
    

### Start SSH Agent
* Execute the command below to Start the ssh-agent in the background.    
    ```bash
    eval "$(ssh-agent -s)"
    ```

### Create SSH Config File
* Execute the command below to create a new `config` file.
	```bash
	touch ~/.ssh/config
	```   

* Execute the command below to begin editing the newly created `config` file in `nano`
	```bash
	nano ~/.ssh/config
	```

* Paste the code below into the `config` file. Modify the value of the `IdentityFile` respectively.
    * If you chose to add a passphrase to your key, `UseKeychain` should be set to `yes`.
        
   ```
   Host *
   AddKeysToAgent yes
   UseKeychain no
   IdentityFile ~/.ssh/id_rsa
   ```
    


### Add SSH Key to SSH Agent    
*  Execute the command below to add your SSH private key to the ssh-agent and store your passphrase in the keychain. Ensure `id_ed25519` in the command is substituted with the name of your private key file.
    
   ```bash
   ssh-add ~/.ssh/id_rsa
   ```
    
    

### Adding SSH Key to Github

1. Execute the command below to copy the SSH public key to your clipboard.

  
   ```bash
   pbcopy < ~/.ssh/id_rsa.pub # Linux & OSX
   ```

   ```bash
   cat ~/.ssh/id_rsa.pub | clip # git-bash
   ```
    
2.  Navigate to [`https://github.com/settings/ssh/new`](https://github.com/settings/ssh/new) to generate a new key
    
3.  Paste your key into the "Key" field.<br>![The key field](https://docs.github.com/assets/images/help/settings/ssh-key-paste.png)
    
4.  Click **Add SSH key**.<br>![The Add key button](https://docs.github.com/assets/images/help/settings/ssh-add-key.png)
   
5.  If prompted, confirm your GitHub password.<br>![Sudo mode dialog](https://docs.github.com/assets/images/help/settings/sudo_mode_popup.png)


### Use Keychain Helper

#### Windows OS
* Execute the command below to ensure that once you are authenticated successfully, your credentials are stored in the Windows keychain and will be used each time you `push` or 
    * `git config --global credential.helper wincred`
    
#### MacOS
* Execute the command below to ensure that once you are authenticated successfully, your credentials are stored in the MacOS keychain and will be used each time you `push` or `pull` from an HTTPS URL. 
    * `git config --global credential.helper osxkeychain`