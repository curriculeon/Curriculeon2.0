# Kubernetes Installation# Docker image union files
Now that you know what a Docker File is,
and what sort of instructions you can include
in your Docker File, let's talk about how Docker
actually builds, stores, and runs Docker containers.

-
## Layers
* When you take a Docker File and build an image, each instruction in the Docker File creates what is called a layer.
* Layers are just files generated from running a command.
* These layers are read only, meaning they cannot be modified.
* And they are stacked together to build container images.


-
## Demonstration
* To really get an understanding of this idea, let's build a Docker File and see what happens.
* So as you can see here, I'm already up and running and logged in to my Cloud9 instance.
* And I've already pulled up the Docker File that we went over in the last video.

-
-
## `cd` into docker file parent
* First what I'm going to do is change directories into the directory that has my Docker File.
* So I'm going to just `cd` into my Python web app.
* You can see here, I'm going to this Python web app folder
    * and the Docker File is in that folder.


-
-
### `docker build`
* then from there, I'm going to run the `docker build -t pythonwebapp .` and then dot because we're in that folder already.
* And as you can see here, each instruction that is being executed is going to be executed in order.
* You can see from the output of the command we just ran, this is executing each instruction in order.
* You can see here, step eight, nine, 10.

-
-
### `docker inspect`
* Each instructions that is executed is potentially creating a layer or using an existing layer if this image has been built before or if it already exists on the host.
* So now that the image is done building, let's run the Docker inspect command to view the different layers that we have.
* So I'm going to run docker inspect, and then I'm going to go ahead and grab the ID for the image.
* And here you can see we have eight layers listed for this image.

-
## layers
* Each layer is essentially a dif from one instruction to another.
* Each layer that gets created is read only and then stacked together to build the image which serves as a template for creating your container.
* Since each layer is independent and then stacked together to form the image, any common layers that exist between images can be shared and do not need to be duplicated.


-
-
### implications of layers
* if another Docker File is built that also used the Ubuntu base image, it would share that base layer.
* Not download or create a new copy.
* This means that the image takes up less space on disk, since it minimizes duplication.



-
## Union File System
* Docker uses what is called a _union file system_ for the efficient storage of these layers.
* Or what you could think of as the building blocks for your container.
* A union file system allows you to overlay multiple layers so they appear as a unified view to the container.
* If a file that exists in a lower layer is modified by a higher layer, the container will use the modified file, which comes from a copy that was made in the modifying layer.
* Not the original copy from the lower layer.


-
### modifying files from<br>application within container
* So what about when a process or application running in a container needs to modify a file?
* though images are read only, when a container is run from an image, Docker mounts a writable layer on top of the lower, read only layers.
* This writable layer allows any processes or applications running inside the container a place to modify or create files.

-
## Copy-On-Write strategy<br>(COW optimization)
* For example, if you want to change a file that exists in a lower layer, then the file would be copied from the read only layer into the writable layer and modified there.
* The read only version of the file will remain unchanged but is now hidden underneath the copy in the writable layer.
* This is called the copy-on-write strategy.

-
-
### implications of COW optimization
* By using the copy-on-write strategy, all the read only layers of the image remain unchanged, which means they can be shared by multiple different running container instances.
* This sharing across images helps promote smaller image sizes.
* So the image is shared, but each container get its own, writable top layer.

-
-
### writable container layer
* writable top layer stays relatively small by [lazy loading](https://en.wikipedia.org/wiki/Lazy_loading) data into the writable layer.
* By default, all files created in a container are stored in this writable container layer.
    * by removing a container, all of the data in the writable layer would also be lost.
    * ephemeral nature of the writable layer should be leveraged for temporary or scratch data.

-
## Docker Volumes
* for persistent data, or data shared across containers, leverage a Docker volume.
* volumes exist outside of the lifecycle of container and is managed by Docker.
* removing a container, will not remove the data in the volume.


-
## Summary
* So let's go ahead and summarize what we learned.
* When you build your Docker File, each instruction in the Docker File creates a layer.
    * layers are then stacked together to build container images.
    * layer is read only and is shared across images when common layers exist.
* When a container is run from an image, a writable layer is added on the top, where files can then be modified.
    * this is known as _COW optimization_
* Docker uses a _union file system_ and the _copy-on-write strategy_ to manage the layers in an efficient way.