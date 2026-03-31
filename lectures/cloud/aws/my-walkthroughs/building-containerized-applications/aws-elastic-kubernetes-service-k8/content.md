# Amazon Web Services
## AWS Elastic Kubernetes Service


* When it comes to scaling your container-based workloads on Kubernetes, there are a few technologies you're going to need to be aware of.
* Unlike working with ECS which uses AWS scaling constructs like the EC2 Auto Scaling for the cluster and Service Auto Scaling for the containers, Kubernetes has its own scaling constructs that you will interact with.
* You'll need to scale both the nodes in your cluster as well as the pods which have your container instances running inside them.
* For cluster scaling, EKS supports something called the Cluster Autoscaler.
* The Kubernetes Cluster Autoscaler is a standalone program that adjusts the size of your Kubernetes cluster to meet your current demand.
* It will adjust the size of your cluster under two conditions.
* The first is when there are pods that fail to run because of insufficient cluster resources, in which case nodes would be added to the cluster.
* The second is when there are underutilized nodes in the cluster and the pods that are running on those underutilized nodes can be moved to other nodes.
* In that case, those nodes would be removed from the cluster.
* The Cluster Autoscaler integrates with AWS Auto Scaling groups.
* However, it doesn't support cross-availability zone Auto Scaling groups.
* So in order to use the Cluster Autoscaler for EKS, you would create an Auto Scaling group for each availability zone that your cluster is operating, then configure the Cluster Autoscaler to be aware of the Auto Scaling groups that it will be manipulating.
* You can then interact with your Cluster Autoscaler by using the Kube control command line interface.
* You will also need a way to scale your pods and Kubernetes has a standard API resource called the Horizontal Pod Autoscaler that given a metric source will scale the number of pods as a part of a deployment, controller, or replica set.
* The metric source that the Horizontal Pod Scaler relies on is called the Kubernetes metrics server and this server is not deployed to an EKS cluster by default.
* You can download the metrics server from GitHub and apply it to your cluster using the Kube control command line interface.
* The metrics server will aggregate data about resource utilization in your cluster.
* You then set a target CPU utilization for your cluster and the Horizontal Pod Scaler will adjust the pods running in order to meet that target metric.
* You can also use custom metrics for your target by using another project called the Custom Metrics API.
* There is another way to scale your Kubernetes workload and that is using the Vertical Pod Autoscaler.
* The Vertical Pod Autoscaler also requires that you deploy the metrics server to your cluster so it can aggregate the data that is needed.
* However, the Vertical Pod Autoscaler does not adjust the number of pods but instead adjusts the reservations for the pods through CPU and memory.
* This allows you to right fit the pods to your containers.
* When you properly size a pod, it can help you avoid over provisioning resources and can improve cluster resource utilization.
* So to wrap it up, when using Kubernetes on AWS, you will use the Kubernetes-specific scaling mechanisms.
* EKS supports multiple different Kubernetes scaling mechanisms that make it easy to scale up and down according to demand.
* Thanks, we'll see you next time.