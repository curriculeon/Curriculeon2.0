# Troubleshooting: AWS ECS Deploy Containerized Flask Application

# Overview
1. Create an AWS Account
2. [Install and Configure AWS CLI](https://curriculeon.github.io/Curriculeon/lectures/cloud/aws/cli-installation/content.html)
3. [Install Docker](https://curriculeon.github.io/Curriculeon/lectures/containerization/docker/installation-windows7/content.html)
4. Create a or [clone flask application with a docker file](https://github.com/curriculeon/docker.python.flask_projecttemplate)
5. Create Docker Image from `Dockerfile`
6. Run and View Docker Image Locally
7. Create Repository in ECS Registry








## Create Docker Image from `Dockerfile`
* Execute the command below from the root directory of the newly created project `Dockerfile`
   * `docker build -t my-flask-app .`


### Troubleshooting

#### Command Fails Without Docker Daemon Running

[![](./create-docker-image-fails.gif)](./create-docker-image-fails.gif)

#### Command Fails With Docker Daemon Running

[![](./create-docker-image-fails-with-daemon-running.gif)](./create-docker-image-fails-with-daemon-running.gif)



#### Ensure Docker Credential Desktop Executable is on Path
* Execute the command below to ensure `docker-credential-desktop.exe` is on Path
   * `docker-credential-desktop.exe version`

[![](./docker-credential-desktop-version.gif)](./docker-credential-desktop-version.gif)


#### Rename credsStore to credStore
* In `~/.docker/config.json` change `credsStore` to `credStore`

[![](./docker-config-rename-credstore.gif)](./docker-config-rename-credstore.gif)


#### Re-attempt to build the image

[![](./docker-build-myflaskapp.gif)](./docker-build-myflaskapp.gif)





<hr><hr>


## Run Docker Image
* Execute the command below from the root directory of the project
   * `docker run -p 80:80 my-flask-app`
* View the application by navigating the to the link below
   * [`http//localhost:8080/`](http//localhost:80/)

[![](./docker-run-myflaskapp.gif)](./docker-run-myflaskapp.gif)





## Create Repository in Elastic Container Registry
Execute the command below to create a repository in the elastic container registry
* `aws ecr create-repository --repository-name my-flask-application-01.06.2021`



## Authenticate with newly created ECR repo
* Execute the command below to print a command used to log into the newly created ECR repository.
   * `aws ecr get-login --region us-east-1 --no-include-email`
* Copy the output of that command.
* Paste and run the output in the terminal.
* This will actually authenticate you with the ECR so you can push your Docker image into it.


## Push to newly authenticated repo
* Execute the commands below to `tag` and `push` the image to the AWS ECR _(where `ACCT_ID` is your own AWS account ID)_
   * Execute command below to tag image
      * `docker tag my-flask-app:latest ACCT_ID.dkr.ecr.us-east-1.amazonaws.com/` 
   * Execute command below to push image up to AWS ECR
      * `docker push ACCT_ID.dkr.ecr.us-east-1.amazonaws.com/hello-world`