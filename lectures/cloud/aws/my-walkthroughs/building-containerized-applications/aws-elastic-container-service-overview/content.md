# Amazon Web Services
## Elastic Container Service



-
* Now that you're an expert on why container orchestration services are needed, we're going to talk about one of the container orchestration services from AWS called Amazon ECS, or Elastic Container Service.



-
### ECS Planes
* ECS, like most container based solutions, is broken up into two pieces.
    * A control plane and data plane.
* Let's go ahead and define these two terms.

-
### Control Plane
* In the cloud, control planes are generally responsible for
    * provisioning software,
    * any user or service requested configurations
    * managing the lifecycle of resources.
* They're also responsible for helping the data plane do its work.

-
### Data Plane
* A data plane provides capacity so that it can run whatever work the control plane tells us it needs to.

-
### Analogy
* A helpful analogy for the two planes is your day job.
* Think about a time when your boss gave you a command, and you performed that command.
    * For example, my boss could say something like, "Hey Leon, come teach us about ECS "in a containers course." "

-
### Control Plane
* My boss issuing this command is an example of a control plane.
* He provisions the work to me, and helps manage the lifecycle of the request.

-
### Data Plane
* The worker, A.K.A. me in this scenario, is an example of the data plane because I am responsible for getting the request done, and provisioning the necessary capacity out of my work day to help this request be completed.

-
### ECS Features
* So how does this all relate back to ECS features?
* Well, ECS is a managed service that makes it easy to
    * run, stop and manage Docker containers on a cluster of EC2 instances, or on top a managed platform like Fargate.
* From the last sentence I just said, you probably already gathered that at the lowest level, you need to run a cluster of EC2 instances, and your containers will be placed across this cluster.

-
### ECS Features<br>(Continued)
* When you first use ECS, a default cluster is created for you, but you can create additional clusters for your workloads as you see fit.
* Inside these clusters are EC2 instances you can customize and control that simply act as your Docker hosts.

-
### Data Plane
* This is often what we refer to as the data plane.
* A container's data plane is what provides the container power so that the container will actually run.
* You can think of your container as a little parasite that siphons CPU, memory,
and networking capacity away from the EC2 instance, A.K.A. the data plane, so that it can properly function.


-
### Top Level API
* The other thing you need to know is that at the top level there is an API.
* Giving high level commands to this API is how you interact with your cluster.
* So if you tell the API that you need to run four copies of a particular container, distributed across three AZ's, the API will find ways to place those containers on instances across all three availability zones.

-
### ECS Responsibility
* ECS completely takes care of cluster management as well as the coordination and automation of the deployment of your containers.
* This lifts a huge burden off of you, as it frees you from responsibility of
    * managing cluster states,
    * placement,
    * scheduling,
    * high availability,
    * scaling
    * and more.

-
### ECS Top-level API
* Through this API, you can
    * launch new containers as you need them
    * retire old containers,
    * scale the number of EC2 instances in your cluster
    * scale the number of containers on EC2 instances up and down


-
### Power of ECS Top-level API
* Using this API, customers can launch clusters with thousands of instances, and schedule tens of thousands of containers in seconds.
* That's a lot of scalability that you have at your fingertips.
* the container's control plane exposes the API that allows interaction with the containers

-
### Control Plane
* In this case, you can think of a container's control plane as the ECS service itself, as it orchestrates the containers on your behalf, and provides an entry point for communication through the API.


-
### Summary
* ECS, the service & control plane, communicates with the EC2 instances in the cluster to start, stop and monitor your containers as you send requests through the API.
* The ECS control plane is mainly abstracted away from the customer through the use of the API, but the customer still has responsibility over the data plane, as they are still accountable for their EC2 instances.
* But really, the abstraction of the control plane is the true beauty of ECS.
* With that, ECS takes care on installing, provisioning, operating and scaling your cluster of instances and containers on your behalf.

-
### Summary
#### (Continued)
* The bottom line of all of this is that ECS was created so that customers no longer have to operate their own container management infrastructure.
* They can allow AWS to do it for them, so that they can focus on what actually differentiates their business.
* This is just the general concept of what ECS is and how it can benefit you, but in later videos we'll be uncovering a lot more about the service and how it can be used.
* Thanks for joining me and I'll see you in the next one.