# Amazon Web Services
## Elastic Beanstalk (EBS)

-
* When looking at application hosting options on AWS, Amazon Elastic Compute Cloud (EC2) is often a service you would look to for your hosting needs.


-
## Deploying to EC2<br>is possible
* You can
    * create your own Amazon Virtual Private Cloud or VPC,
    * provision virtual servers or Amazon EC2 instances
    * place virtual servers in subnets inside of your VPC
    * set up Amazon EC2 Auto Scaling
    * front the whole thing with an elastic load balancer
    * deploy your application onto your instances.


-
## Deploying to EBS<br>is bootstrapped
* AWS Elastic Beanstalk (EBS) is a service for deploying and scaling web applications.
* You don't need to provision and manage any infrastructure to get your code hosted on EC2.
* Instead, you just simply upload your code

-
### EBS Deployment
* Elastic Beanstalk automatically handles the deployment from
    * capacity provisioning, load balancing, and auto scaling to application health monitoring.
* At the same time, you retain full control over the AWS resources powering your application and you can access the underlying resources at any time.


-
### Manages Application Stack
* Elastic Beanstalk also manages the application stack for you so you don't have to spend the time or develop the expertise.
* Instead, you can focus on writing your code rather than spending time managing and configuring infrastructure.


-
### Auto-scaling
* Elastic Beanstalk automatically scales your application up and down based on your application's specific need using easily adjustable auto scaling settings.
* For example, you can use CPU utilization metrics to trigger auto scaling actions.
* With Elastic Beanstalk, your application can handle peaks in workload or traffic while minimizing your costs.


-
### Can still Leverage AWS Resources
* Elastic Beanstalk handles a lot of the management for you, but that doesn't mean you lose control over the underlying resources.
* You have the freedom to select these AWS resources such as the Amazon EC2 instance type that is the most optimal for your application.
* Additionally, Elastic Beanstalk lets you look under the hood and retain full control over the AWS resources powering your application.
* If you decide you want to take over some or all of the elements in your infrastructure, you can do so easily by using Elastic Beanstalk's management capabilities.


-
### No Cost
* The best part about all of this is that there is no additional cost for Elastic Beanstalk itself.
* You pay only for the AWS resources needed to store and run your applications.