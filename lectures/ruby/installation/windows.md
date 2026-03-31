# Ruby Installation

### Ruby Installer
* Ensure you download version [`2.7.2-2 (x64)`](https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.7.2-1/rubyinstaller-devkit-2.7.2-1-x64.exe) or [use the wizard](./windows.wizard.md)
	* `choco install ruby --version=2.7.2.1`

[<img src="./install-ruby.gif">](./install-ruby.gif)

### Ruby DevKit Installer
* Execute the command below to download and install Ruby or [use the wizard](./windows.wizard.md)
	* `choco install ruby2.devkit`

[![](./install-ruby2devkit.gif)](./install-ruby2devkit.gif)

### Install MSYS2 with `ridk` (Ruby Installer Development Kit)
* Execute the commands below to 
	* refresh environment variables
	* set execution policy
	* install development toolchain and [`msys2`](https://www.msys2.org/), and update `msys2`.


```ps1
refreshenv
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned 
ridk install 1 2 3
```

[![](./install-ridk.gif)](./install-ridk.gif)