# Amazon Web Services
## Elastic Container Registry
*  registries are repositories for images that enable you to securely hold and provide access.

-
### Code Repositories
* an application developer leverages code-repositories services to deliver and manage a code-base.
* After you put the code into a code repository, others can download it from the registry service.
* examples of code repositoy services
    * github
    * bitbucket

-
### Image Registry
* a cloud software engineer leverages image-registry services to deliver and manage images
* After you put the image into a image registry, others can download it from the registry service.
* examples of image registry services
    * Docker Hub
    * AWS Elastic Container Registry

-
-
### Docker Hub
* While this can provide some advantages, there are also some considerations when looking at using a public registry service.
* An advantage would be the community.
* The Docker Hub community images contain millions of available images that can be utilized.
* These contain verified and licensed software as well as various configurations meant to offer helpful tools for you to use.


-
### Public Registry
* But, while that may all sound great, a public registry isn't going to work for a lot of used cases, especially for security reasons.
* This is where private registries come into play.
* Private registries allow you to have a privately hosted service that can help with management of the images and provide strict access.
* Because they're private, this allows your internal applications to be protected while still being accessible.


-
-
### AWS ECR
* And while you have access to this through services like Docker Hub, you also have an AWS service called Amazon Elastic Container Registry, or ECR.
* ECR is managed AWS Docker Registry service that is secure, scalable, and reliable.
* It supports private Docker repositories with resource-based permissions using AWS IAM so that specific users or virtual machines can access repositories and images.

-
### Advantages of ECR
* With ECR, you get the ability to use native Docker tooling while also getting a managed service that handles the scaling and durability for you.
* If you were to try and run your own private registry, two major concerns would be scalability and durability.
* Private registries are often hosted within an environment, whether cloud or on prem, using servers to manage the calls made by the Docker CLI.

-
-
### Scaling ECR
* Scaling these becomes difficult as the constant provisioning of more servers, just to handle the management of the images can grow drastically.
* When you also consider the level of replication in order to head higher levels of durability, the level of infrastructure management can quickly grow out of control.

-
-
### Durability of ECR
* As mentioned earlier, you could use a service like Amazon S3 for holding your images, where you get very high levels of availability and durability, but then access to the images would have to be handled through additional tools instead of the Docker CLI.
* Additionally, you still have the ability to control access through your IAM policies, but also you're able to use repository policies to control access to individual repos and the images contained within.