# Amazon Web Services
## Fargate Demonstration


-
* In this lecture I'm gonna show you how to run a container instance on top of AWS Fargate.
* I have a web app written in Python and this web app just simply serves up static HTML, CSS and Java script.
* I want to host this container on Fargate and make it publicly available by fronting it with an application load balancer.
* I'm going to do this using the AWS command line.
* You can achieve the same outcome using the console, but I want to show you using the CLI, as that is most likely how you will be utilizing these services in a production environment.
* It also gives us the ability to really look at each command and understand what's happening.
* But before we hop right into the demo, let's talk about some terminology.

-
### Terminology
* AWS Fargate has a few key concepts that you need to understand.
* These concepts actually come from Amazon Elastic Container Service, which is a container orchestration tool.
* Fargate is simply the server-less way to host a container using Amazon Elastic Container Service.

-
#### Cluster
* The first term to know is cluster.
    * A cluster is a logical isolation boundary for the infrastructure that hosts the containers.
* This cluster lives inside of the virtual private network of your choice and can span multiple availability zones. You can select what subnets you want to place your container instances in as well, and Fargate will provision and manage the cluster for you.
* Since this cluster is abstracted away from you, you do not have SSH access or network access to any underlying instances.
* To run your containers, you will create what are called tasks and services.
* These services will then place the tasks on your cluster.

-
#### Task
* A task is at a basic level just a wrapper to run your containers in.
* To run a task, you need to create a task definition.
* A task definition is a configuration for what container or containers that are going to be run.
* A task definition includes what image and tags should be used, how much memory and vCPU is needed for each container, what ports the container should be listening on, as well as any shared volumes if they are needed.
* Your entire application stack does not need to exist in a single task definition.
* And actually in most cases it shouldn't .
* Your application can span multiple task definitions by combining related containers into their own task definitions, each representing a single component of your application.
* Once you have your task definition defined, you would then define a service that will actually run the task based on that task definition.

-
#### Service
* A service is what allows you to configure the number of running tasks you want to run and maintain across your cluster.
* You also define whether you want to front your service with a load balancer or not, as well as what subnets and security groups you want your tasks to use.
* So what we are going to do is create an application load balancer in an existing VPC to front our service.
* We are then going to create a Fargate cluster across two subnets in that same existing VPC, create a task definition for our web app, and then create a service to run the task on top of the cluster where we want two running tasks.


-
#### Demonstration
* So as you can see, I already have my cloud9 IDE up and running.
* And for this demo, I already have the commands written.
* So we're not gonna type them out live instead what we're going to do, is we're going to read the commands from this file here and I'm just going to copy and paste them for each step into the terminal below.

-
* So the first thing that we need to do is create an application load balancer.
* And this will allow us to access my application which is running on port 8080.
* I want to be able to submit an http request to port 80 of my application load balancer, and have it forward the request to my back end container which is running on port 8080.
* So let's go ahead and create the load balancer first.

-
```
aws elbv2 create-load-balancer --name FargateLoadBalancer \
--subnets subnet-${id1} subnet-${id2} \
--security-group sg-${id3} --scheme internet-facing \
--type application --ip-address-type ipv4
```
* You can see in this command here
* I'm giving it a name,
* Fargate load balancer.
* I am defining the two subnets that I want to attach to that load balancer, and I am also assigning a security group which will define the ingress and egress traffic that is allowed on port 80.
This security group is already existing as well as the subnets.
* So these are just the IDs for those existing resources.
* So now we're going to copy and paste this command into the terminal and hit enter.
* And you can see our output here that this was created.
* I'm actually going to copy the ARN, or Amazon Resource Name, of this load balancer that was just created and we're going to use it later.
* So I have that copied into my clipboard now and I'll scroll back down to the bottom.
* Alright.








So next we're going to create a target group.
That's going to be this next command here.
```
aws elbv2 create-target-group --name FargateTargetGroup --protocol HTTP \
--port 8080 --vpc-id vpc${id} --target-type ip
```

-
This target group is going to be where our tasks are run.
And because I have my containers exposed on port 8080,
you can see I am designating the port
for this group to be port 8080.
So let's go ahead and copy and paste this one as well.
We gave this one the name Fargate target group
as you can see there.
Paste it.
Hit enter.
And then this brings back an ARN as well,
which we'll just scroll back up and grab later
for another command.











-
This last step for setting up my load balancer is creating a listener, which will listen on port 80 for incoming http requests and then route them to our target group on port 8080.

```
aws elbv2 create-listener --load-balancer-arn arn:aws:elasticloadbalancing:us
-east-1:${id1}:loadbalancer/app/FargateLoadBalancer/${id2}
--protocol HTTP --port 80 --default-actions Type =forward,
TargetGroupArn=<target-group-arn>
```


-
You can see in this command here that I have the load balancer ARN that I'm going to need to pass in.
So I'm going to go ahead and paste that ARN there. And then I also am defining the protocol as http, the port as port 80, and then I'm forwarding to the target group ARN.
So we're going to need to find this target group ARN.
Luckily, we can grab it from the output of the previous command that we just ran.
So I will copy that and paste it up above, and then I will copy the entire command, and run it down below and hit enter.








