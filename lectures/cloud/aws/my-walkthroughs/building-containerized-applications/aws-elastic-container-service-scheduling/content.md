# Amazon Web Services
## Elastic Container Service
### Scheduling

* we're going to talk about how ECS schedules and places tasks on your cluster of EC2 instances.
* Generally, if you want to launch a new container, you have a couple of options.

-
### Option 1
#### Manually launch container
One option is to do it manually.
Launch a container and place it on an instance yourself.


-
### Option 1 - problem
#### Manually launch container
However, you can probably imagine how quickly that would get out of control if you had to place thousands of containers across thousands of instances.
That sounds like a management nightmare and something that would be impossible for mere mortals to keep up with.
So the other option is to take the mortals out of the picture and let the service handle it on your behalf.
That way, you don't have to worry about creating the scheduling and placement logic in-house.



-
### Scheduling Engine
In ECS, scheduling tasks and placing tasks are handled by two separate built-in engines, the Scheduling Engine and the Placement Engine.
The Scheduling Engine's whole goal is to provide logic around how, when, and where to start and stop containers.
So you specify which task definition to start and the Scheduling Engine will make the necessary calls to the control plane to start that task on the specific instance or instances.
However, how you decide to schedule your tasks isn't one size fits all.
Customers have different types of applications, different types of requirements, so ECS provides different types of schedulers for you to choose from.
One type of scheduler is the Service Scheduler.
The Service Scheduler allows you to specify how you want your tasks to run and how many copies of that task you want to run.
The Service Scheduler will maintain this number and reschedule tasks if they fail.
For example, if you say you want five copies of your task running across your cluster and one of those tasks fail, the Service Scheduler will replace that task so that you have five running at all times.
The Service Scheduler also offers the Daemon scheduling strategy.
The Daemon strategy will ensure that a specific task is running at all times on every EC2 instance in your cluster.
This may be ideal for shared services that other containers on the node need to access such as monitoring or logging tasks. Another type of scheduler is to schedule your tasks using a Cron-like strategy with Amazon EventBridge.
If you wanna schedule a task to run at a particular time of day or on a particular day of the week, this strategy would help achieve that.
However, if none of these schedulers work for your use case, you have some other options.
You could create your own scheduler, leverage third party schedulers, or fall back on running tasks manually
especially for one-time jobs or periodic batch jobs that you don't need to keep running or manage
over long periods of time.
Now that we've got the scheduling strategy, who determines the most optimal place to start the task? That would be the Placement Engine.
The Placement Engine's goal is to place your task on an instance that has appropriate memory and CPU space as well as run your tasks in a configuration that you choose. You can customize placement by using task placement strategies and task placement constraints.
After the Placement Engine determines that it has space for the container, the first thing that the engine looks at is task placement constraints.
Task placement constraints allow you to filter out which instances you want to put containers on.
You can filter based off of AMI ID, instance type, tags, and more.
For example, if you have two tasks that should run together or two tasks that should never run together such as two CPU-intensive workloads you want to keep apart, you could use a task placement constraint
called affinity to do that.
Or if you have a task that has compliance requirement to use a certain AMI ID, you could use a task placement constraint to ensure that your containers are placed on only instances using that particular AMI.
Then the engine uses algorithms called task placement strategies to determine how to place your instances.
There are several task placement strategies that you can take advantage of.
For example, you could use the binpack task placement strategy which will pack your containers as densely as possible across your instances in the cluster.
This is a great strategy if you want to reduce costs.
Another option is to use the spread task placement strategy which spreads your tasks across instances
for high availability.
And because this is the real world where we often want two things at the same time,
ECS supports strategy chaining.
So if you want to be cost conscious and binpack your instances as densely as possible while also maintaining high availability, you can do that.
Let's look at a diagram of how this works.
In the API call shown here, we're asking ECS to use the spread placement strategy type combined with a binpack placement strategy on memory when placing our nine instances.
When the command is made, ECS first ensures that we have high availability across AZs and then begins packing the containers afterwards.
This should give you a general idea of how ECS schedules and places your tasks.
Keep in mind you have a lot of customization opportunities here to match your needs.
That's all I have for you today, but stay tuned for more containers videos.
