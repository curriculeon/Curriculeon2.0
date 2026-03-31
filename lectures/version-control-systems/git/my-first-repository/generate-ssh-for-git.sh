#!/bin/bash

username=$1
emai=$2
# reset git config
git config --system --unset credential.helper

# set git config 
git config --global user.name $username
git config --global user.email $email

# generate ssh-key used for authentication
ssh-keygen -t rsa -m PEM -C $email

# copy ssh-key to clipboard
clip < ~/.ssh/ida_rsa.pub
pcbopy < ~/.ssh/ida_rsa.pub


echo navigate to https://github.com/settings/keys and paste the contents of your clipboard