# Add `Open PowerShell As Admministrator Here` to Context Menu

## Instructions
* Execute the `.reg` file below to add `Open PowerShell As Admministrator Here` to context menu.
* Alternatively, you can click [here](./open-powershell-as-admin-here.ps1) to download the file directly.
    * Upon downlodaing, `Unblock` the file from the `File Properties` menu.
    * After unblocking the file, open powershell as administrator.
    * From the Admin Powershell terminal, navigate to the directory where the `open-powershell-as-admin-here.ps1` was downloaded.
    * From the parent directory of `open-powershell-as-admin-here.ps1` execute the command below.
        `start ./open-powershell-as-admin-here.ps1`



### Powershell Script

```powershell
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
$menu = 'Open Windows PowerShell Here as Administrator'
$command = "$PSHOME\powershell.exe -NoExit -NoProfile -Command ""Set-Location '%V'"""

'directory', 'directory\background', 'drive' | ForEach-Object {
    New-Item -Path "Registry::HKEY_CLASSES_ROOT\$_\shell" -Name runas\command -Force |
    Set-ItemProperty -Name '(default)' -Value $command -PassThru |
    Set-ItemProperty -Path {$_.PSParentPath} -Name '(default)' -Value $menu -PassThru |
    Set-ItemProperty -Name HasLUAShield -Value ''
}
```

* The original article suggesting this solution can be found [here](https://superuser.com/a/1014211).




### Open Windows PowerShell Here as Administrator

[<img src="./download-open-powershell.gif">](./open-as-admin-here.gif)






### Execute Script from Powershell

[<img src="./execute-powershell-script.gif">](./execute-powershell-script.gif)
