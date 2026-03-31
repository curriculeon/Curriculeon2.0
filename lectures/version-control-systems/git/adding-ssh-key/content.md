# Generating SSH Key for Authentication


### Video Tutorial
<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./generate-ssh-token.mp4">
</video>

1. Download [this file](./generate-ssh-key.sh) to your `~/Downloads` directory.
2. Execute the command below to change directories to `~/Downloads`.
    * `cd ~/Downloads`
3. Execute the command below to ensure the newly downloaded `generate-ssh-key.sh` file can be executed
    * `chmod u+x ./generate-ssh-key.sh`
4. Execute the command below to execute the newly downloaded `generate-ssh-key.sh` file.    
    * `./generate-ssh-key.sh MY_GITHUB_EMAIL`
        * _replace `MY_GITHUB_EMAIL` with the email you used to create a github account._
        * this command will **copy** the key to your clipboard, allowing you to **paste** it in the next step.
5. Navigate to [`https://github.com/settings/ssh/new`](https://github.com/settings/ssh/new) to paste the value from your clipboard to a newly generated key