# Amazon Web Services
## AWS Elastic Kubernetes Service

this is the last video of this week's discussions on Kubernetes.
* Phew, this week was a wild ride where we discussed some of the core concepts of understanding Kubernetes and EKS.
* And now I get the easy job of wrapping all of this up.
* Let's do a quick recap of what we've done so far.
* At the beginning of the week, we discussed Kubernetes, the very popular open source container framework that is now a graduated project from the Cloud Native Computing Foundation, or the CNCF.
* The CNCF is a vendor-neutral ecosystem that maintains several open source projects including Kubernetes.
* Since Kubernetes is known for being portable and extensible, it's easy to work with inside of any platform, including AWS.
* If you want to work with Kubernetes in AWS, you have a few options.
* The first option is to run and manage your Kubernetes workloads yourself.
* To do this, you would be responsible for provisioning, installing and operating not only the Kubernetes master nodes, but also a cluster of worker nodes as well.
* For high availability, you would ideally want at least three Kubernetes master nodes across three availability zones.
* This puts even more work on your shoulders as each master node will then need to be configured to talk to one another, reliably share information, load balance and failover to other masters if one experiences a failure.
* This can be a pretty significant burden as you work with Kubernetes at scale which is one of the reasons why we created Amazon EKS, or Amazon Elastic Kubernetes Service.
* Amazon EKS handles the provisioning, scaling and operating of your master and worker nodes in a Kubernetes cluster on your behalf.
* One of the best things about EKS is that it greatly simplifies the management of your master nodes.
* Not only does it handle synchronization of masters, automated version upgrades and patching of masters.
* It also handles high availability, which means EKS will automatically detect and replace any unhealthy master nodes.
* At the heart of EKS is of course Kubernetes.
* So any open source drivers or tooling that you commonly use with your Kubernetes workloads you can use with EKS.
* For example if you wanna use something like Helm, a popular package manager for Kubernetes workloads, you're free to use that alongside EKS as long as you have CUE control configured.
* The purpose of this past week of learning was to provide you with familiarity around the Kubernetes and EKS ecosystems.
* But we certainly haven't shown you everything there is to know about these tools.
* There's far more information out there about additional tooling, drivers and potential projects you can create with Kubernetes than we can put into a week's worth of content.
* As a last note for this video, I highly recommend looking through the CNCF website and browsing through some of the projects they're working with.
* These projects generally have a high quality and move at a high velocity and may help you find a solution to a problem you're currently facing.
* Don't forget to consult the weekly class notes and post in the forums if you have any additional questions or comments.
* That's all we have for you this week, thanks for stickin' with us and stay tuned for another fun filled week of containers.
* 