-
* Now that our load balancer is set up, let's create the cluster that will host our tasks.
* I'm going to call the create cluster API and simply give it a name.
```
aws ecs create-cluster --cluster-name fargatecluster
```
So I'm going to copy this, paste it down below, and you can see we gave it the name Fargate cluster.
And so this gave us back here a cluster ARN which I will use later.






-
* Next I need to create a task definition.
* This task definition is the configuration for our container.
* Tasks have associated IAM rules which I have already created in this account.
* In this command, this register task definition command, you can see that I'm passing in a task role ARN.
* And this ARN is referencing the IAM rule that the service ECS will use to launch the task.
* And then we also have an execution rule ARN, which is going to be used for the task itself.
* You also must define a network mode for the task.
* With Fargate, it only supports the AWS VPC networking mode.
* We will discuss what other networking modes exist and what they mean in a later video.
* But for now, just remember that Fargate uses AWS VPC networking mode.
* Next, I need to pass in my container definition, which I captured in a JSON file.
* That JSON file can be found over here, Fargate container.
* So I'm going to go ahead and open this up.
* And you can see here I have a spot where I need to define the image and I also have the port mappings.
* I'm going to need to actually navigate to ECR to grab the URI for this image.
* So let's do that.
* I'm going to come to the AWS management console and navigate to the service ECR.
* Here I have a repository set up for python web app, which is what we're going to be launching.
* And then I'm going to grab the latest URI for that image, come back to cloud9, and then I'm going to replace this piece here with that URI.
* Then I will go ahead and hit save and exit out of this file.
* You can also see in this command here that I have defined the amount of vCPU this task will need.
* I've defined 0.5 vCPU, and I've also defined one gigabyte of memory here.
* Then the last thing that I'm passing in here, in order for this task to be eligible to run on Fargate, is to pass in the parameter dash dash requires compatibilities with the value Fargate.
* So next I'm going to actually change directories into the directory where my Fargate container JSON is and then I will run this command.
* So I'm going to come back to my home directory then I'm going to go into the CLI input files and the Fargate demo folder.
* If I do an LS here you can see that the Fargate container JSON is there, so now I will copy this command, paste it below, and hit enter.
* All right.
* Now that our task is defined, we will create a service that uses that task definition to launch a task.
* I'm going to need to provide the ARN for this cluster.
* I'm going to also need to provide the task definition ARN and then I can copy this and paste it and use it.
* So first things first, I'm actually going to just grab the task definition ARN from what we just created.
* So if I scroll up a little bit I can copy this task definition ARN and paste it here.
* And I will backspace out of that.
* And then I'm going to scroll up a little bit and grab the cluster ARN as well which is here.
* And I will paste that over where the cluster ARN is needed.
* Alright, and let's take a look at a few of the other things here in this API call as well.
* So I have the cluster ARN, I have the task definition ARN, I'm giving this a service name of Fargate demo service two, and then I am providing that I want two tasks to be launched.
* I'm providing a JSON file that ties this service to the load balancer that we created earlier.
* So in order to do that I'm actually going to go ahead and open up this load balancer file.
* And you can see here that we need the target group ARN in order to tie these two things together.
* So what I'm gonna do is scroll up and I'm gonna grab this target group ARN here, paste it into this file, hit enter.
* And then I will exit out of this.
* So next we have to define the launch type.
* And the launch type here is Fargate because we're going to be using ECS to launch the task on top of a Fargate cluster.
* We have the network configuration file and the task networking JSON file which we can take a look at that.
* You can see here I have just provided the two subnets that I want my tasks to be placed in and the security groups as well which will allow the http traffic to actually reach our running containers in our task.
* So I'm going to exit out of that.
* And now what I want to do is highlight the whole thing, copy it, scroll back down to the bottom, paste it here, and hit enter.
* And we can see that that came back.
* It is successfully now creating our service.
* Now that our service has been created it should be starting up the tasks on the cluster.
* In order to see that, let's go ahead and list the services on the cluster.
* We should be able to see it coming up.
* So I'm going to scroll down a little bit and I will copy this command, AWS ECS list services, on the cluster Fargate cluster, paste it in, hit enter.
* And we can see that we have the service that we created where we are launching two tasks on that cluster.
* So next to verify that our tasks are actually up and running, I'm going to go to the AWS console and I'm going to navigate to the load balancer section.
* And I'm going to grab the DNS name of the load balancer.
* We should theoretically be able to access these tasks through that DNS name.
* So let's do that.
* I'm going to come back to the console, navigate home, and I will navigate to the EC2 management console.
* I'm going to scroll down on the left hand side here, click on load balancers, select our load balancer which I just created, copy this DNS name, and then paste it in the browser.
* Alright, so this looks pretty good.
* This is exactly what we want to see.
* We can see here that our website is up and running and that means that it was successful.
