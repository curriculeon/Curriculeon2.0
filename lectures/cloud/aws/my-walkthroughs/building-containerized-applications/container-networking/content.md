# Amazon Web Services 
## Container Networking

-
### The Problem
* Often, you may need traffic from the internet to hit your individual containers sitting on EC2 instances
* Or you may want your containers to be able to communicate with other containers. 
* Regardless, we'll be solving both of these problems today. 

-
### Getting traffic to Task
* How do we get traffic to our tasks?
* Just as we'd get traffic to a server or to a virtual machine, we need a _load balancer_. 
* the AWS Elastic Load Balancer family has 3 types of load balancers:
    * the network load balancer
    * the classic load balancer
    * application load balancer 


-
### Application Load balancer (ALB)



* we'll focus on the application load balancer or ALB, as it offers the widest array of feature support for container workloads.

-
#### Dynamic Host Port Mapping
* ALB enables dynamic host port mapping
    * allows multiple tasks from the same service to be placed on a single container instance
* Without dynamic host port mapping, 1 service with 2 tasks, would require 2 separate EC2 instances.
    * containers can't run on the same port on the same server.
* Dynamic host port mapping gets you around that problem and can be a hugely beneficial feature of the ALB.

-
#### Load Balancing
* The ALB is the recommended load balancer to use anytime you need to load balance HTTP or HTTPS requests. 
* It's also highly integrated into AWS container services like ECS whether you're placing containers on EC2 instances or using the Fargate launch type. 
* ECS will configure the load balancer on your behalf as well as place tasks on instances in your cluster. 
* Once it places a task on a machine, it will also configure the load balancer to send traffic to the new task without you doing any manual intervention.

-
#### Path based routing
* Another handy perk of the ALB is it can perform _path-based routing_
    * can route requests based off of the URL
* For example in this diagram, we have three different URL paths for our traffic to hit. 
<img src="./diagram.png" style="width=700px;height=400">

-
#### Path based routing
##### (Continued)
* So if a user types in the URL path to the users service, the application load balancer will forward that request to the containers that support that service. 


-
### First Issue Resolution
* So load balancing is the answer to the first problem we had. 
* We figured out how to get traffic to our tasks on our instances. 

-
### Task definition
* Now the second issue. 
* We want our containers to be able to communicate with outside services. 
* This problem is solved through the task definition. 
* In the task definition, you can specify the Docker networking mode that ECS will use for the containers in your task. 
You have four different options of networking modes you can specify in the task definition. 

-
### None
* The first mode is none which does exactly what you might expect. 
* It doesn't allow your containers to talk to anything or anyone. 
* It also doesn't allow you to specify any port mappings. 

-
### Bridge
The second networking mode is bridge. 
This is also the default mode and uses Docker's built-in network. 
Each and every task gets its own private IP and uses the Docker bridge for any communication. 
In this mode, containers will share the same network interface as their host EC2 instance. 

-
### Host
The third mode is host. 
This mode removes the need for Docker's built-in virtual network because the container ports are mapped directly into the EC2 instance's network interface. 
One thing to watch out for in the host mode is you can't take advantage of dynamic host port mapping as this mode doesn't allow multiple tasks from the same service to be placed on a single container instance. 


-
### AWS VPC
And that brings us to the last and final mode, the AWS VPC mode. 
This mode offers the highest networking performance for containers because every task is given the same networking properties as regular EC2 instances. 
What that means is that every task is given its own elastic networking interface, its own private IP, and an internal DNS host name. 
One downside is just like the host mode, it also doesn't allow dynamic host port mapping. 
However, in general, this mode provides more control over how you want your containers to communicate with other services and simplifies the idea of container networking. 

-
#### AWS VPC
##### (Continued)
* It's not a stretch to say if you understand EC2 networking, you also understand the AWS VPC container networking mode with ECS. 
* If your task definition uses this AWS VPC network mode, you are required to use a VPC, subnets, and security groups for your containers. 
* However, this is a good thing as it provides a greater level of security for your containers and allows you to take advantage of tools that monitor your containers at a more granular level. 

-
#### AWS VPC
##### (Continued)
* Generally, this is the recommended approach when working with tasks
    * allows you to treat each container like an EC2 instance with full networking features of the VPC
    * provides the most networking power out of all the other modes
* Keep in mind that this is all decided through the task definition to ensure that your tasks have everything they need to communicate. 