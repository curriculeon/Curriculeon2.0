# Amazon Web Services
## Elastic Container Service

* In this video I'm gonna show you how you can host your container on ECS using the EC2 hosting option.
* We are going to be using the AWS command line to spin up an ECS cluster, define a task and then run a service on that cluster.
* We should be able to access our simple web application through the browser to confirm that it's working when everything's all said and done.
* So let's hop right in.
* You can see that I'm already logged in to AWS Cloud9, our container image is already built and pushed into ECR, so we're gonna start off by creating an ECS cluster.
* I'm going to copy the command out of this file and paste it below.
* The first command is creating a cluster and I'm giving that cluster a name of ECS Demo.
* So I will copy this, paste it below and hit enter.
* And you can see here that this returned to us a cluster ARN which shows us that the cluster was created.
* And you can also see from the output that we have zero pending and running tasks, which means there's nothing currently running on it.
* That makes sense because the cluster that we just launched is empty.
* So next what we're going to do is launch an EC2 instance to be part of this cluster.
* We can't actually run a service on the cluster until an EC2 instance is run and then becomes a part of the cluster.
* In order to do that, I'm going to call the EC2 command line interface.
* And you can see with this next command here, I'm calling the run instances command, passing in information about that instance, like the AMI ID.
* This specific AMI ID I grabbed from the AWS documentation, where it lists the latest ECS optimized AMIs.
* This AMI will already have the ECS agent and docker agent installed.
* So I won't need to worry about downloading or installing those on the instance.
* Next I'm providing the instance type, which is a T3.
* medium.
* I am also providing the key pair, which already exists in my account, before this demo.
* I also am providing the subnet IDs here, I'm providing the security group ID, which will allow the egress and ingress traffic.
* I have the IAM instance profile, which is going to be around the IAM role that this is using.
* And then I also am associating a public IP address with this instance so that we can access it.
* And finally I am passing in the user data file.
* This user data file is located over here on the left.
* You can see we have this userdata.
* txt.
* User data is executed when the EC2 instance boots up for the first time, so I'm going to go ahead and show you this user data.
* In this user data file, you can see we have echo ECS cluster equals ECS demo.
* What this is actually doing, this is configuring an ECS.
* config file, which is going to tie this instance to the cluster.
* So I'm going to go ahead and exit out of this, I will copy this command, and run it, and this will launch our 2 EC2 instances, which will become a part of the cluster.
* So I'll go ahead and paste that below, and hit enter.
* And now we're going to take a few minutes, pause for a second, while these 2 EC2 instances get up and running.
* Now that our instance is up and running, let's go ahead and create the task definition.
* You can see in the command here that I'm giving ECS permission to launch resources on our behalf using this task role ARN, which is tying it to an IAM role.
* I also have an ARN for the role that the task will be using, that is the execution role ARN.
* This will give the code running inside the container access to AWS credentials.
* We will talk more about this later.
* You can also see that I've defined the network mode to be bridge.
* Valid values for network mode are none, bridge, AWS VPC, and host.
* For simplicity's sake here, the network mode bridge is the only mode that allows me to do port mappings.
* And I want to map my host port 80 to my container port 8080.
* So I'm going to pass in bridge for that network mode.
* Next I have the container definitions captured in a json file.
* We can take a look at that file and see, if I open that up, we can see that I've defined the CPU, the memory, the image, as well as the port mappings.
* So I'm going to go ahead and exit this, and then we can run this command.
* So I will copy this command, paste it below, and hit enter.
* And from here I can scroll up, and we can then see the task definition ARN, which I'm going to need in the next step, so I'm going to go ahead and copy that, scroll back down to the bottom.
* So next what we're going to do is to create a service which will use that task.
* We will give the service a name, associate the service with our cluster using the cluster ARN, which we're going to paste in there.
* We're also going to tie it to the task definition ARN which I can do now since I just copied that.
* We're going to set the desired count for our task to be 2.
* The launch type will be EC2, since that's the hosting option that we're using.
* The scheduling strategy will be replica, and the deployment type will be ECS.
* So let me quickly scroll up and grab our cluster ARN.
* It should be all the way at the top.
* Here we go, grab this one here.
* And I'm going to paste this cluster ARN in the spot, and then I will copy the whole thing, scroll back down to the bottom, and paste below, and hit enter.
* Now that the service is launched, we should be able to describe that service using this describe services command.
* So copy that, paste it below.
* And you can see here that we have a running count of 2, and that is describing the tasks that are running on top of this cluster.
* So next what I want to do is list those tasks, so I'm going to go ahead and call AWS ECS list tasks, with the cluster ECS demo and the service name, ECS service.
* Let me just fix that really quick.
* We can copy it, paste it below, and we can then see task ARNs below.
* Now what we're going to use these task ARNs for is we're going to describe those tasks, find out what EC2 instance it's running on top of, and then we can grab the public DNS name from that EC2 instance, and we can access the website.
* So I'm going to go ahead and copy one of these ARNs, I'm going to paste it into the next command, which will describe the tasks.
* So I'm going to describe the tasks on the cluster ECS demo, for this one specific task, I will copy this entire command, paste it below, hit enter, and this gave us some information about the task.
* So the information we need to pass into the next command is going to be to describe the container instances that that specific task is running on.
* So I need the container instance ARN.
* I'm going to scroll up here and find that in this output.
* So here we can see the container instance ARN.
* Again this is just showing us what EC2 instance the container is running on top of.
* So I'm going to use that ARN, paste it into the describe container instances command, copy the whole thing here, scroll back down to the bottom of our terminal, paste it below and hit enter.
* And next what I need is I need to describe the EC2 instance that is a part of the cluster which is what we call our container instance, and in order to do that I need to grab the instance ID.
* So I will scroll up through this output, find that instance ID.
* Here's the instance ID.
* I'm going to grab this instance ID, paste it here, and then we can describe this EC2 instance, scroll back down to the bottom of our terminal, describe our EC2 instance, and in the output here we should be able to grab the public DNS name.
* Here it is.
* I'm going to copy this public DNS name, paste it into the browser, hit enter, and you can see here that our blog is up and running.
* So now that we can see that our application is running, what we've learned how to do is we created an ECS cluster, we added EC2 instances into that cluster, we tied those things together using the user data, we created a task definition, we created a service to run the tasks on top of the cluster, and then we figured out how to describe our containers, our tasks, and our container instances to find the public DNS name where we can then access our application.
* So thanks for joining me, and I'll see you in the next demo, where we continue this story.