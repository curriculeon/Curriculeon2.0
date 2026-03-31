# Uploading `.jar` to `packagecloud.io` for Private/Custom Dependency Imports

## Install `ruby`
1. Click [here](../installation/content.md) to view instructions on how to download Maven
  * After the installation is complete, <u>exit out of the terminal</u>.
2. Click [here](https://curriculeon.github.io/Curriculeon/lectures/ruby/installation/content.html) to view instructions on how to download ruby
  * After the installation is complete, <u>exit out of the terminal</u>.
3. From a new terminal execute the command below
  * `gem install package_cloud`
  * After the installation is complete, <u>exit out of the terminal</u>.

## Create `package_cloud` account
* Navigate to [packagecloud.io](https://packagecloud.io/users/new) to create a new account.
  * **DO NOT** click _Sign Up With Github_
  * **DO NOT** click _Sign Up With Bitbucket_
* Ensure that you create a new account using <u>email and password</u>.


## Deploy
1. Click [here](./deploy.sh) to download the file for deploying a maven artifact to `packagecloud.io`
2. Move the `deploy.sh` script to the root directory of the maven project you would like to deploy.
3. From a bash terminal, navigate to the root directory of the maven project you would like to deploy.
4. Execute the command below to give the `deploy.sh` script executable permissions
  * `chmod u+x deploy.sh`
5. Execute the command below to run the `deploy.sh` script
  * `./deploy.sh`