# Windows Subsystem For Linux

## Instructions

### Video Tutorial

<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./tutorial.mp4">
</video>

### Enable Windows Subsystems For Linux
* Ensure that `Windows Subsystems for Linux` is enabled
* Hold `Windows` and press `R` to open the `run` window.
    * Enter `OptionalFeatures` in the `run` window text box.
* Check `Windows Subsystems for Linux`

[<img src="./windows-subsystems.gif">](./windows-subsystems.gif)

### Restart Your Machine

<hr><hr>


### Install from Powershell

* Execute the command below from an administrative powershell.

```ps1
Enable-WindowsOptionalFeature -Online -FeatureName $("VirtualMachinePlatform", "Microsoft-Windows-Subsystem-Linux")
```

[![](./ps1-windows-subsystems-for-linux.gif)](./ps1-windows-subsystems-for-linux.gif)


### Restart Your Machine

<hr><hr>




### Update WSL
* Execute the command below from an administrative powershell to shutdown wsl
    * `wsl --shutdown`
* Execute the command below from an administrative powershell to start and update wsl
    * `wsl --update`