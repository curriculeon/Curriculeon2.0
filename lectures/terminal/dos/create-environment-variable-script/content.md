## Find Executable File Path
* Execute the commands below to find the path of the executable file.
* Replace `${executable-name.exe}` with the respective executable name.
    * for example `jenkins.exe`, `pycharm.exe`, `chrome.exe`
* Store the path temporarily

```bat
cd %systemdrive%\
dir /s /b "*${exectuable-name.exe}"
```

[![](./find-jenkins-executable.gif)](./find-jenkins-executable.gif)


## Set Environment Variables

* Set the environment variable for this executable path by executing the command below
    * `SETX JENKINS_HOME "C:\Program Files (x86)\Jenkins\jenkins.exe"`
        * to create jenkins home-path
    * `SETX JENKINS "%JENKINS_HOME%\jenkins.exe"`
        * to create jenkins path
    * `SETX /M PATH "%PATH%;%jenkins%"
        * to add jenkins to path
    * `refreshenv`
        * to Update SessionEnvironment


[![](./set-environment-variable.gif)](./set-environment-variable.gif)
