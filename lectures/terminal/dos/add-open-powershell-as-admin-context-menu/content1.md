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
Windows Registry Editor Version 5.00

[HKEY_CLASSES_ROOT\Directory\shell\OpenElevatedPS]
@="Open PowerShell here as administrator"
"Icon"="powershell.exe"
"HasLUAShield"=""

[HKEY_CLASSES_ROOT\Directory\shell\OpenElevatedPS\command]
@="PowerShell -windowstyle hidden -Command \"Start-Process cmd.exe -ArgumentList '/s,/c,pushd %V && powershell' -Verb RunAs\""

[HKEY_CLASSES_ROOT\Directory\Background\shell\OpenElevatedPS]
@="Open PowerShell here as administrator"
"Icon"="powershell.exe"
"HasLUAShield"=""

[HKEY_CLASSES_ROOT\Directory\Background\shell\OpenElevatedPS\command]
@="PowerShell -windowstyle hidden -Command \"Start-Process cmd.exe -ArgumentList '/s,/c,pushd %V && powershell' -Verb RunAs\""

[HKEY_CLASSES_ROOT\Drive\shell\OpenElevatedPS]
@="Open PowerShell here as administrator"
"Icon"="powershell.exe"
"HasLUAShield"=""

[HKEY_CLASSES_ROOT\Drive\shell\OpenElevatedPS\command]
@="PowerShell -windowstyle hidden -Command \"Start-Process cmd.exe -ArgumentList '/s,/c,pushd %V && powershell' -Verb RunAs\""

[HKEY_CLASSES_ROOT\LibraryFolder\background\shell\OpenElevatedPS]
@="Open PowerShell here as administrator"
"Icon"="powershell.exe"
"HasLUAShield"=""

[HKEY_CLASSES_ROOT\LibraryFolder\background\shell\OpenElevatedPS\command]
@="PowerShell -windowstyle hidden -Command \"Start-Process cmd.exe -ArgumentList '/s,/c,pushd %V && powershell' -Verb RunAs\""
```

* The original article suggesting this solution can be found [here](https://winaero.com/powershell-administrator-context-menu-windows-10/).




### Open Windows PowerShell Here as Administrator

[<img src="./download-open-powershell.gif">](./open-as-admin-here.gif)






### Execute Script from Powershell

[<img src="./execute-powershell-script.gif">](./execute-powershell-script.gif)
