# Amazon Web Services
## AWS Elastic Kubernetes Service

* I've completed is the installation, update and setup of the AWS Command Line tools.
* I did this by launching an AWS Cloud9 instance, so that most of the work was already done for me.
* The other completed tasks were to install the Command Line tools for EKS and Kubernetes.
* The are called EKS control and Kube control, respectively.
* These will provide specific functionality beyond that of the base level of AWS CLI, and are required if you are working with EKS and Kubernetes through the Command Line.
* EKS control will be utilized for our cluster management, and Kube control will be our management tool for the containers.
* Now, with the necessary tools installed, the first thing we are going to do is use EKS control to create our cluster.
* We do this with the following command.
* The name is the identifier in the cluster in EKS, and the version is referring to the version of Kubernetes that we're using.
* All of the other parameters you see here are related to the nodes that are going to be launched as part of the cluster.
* Node group name is the identifying name for the cluster of instances, and node type is the instance type that is being launched for this particular implementation.
* Nodes, nodes min and nodes max are all focused on the number of instances you are going to run.
* In this case, it's going to start with three instances, but should scaling be established and configured, it could have as many as four instances, or as few as one.
* Lastly, node AMI is referring to the image that is going to be used to prepare the instance to manage the containers.
* Once we have all of this set, we can run the creation command, and we're ready to go.
* The output you've been seeing is just describing the actions as they take place.
* If you were to do this yourself, you could wait until the output states that the cluster is ready, which is what I'm doing now.
* Now that everything is done, let's get some containers going.
* As I stated earlier, EKS control is primarily for cluster management, but now that we want to to work the containers, it's time to use Kube control, but first, let's see the cluster that I just created.
* And there, we see the cluster.
* Now that it's verified that the cluster exists, I'll actually spin up some of our own pods in a deployment and expose them as a service.
* This command pulls the latest Nginx image from Docker Hub and creates a deployment with one pod.
* It works well for the purposes of this demo for a quick testing, but in the real world, this is done differently.
* One, you wouldn't use the latest, and two, you would also put all of the details for this deployment into a declarative YAML file.
* We also don't ever want to just run one of anything, so let's scale up this deployment.
* Remember, a deployment owns any controllers underneath it.
* So let's make sure the deployment's scaled out to four pods.
* First, we'll describe the deployment to get more details.
* Now, let's see those four pods actually running.
* You can see the original pod, and three created simultaneously by the scale command.
* Now pods by themselves, especially of Nginx, aren't much good if you can't reach them.
* Let's expose this deployment as a service, fronted by a load balancer.
* Here, Kubernetes exposes the service and creates ELB on its own.
* There's no secret here for EKS, as this is upstream Kubernetes existing integration with AWS.
* And because this is upstream Kubernetes, we can use the standard cube control tricks, like JSONPath output filtering.
* After giving it a few minutes to make sure the load balancer's up and running, and that the targets are registered properly and serving traffic, we can use this output of this previous command to allow us to view the web page we've just set up.
* And with that, we have public facing containers up and running with EKS.