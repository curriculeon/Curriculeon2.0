# Hyper-V Installation

### Check If Hyper-V is Enabled
* Execute the command below to check if Windows Hyper-V is enabled
    * `systeminfo.exe | sls "Hyp"`

[![](./img/systeminfo-sls-hyp.gif)](./img/systeminfo-sls-hyp.gif)

### Enable Hyper-V
* Execute the commands below from administrative Powershell to enable Hyper-V

```ps1
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
```

[![](./img/enable-windowsoptionalfeature-hyperv-failed.gif)](./img/enable-windowsoptionalfeature-hyperv-failed.gif)



```ps1
DISM /Online /Enable-Feature /All /FeatureName:Microsoft-Hyper-V
```


[![](./img/dism-windowsoptionalfeature-hyperv-failed.gif)](./img/dism-windowsoptionalfeature-hyperv-failed.gif)


### Disable Hyper-V
* Execute the commands below from administrative Powershell to disable Hyper-V

```ps1
Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Hypervisor -All
DISM /Online /Disable-Feature:Microsoft-Hyper-V
```