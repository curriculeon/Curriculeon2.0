# Windows Jenkins Docker Integration

### Get Docker Toolbox Environment Variables
* From Command prompt, execute the command below
    * `docker-machine create default`

* From Command prompt, execute the command below if the command above fails
    * `docker-machine create default --virtualbox-no-vtx-check`

[![](./docker-machine-create-default.gif)](docker-machine-create-default.gif)


* From Command prompt, execute the command below
    * `docker-machine env --shell=powershell | Invoke-Expression`
* The output should resemble the code block below



```bat
SET DOCKER_TLS_VERIFY=1
SET DOCKER_HOST=tcp://172.16.0.102:2376
SET DOCKER_CERT_PATH=C:\Users\user.docker\machine\machines\default
SET DOCKER_MACHINE_NAME=default
SET COMPOSE_CONVERT_WINDOWS_PATHS=true
REM Run this command to configure your shell:
REM @FOR /f "tokens=*" %i IN ('Docker-machine env default') DO @%i
```

### Add Docker Toolbox Environment Variables to Jenkins
* From the Jenkins Dashboard,
    1. select `Manage Jenkins`
    2. select `Configure System`
    3. select `Environment Variables` checkbox
    4. Add environment variable for each of the aforementioned Docker Toolbox Environment Variables respectively

```
DOCKER_CERT_PATH
DOCKER_HOST
DOCKER_MACHINE
DOCKER_TLS_VERIFY
```

### Restart Jenkins

<!--
https://stackoverflow.com/questions/40459280/docker-cannot-start-on-windows
https://stackoverflow.com/questions/57547149/jenkins-unable-to-connect-to-windows-docker-toolbox-daemon
-->