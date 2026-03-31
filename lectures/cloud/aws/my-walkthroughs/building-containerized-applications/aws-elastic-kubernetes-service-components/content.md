# Amazon Web Services
## AWS Elastic Kubernetes Service Components
Now that you know that Kubernetes is an open source tool
that you can use to deploy
and manage your container-based workloads at scale,
let's get into the details.
To really get up and running with Kubernetes,
you'll need to have an understanding of the concepts
and the terminology that Kubernetes uses.
The idea of container orchestration
is to manage the container lifecycle
in an abstracted and automated way.
You want to be able to deploy new container instances,
maybe one at a time or potentially as a group of containers.
You want to stop and retire old running container versions,
and you also need to manage the scaling of your containers,
manage the scaling of your hosts, and a lot more.
* Kubernetes allows you to deploy and manage your containers across a fleet of hosts and this fleet of hosts together is called your cluster.
* In Kubernetes, a cluster's composed of hosts that we call nodes or workers.
* Since you are using AWS, each node is an EC2 instance and you'll be using Kubernetes to place your container instances onto that EC2-based cluster.
* Kubernetes abstracts away a lot of the underlying details when it comes to your container management.
* You will work with an abstraction called Kubernetes objects and the Kubernetes API to represent and manage your cluster.
* The basic objects you will be interacting with are pods, services, volumes, and namespaces.

* A pod is a container or grouping of containers that you want to run.
    * A pod is a wrapper around your container that Kubernetes communicates with for management.
    * A pod might only have one container inside of it or it could have many.
    * If you have containers they need to share resources or are tightly coupled, you may choose to put those inside of one pod,
        * but this is actually considered an advanced use case, and when it comes time to scale, you can't break those pods apart into smaller pieces, so you would need to scale the entire pod horizontally or vertically.
    * It's most common to use pods as a wrapper for one singular container instance.
        * In that case, when you need more instances of a singular container, you can add more pods without affecting the other containers or pods running on the cluster.
    * Each pod has an IP address and you can define what ports it needs to communicate on between pods or between outside services and your container.
    * Your application might be made up of one or multiple pods, and this makes sense when you think about microservice architectures, which break your application up into many individual components.
    * When you have a pod or a collection of pods that you want to expose as a microservice, you would create what is called a service in Kubernetes.
    * Kubernetes has built-in service discovery using DNS or you can use other service discovery tools to expose your services to one another for communication and we will talk about this later in the course.






* All right, so far you know that
    * Kubernetes has clusters, which is made up of nodes,
    * that you run pods that get placed on those nodes and that,
    * a grouping of pods can be exposed as a service
* But one other important piece here is that containers are ephemeral,
    * meaning that any files that are saved or created on disk in a container would be lost when the container is stopped or restarted.
* This can be a problem for applications that need persistent disk storage which we have already talked about.
* Another problem we have already discussed is what if two containers in a pod need to share files?
* So it's probably no surprise to you at this point that the concept of volumes exist.
* Volumes are a Kubernetes object that represent directories that mount to pods, so containers have access to read and modify files in a persistent manner.
* The idea of Kubernetes volumes is very similar to the idea of Docker volumes.
* With Kubernetes on AWS, you can mount EBS volumes to pods as Kubernetes volumes, and check out the class notes for more information on that.


* The last basic Kubernetes object we're going to discuss are namespaces.
* Namespaces allow you to have multiple virtual Kubernetes clusters backed by the same physical cluster.
* This makes it easier to divide up cluster resources across multiple users or teams while isolating the resource names.
* This makes it so that two different teams could create services or other resources with the same name in different namespaces and not run into any conflicts.
* Okay, so you have this concept of Kubernetes objects now, but how do you actually manage and use these things?
* You will use Kubernetes objects to define the desired state of your cluster.
* You create these objects and you call the Kubernetes APIs which will kick off a series of processes to ensure that your cluster matches your various object definitions.
* State changes for your cluster may include things like, running a new pod, scaling your system, changing what images are being used for your container instances, changing network or disk resources and a lot more, too.
* The Kubernetes control plane is what is responsible for accepting these API calls, these Kubernetes objects and then carrying out the changes.
* The control plane is provided by something called the master.
* The master in a Kubernetes architecture is a collection of processes that are run on a host, and then invoked to manage your cluster and keep your desired state.
* For example, when it comes time to run a new pod, you would need to interact with the master node.
* You most likely wouldn't run the pod directly on a node and you also probably wouldn't call the Kubernetes API directly.
* The way you interact with a master node in Kubernetes is by using a Kube control or kubectl command line interface.
* So, if you want to create a new pod to run on your cluster, you would be able to call the API for that using the Kube control, providing your pod configuration and the master would then schedule that pod to be run on the nodes in your cluster.
* So you have multiple layers of things to manage here.
* You have to manage your master node, which is the control plane, and you also have to manage your cluster, which is the data plane.
* One option when looking to host Kubernetes on AWS is to host it on top of EC2 and fully manage it on your own.
* Let's take a look at a diagram to see what that may look like.
* All right, first you have the control plane.
* You may think of your master as one singular host, but in AWS, we recommend as a best practice that you spread your workload across multiple availability zones in order to have fault tolerance and high availability.
* And if you have one master and that master goes down, you're in trouble.
* So it's a best practice in this case that you have at least three masters in place for redundancy, so you would have one master in three availability zones.
* In this multi-master situation, you would need to ensure that some necessary processes are running across all the masters.
* These processes include Kube API server, which is the frontend for the control plane, Etcd, which is a key/value store that stores cluster data and this would need to be replicated and kept in sync across all the masters.
* The Kube Scheduler, which assigns new pods to nodes, and the controller manager process, which runs the controllers for your cluster, which do things like noticing and responding when nodes need to be rebooted or replaced, as well as replicating pods across nodes.
* Controllers are responsible for other things as well and there are multiple types of controllers, which you can read about in the class notes.
* So to run this on EC2, you need to provision the infrastructure needed for your master servers, configure all the processes needed and set up replication.
* The provisioning and configuration of these masters should be automatic.
* You can use AMIs and user data scripts to help you bootstrap your instances without human interaction.
* You would need to manage the lifecycle of those AMIs and scripts, as well as have configuration management processes in place.
* Beyond having these three masters in place, you also would want to set up EC2 auto scaling, so that if one of the masters goes down, it will be automatically replaced and replication would be restored.
* Next, you need to think about your worker nodes.
* Your worker nodes will be placed inside of your VPC, and would ideally be spread across three AZs.
* Kubernetes itself is not aware of the AWS availability zone concept, so you'll need to ensure that your nodes are spread evenly across zones for redundancy.
* The nodes would also need to be configured to talk to the master.
* To enable this communication, you would ensure the nodes are running the kubelet node agent, running Docker, and that they're running any other processes needed for Kubernetes or any customizations that you may need.


* Finally, as you place your pods onto your nodes, you'll want to make sure that those are also spread across those AZs as well.
* It's a good idea to surround your nodes with auto scaling groups.
* That way, if nodes become unhealthy, you can terminate the unhealthy nodesand replace them with healthy ones.
* So as you can see, this gets pretty complicated to set up and we really are just scratching the surface here with Kubernetes.
* Luckily, there is a managed service called Amazon Elastic Kubernetes Service that can take care of some of this complexity for you.
* So stay tuned and you'll learn more about EKS.
