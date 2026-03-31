# Amazon Web Services
## Persistent Storage

* let's look at important technologies being utilized that will come into play with persistent storage.

-
### Images
* Images are made from stackable layers which help to deploy changes quickly and effectively.
* The image layers combine with a writeable top container layer to make up the container.
* When a container is removed, it is the top writeable layer that is being removed leaving behind the underlying image layers.


-
### Problem With Persistent Data With Containers
* As a result of using copy-on-write for the top writeable layer, when the container is removed, associated data is lost.
* In order to have persistent data with containers, the data needs to be externalized and persisted outside of the container and not applied as a container layer.


-
### Solution to Persistent Data With Containers
* Well, there are a couple of options I want to talk about.
    * bind mount
    * volumes

-
### Mount
* A bind mount, or mounts for short, is a file or folder stored anywhere on the container host file system and mounted into a running container.

-
-
### Using Mount
* When using a mount, you need to set the mount flag when running a new container and specify the source folder on the container host.
* Unlike volumes
    * mounts can actually be modified by processes outside of your container management.
    * mounts provide an easy way to access the underlying files from the host
    * data is not initialized
    * it is common to run into permission issues

-
### Volumes
* The second option is to use volumes.
* Volumes are stored by the host file system as well, but they are exlusively managed by the container agent.

-
-
### Using Volumes
* Volumes still utilize the mount flag to specify the volume to be mounted to a new container.
* But instead of specifying a local directory, you specify the name of the volume that you want to mount to the container.
* In terms of the preferred method, you should go with volumes.
* Volumes still make it easy to access persistent data on the underlying host, but permission issues are far less common than mounts and volumes provide the additional capability to access non-local storage systems such as NFS mounts.

-
### EBS Host Storage
* In AWS, I do want to point out that if you're using Amazon Elastic Block Store volumes or EBS for your underlying host storage, the EBS volumes are specific to availability zones and cannot be mounted across AZs or to multiple Elastic Compute Cloud instances at the same time.
* If trying to share volume access across containers, the containers would need to be on the same underlying instance or the volume would need to be cloned using an EBS Snapshot and then creating a new volume.
