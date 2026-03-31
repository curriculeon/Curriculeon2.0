# My First Jenkins Python Unittest Pipeline

## Start Jenkins Server
* Execute the commands below to start the Jenkins server

```
start chrome http://localhost:8080/
start jenkins start
```

[<img src="./start-jenkins-server.gif">](./start-jenkins-server.gif)


## Create New Job
* Name project
* Select `Freestyle Project`

### Source Control Management
* From the source control management section, select `Git`
* Paste the URL to your **your repository**
* Set the `Branches to build` field to have the following value:
    * `*/master`

### Build Triggers
* From the build triggers section, check `Poll SCM`.
* In the `Schedule` text box, enter the text below
    * `*/5 * * * *`

### Build
* From the `Build` section, select `add build step`
* In the `command` field, enter the text below to ensure python runs all the unittests in the project upon building.
    * `python -m unittest discover -s ./src/test/ -p '*_test.py'`



[<img src="./my-first-python-pipeline-failure.gif">](./my-first-python-pipeline-failure.gif)