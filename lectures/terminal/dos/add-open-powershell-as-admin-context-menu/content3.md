# Add `Open PowerShell As Admministrator Here` to Context Menu

## Instructions
* Execute the `.reg` file below to add `Open PowerShell As Admministrator Here` to context menu.
* Alternatively, you can click [here](./open-powershell-as-admin-here.reg) to download the file directly.
    * Upon downlodaing, `Unblock` the file from the `File Properties` menu.
    * After unblocking the file, open powershell as administrator.
    * From the Admin Powershell terminal, navigate to the directory where the `open-powershell-as-admin-here.ps1` was downloaded.
    * From the parent directory of `open-powershell-as-admin-here.ps1` execute the command below.
        `start ./open-powershell-as-admin-here.ps1`



### Powershell Script

```powershell
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\shell\runas]
@="Open Windows PowerShell Here as Administrator"
"HasLUAShield"=""

[HKEY_CLASSES_ROOT\Directory\shell\runas\command]
@="$PSHOME\powershell.exe -NoExit -NoProfile -Command \"Set-Location '%V'\""
```

* The original article suggesting this solution can be found [here](https://www.askvg.com/guide-how-to-create-registry-script-reg-files-in-windows/).




### Open Windows PowerShell Here as Administrator

[<img src="./download-open-powershell.gif">](./open-as-admin-here.gif)


### Remove Context Menu Item
[<img src="./remove-context-menu.gif">](./open-as-admin-here.gif)