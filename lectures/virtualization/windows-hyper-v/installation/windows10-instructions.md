# Hyper-V Installation

## Overview
* Install Hyper-V PowerShell Module in Windows 10


### Install Hyper-V PowerShell Module in Windows 10
* Execute the command below from an elevated PowerShell
    * `Get-WindowsOptionalFeature -Online -FeatureName *hyper-v* | select DisplayName, FeatureName`