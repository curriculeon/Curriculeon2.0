# Create Command Line Arguments From RegEdit

* Open the `Run` window by holding `Windows` and pressing `R` on the keyboard.
* Execute `regedit` from the `Run` window.
* Enter `Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\App Paths` in the address bar of the `regedit` window.
* Right click on `App Paths` and select `New` > `Key` from the Menu.
* Enter `pycharm.exe` as the name of the key.
* Double click on the `default` value listed to edit it.
    * Enter the full path of `pycharm.exe` as it lives on your machine.

[<img src="./regedit-pycharm.gif">](./regedit-pycharm.gif)
