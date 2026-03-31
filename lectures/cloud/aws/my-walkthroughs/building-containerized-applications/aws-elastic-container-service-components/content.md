# Amazon Web Services
## Elastic Container Service Components


-
* To prepare your application to run in ECS, you create what is called a task definition.
* This is a text file in JSON format that describes one or more containers that form your application, with a maximum of up to 10.
    * It is essentially a blueprint for your deployment.
* The task definitions are used to specify various parameters for your application, which include
    * the container to use,
    * which launch type to use,
    * ports to open,
    * and data volumes to use.
* The task itself is the instantiation of a task definition within a cluster.

-
### Scheduler
* Within ECS, you also have a scheduler.
* The scheduler is responsible for placing tasks on your cluster, and it's essentially the when and where of running your tasks.
* For scheduling, you have several different options available.


-
### Scheduling Opton
* You can
    * define a service that runs and maintains a specified number of tasks simultaneously,
    * manually run tasks,
    * schedule tasks,
    * and even use custom schedulers with ECS.
* Lets first define what is meant by _cluster_ and _service_

-
### Cluster
* When you run tasks, using Amazon ECS, you place them on a cluster, which is the logical grouping of compute resources.
* Depending on the launch type you're using, the clusters can be either
    * managed for you using Fargate,
    * or managed by you using EC2.

-
### Service
* ECS allows you to run and maintain a specified number of instances of a task definition simultaneously.
    * This is called a service
* Services can
    * be run behind a load balancer,
    * allow you to specify deployment configurations,
    * be deleted
        * which would stop all of the running tasks associated with the service.


-
### Container Agent
* And the last major concept that I want to briefly cover is the container agent.
* The container agent runs on each compute node within an ECS cluster.
* It sends information about the resource's current running task and resource utilization to ECS, as well as starting and stopping tasks whenever it receives a request from ECS.