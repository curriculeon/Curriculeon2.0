# Virtual Box Ubuntu Installation


## Overview
1. Prerequisites
2. Download Ubuntu
3. Install Ubuntu Iso
4. Install Ubuntu OS
5. Install Guest Additions

### Prerequisites
* [Install Virtualbox](../installation/index.md)


### Download Ubuntu
* Navigate to the link below to download an Ubuntu disk image.
    * [`https://ubuntu.com/download/desktop`](https://ubuntu.com/download/desktop)

[![](./img/download-ubuntu.gif)](./img/download-ubuntu.gif)



### Create Ubuntu Virtual Disk Image
* From Virtualbox
    * Select `New`
    * Enter name of Virtual Machine
    * Enter amount of RAM to allocate to Virtual Machine
    * Enter amount of storage to allocate to Virtual Machine

[![](./img/create-ubuntu-vdi.gif)](./img/create-ubuntu-vdi.gif)


### Enable Bidirectional Clipboard
* Select `Settings > General > Advanced`.
    * Ensure `Shared Clipboard` is enabled
    * Ensure `Drag'N'Drop` is enabled

[![](./img/enable-bidirectional-clipboard.gif)](./img/enable-bidirectional-clipboard.gif)


### Install Ubuntu ISO
* From Virtualbox, launch the newly created `Ubuntu` virtual machine.
* Upon being prompted, navigate to the newly downloaded `Ubuntu` disk image.

[![](./img/install-ubuntu-iso.gif)](./img/install-ubuntu-iso.gif)



### Install Ubuntu OS
* Launch the `Ubuntu` virtual machine

[![](./img/install-ubuntu-os.gif)](./img/install-ubuntu-os.gif)



### Install Prerequisite Packages
* Execute the command below from a terminal to install prerequisite packages.
    * `sudo apt install linux-headers-$(uname -r) build-essential dkms`


[![](./img/install-prerequisite-packages.gif)](./img/install-prerequisite-packages.gif)




### Install Guest Additions
* Execute the command below from a terminal to install virtualbox guest additions.
    * `sudo apt-get -y install virtualbox-guest-utils`



[![](./img/install-guest-additions.gif)](./img/install-guest-additions.gif)


### Insert Guest Additions CD
* Insert guest additions CD and follow prompts

[![](./img/install-guest-additions-cd.gif)](./img/install-guest-additions-cd.gif)

### Restart the machine
* Execute the command below from a terminal to restart the virtual machine.
    * `sudo shutdown -r now`

[![](./img/sudo-reboot-now.gif)](./img/sudo-reboot-now.gif)

### Verify Guest Addition installation
* Resize the window to ensure that the guest operating system is resized respectively.

[![](./img/verify-guest-additions-installation.gif)](./img/verify-guest-additions-installation.gif)