# Docker Compose Installation


## Linux OS
* Execute the commands below from a terminal

```bash
sudo apt update
sudo apt install curl
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker–compose –version
```
<!-- https://phoenixnap.com/kb/install-docker-compose-on-ubuntu-20-04 -->


## Mac OS
* Execute the command below from a terminal
    * `brew install docker-compose`

## Windows
* Execute the command below from a terminal
    * `choco install docker-compose`

[<img src="./choco-install-docker-compose.gif">](./choco-install-docker-compose.gif)