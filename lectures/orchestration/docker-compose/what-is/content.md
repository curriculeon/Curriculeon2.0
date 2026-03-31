# Glossary


## Kubernetes Object
* An entity in the Kubernetes system.
* The [Kubernetes API](#kubernetes-api) uses these entities to represent the state of your [cluster](#cluster).
* A Kubernetes object is typically a "record of intent".
* Once you create the object, the Kubernetes control plane works constantly to ensure that the item it represents actually exists.
* By creating an object, you're effectively telling the Kubernetes system what you want that part of your cluster's workload to look like; this is your cluster's desired state.

## Pod
* A Pod is the smallest and simplest [Kubernetes object](#kubernetes-object).
* A Pod represents a set of running [containers](#container) on your [cluster](#cluster).
* A Pod is typically set up to run a single primary [containers](#container).
* A Pod can also run optional sidecar [containers](#container) that add supplementary features like logging.
* Pods are commonly managed by a Deployment.

## Node
* Also known as a _worker node_ in Kubernetes.
* Also known as a _worker machine_ in Kubernetes.
* Also known as a _minion_ in early Kubernetes versions.
* A node may be a [virtual-machine](#virtual-machine) or physical machine, depending on the cluster.
* A node is managed by the [control plane](#control-plane).
* A node has local daemons or services necessary to run [Pods](#Pods).
* The daemons on a node include `kubelet`, `kube-proxy`, and a [containers](#container) runtime implementing the CRI such as Docker.

## Control Plane
* In production environments, the control plane usually runs across multiple computers.
* The control plane manages the worker nodes and the Pods in the cluster.
* The container orchestration layer that exposes the API and interfaces to define, deploy, and manage the lifecycle of containers.
* This layer is composed by many different components, such as (but not restricted to):
    * etcd
    * API Server
    * Scheduler
    * Controller Manager
    * Cloud Controller Manager
* These components can be run as traditional operating system services (daemons) or as containers.
* The hosts running these components were historically called masters.

## Cluster
* A set of [nodes](#node), that run containerized applications.
* Every cluster has at least one worker node.
    * The worker node host the Pods that are the components of the application workload.
* a cluster usually runs multiple nodes, providing fault-tolerance and high availability.

## Kubectl
* A command line tool for communicating with a _Kubernetes API server_.
* You can use kubectl to create, inspect, update, and delete Kubernetes objects.
* An agent that runs on each node in the cluster. It makes sure that containers are running in a Pod.

## Kubernetes API
* The application that serves Kubernetes functionality through a RESTful interface and stores the state of the cluster.
* Kubernetes resources and "records of intent" are all stored as API objects, and modified via RESTful calls to the API.
* Users can interact with the Kubernetes API directly, or via tools like `kubectl`.

## API Server
* Also known as `kube-apiserver`
* The API server is a component of the Kubernetes control plane that exposes the Kubernetes API.
* The API server is the front end for the Kubernetes control plane.
* The main implementation of a Kubernetes API server is `kube-apiserver`.
* `kube-apiserver` is designed to scale horizontally—that is, it scales by deploying more instances.
* You can run several instances of `kube-apiserver` and balance traffic between those instances.


## Minikube
* A tool for running Kubernetes locally.
* `minikube` runs a single-node [cluster](#cluster) inside a [virtual machine](#virtual-machine) on your computer.
* You can use `minikube` to try Kubernetes in a testin genvironment.



## Workload
* A workload is an application running on Kubernetes.
* Various core objects that represent different types or parts of a workload include the DaemonSet, Deployment, Job, ReplicaSet, and StatefulSet objects.
* For example, a workload that has a web server and a database might run the database in one StatefulSet and the web server in a Deployment.



## Container
* A lightweight and portable executable [image](#image) that contains software and all of its dependencies.
* Containers decouple applications from underlying host infrastructure to make deployment easier in different cloud or OS environments, and for easier scaling.




## Image
* Stored instance of a [container](#container) that holds a set of software needed to run an application.
* A way of packaging software that allows it to be stored in a container registry, pulled to a local system, and run as an application.
* Meta data is included in the image that can indicate what executable to run, who built it, and other information.




## Virtual Machine
* In computing, a virtual machine is an emulation of a computer system. 




## Service
* An abstract way to expose an application running on a set of Pods as a network service.
* The set of Pods targeted by a Service is (usually) determined by a selector.
* If more Pods are added or removed, the set of Pods matching the selector will change.
* The Service makes sure that network traffic can be directed to the current set of Pods for the workload.