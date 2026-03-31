#!/bin/bash

echo Homebrew Uninstallation

echo Getting the list of installed packages
packages=$(brew list)

echo Uninstalling each package in the list
for package in $packages
do
  echo "Uninstalling $package..."
  brew uninstall $package
done

echo Cleaning up any leftover files and directories
echo "Cleaning up..."
brew cleanup

echo Running Homebrews uninstall script
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/uninstall.sh)"

echo Removing Homebrew directory and all its files
sudo rm -rf /usr/local/Homebrew

echo Removing Caskroom directory and all its files
sudo rm -rf /usr/local/Caskroom

echo Removing brew command
sudo rm -rf /usr/local/bin/brew

echo Homebrew Installation

echo Installing Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo Giving brew access
sudo chown -R $(whoami) /usr/local/Homebrew
sudo chown -R $(whoami) /usr/local/Cellar

echo Updating brew
git -C "/usr/local/Homebrew/Library/Taps/homebrew/homebrew-core" fetch --unshallow
brew cleanup