# Homebrew Installation
<!-- 
use the line below to migrate brews from Cellar to bin
ls /usr/local/Cellar | awk '{ print $1 }' | xargs brew reinstall
 -->

 1. [Give Full Disk Access to the Terminal](../full-disk-access/content.md)



<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="../full-disk-access/full-disk-access.mp4">
</video>


* Execute the commands below to install `brew` CLI.
  * installs brew
    * `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
  * gives brew access
    * `sudo chown -R $(whoami) /usr/local/Homebrew`
    * `sudo chown -R $(whoami) /usr/local/Cellar`
  * updates brew 
    * `git -C "/usr/local/Homebrew/Library/Taps/homebrew/homebrew-core" fetch —unshallow`
    * `brew cleanup`


<video width="device-width" height="480" style="border:1px solid green" controls>
  <source type="video/mp4" src="./installing-homebrew.mp4">
</video>


# Troubleshooting
## Phase 1
* If you have issues with installation, try each of the following steps
  1. [Give Full Disk Access to the Terminal](../full-disk-access/content.md)
  2. [Uninstall Homebrew](../uninstall-brew/content.md)
  3. [Reinstall Homebrew](#homebrew-installation)



## Phase 2
* If the steps in Phase 1 still fail for you, attempt the steps below
  1. [Hardinstall Homebrew](../hardinstall-brew/content.html)
