# Docker CLI



## Overview
* You start with a Docker file and list out everything you need for your _container_.
    * The operating system, the software, and any other necessary information.
* When you build a Docker file it results in a Docker image.
    * an _image_ is a read-only lightweight executable snapshot of the operating system's state.
* executing `docker run ${name-of-image}` results in a container on a Docker host.



### 3 Main Components of Docker
* Docker has 3 main components.
    1. The Docker daemon.
    2. The Docker CLI.
    3. And the image registry.
* We'll be talking about each of these components





### Docker Client
* The Docker client provides developers a way to interact with Docker through a Command Line Interface or CLI.
* This is how you issue commands to Docker to build your containers, run your containers, or stop your containers.
* When you use the CLI you'll type a command into your terminal that starts with `Docker`.





### Docker Client API
* run the `docker stop` command to stop the containers
* commands can manage the complete lifecycle of the containers.
    * `docker create`
        * creates a container but does not start it
    * `docker run`
        * creates and starts a container in one operation
    * `docker rm`
        * deletes a container




### Docker Daemon
* the environment to interpret and execute the client commands
* Provides container access to
    * network ports
    * storage volumes
    * or any other components at the operating system level







### Docker Image
* The blueprint for how to build a _container_ is called a Docker image.
    * A _container_ is a running instance of an image
* An image is a lightweight executable package that includes everything a system needs in it.
    *  application code, software, dependencies, and config variables.
* They are read only artifacts.
    * A container cannot be changed unless you build a new image.
* After creating an image, we place it in the Image Registry.






### Image Registry
* the _Image Registry_ is a place to store your Docker images
* A registry makes it possible for the Docker daemon to retrieve your Docker images.
* It is analogous to a source code repository, like [github](github.com), to store your code.
    * [dockerhub](hub.docker.com) is an non-AWS alternative





### Image Registry Behaviors
* The image registry allows you to
    * `push` your container images as needed.
    * `pull` your container images as needed.





### Image Registry Accessibility
* Registries can be either
    * `public` - images are shared with the whole world.
    * `private` - images are only shared amongst members of an enterprise or a team.




### Creating container 
* To instantiate an image is to create a container from an image.
* A container is a running instance of an image
* You can think of it as an encapsulated environment to run your applications that only has access to the resources that are provided in the Docker image.
* To create a container on a Docker host from the Image Registry, `docker run` through the Docker CLI.
* The Docker client will then delegate that command to the Daemon.



### `docker run`
* `docker run` takes care of everything you need to start up a container.
* Upon receiving the `run` command, the Daemon _lazy fetches_ the
    * If the image does not exist, on host, then `pull` image from Image Registry to host.
    * Use image on host to create container.



### Docker File
* So how do we get the image in the first place?
* That would be through something called a Docker file.
* A Docker file is a plain text, standardized template, that you create with instructions that informs Docker how your image should be built.





### Docker File
#### (Continued)
* It's a script that contains a list of commands that the Docker client will call when putting your image together.
* It includes instructions for provisioning
    * operating system installation
    * prerequisite software installation
    * additional dependency installations
    * environment configuration
* When you use the `docker build` command through the CLI, on a particular Docker file, it results in a Docker image.




### Summary
* Now that we have all the pieces lets quickly summarize this.
* You start with a Docker file and list out everything you need for your container.
    * The operating system, the software, and any other necessary information.
* When you build a Docker file it results in a Docker image.
    * Which is just a lightweight executable package.
* When you run that executable using that Docker run command it then results in a container on a Docker host.