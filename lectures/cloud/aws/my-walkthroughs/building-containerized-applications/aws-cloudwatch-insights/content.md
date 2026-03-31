# Amazon Web Services
## Amazon CloudWatch Insights


-
* Once we have a few tasks running in Fargate, we need to be able to observe and monitor them.
* To do this, you can use Amazon CloudWatch Container Insights to collect metrics like
    * CPU, memory, disk and network utilization, as well as log information in one centralized location.
* Amazon CloudWatch Container Insights can be used for your containerized workloads whether you're using
    * Amazon ECS, Amazon EKS, or if you're using your own Kubernetes platform on Amazon EC2.

-
### Opt in to Container Insights
* Let's see how all this works.
* To work with CloudWatch Container Insights, the first thing you need to do is opt in to Container Insights enabled clusters.
* This can be done by going to the ECS Console.


-
### Enable CloudWatch Container Insight for your IAM user
* Once you're in the ECS Console, you'll go ahead and click on Account Settings in the left-hand side and then scroll all the way down to where it says CloudWatch Container Insights and then make sure you're enabling it for your IAM user and clicking Save.
* Keep in mind that the AWS IAM user performing this action needs the appropriate IAM permission, the ECS put-account-setting permission, to perform this action.
* Once you've enabled this, all new ECS clusters that you create will automatically be monitored by CloudWatch Container Insights.



-
### Viewing ECS Clusters
* If I take a look at my ECS clusters by scrolling up and clicking on Clusters, you can see that I have two clusters available for me.
* One cluster has Container Insights enabled already.
* The other does not.



-
### Viewing metrics associated with specific Cluster
* To see the metrics associated with fargate-cluster3, the one that has Container Insights enabled, I'll go to the CloudWatch dashboard and then go ahead, once it loads, click on Overview and then scroll to Container Insights.
* In the Container Insights dashboard, I can view diagnostic information for both ECS and EKS containers.
* Since I'm focusing on ECS workloads, I'll first click on ECS Clusters.


-
* From here, I can filter by the cluster I want to look at.
* Since I only have one cluster, `fargate-cluster3`, I can view all kinds of information about that cluster such as
    * CPU utilization, memory utilization, both the task and service counts and more.
* Specifically, I'd like to focus on the number of tasks it shows in the task count area.
* Currently, it shows that I have two tasks up and running here and let's go ahead and see how this information changes if we add more tasks into my ECS cluster.

-
* From here, what we can do is we'll go to ECS dashboard, go ahead and click on `fargate-cluster3` that has Container Insights enabled and then we'll go ahead and click on the service and update.
* From here, we can change the number of tasks from two to four.
* Click on Next Step, Next Step, all the way to the review process and then update the service.

-
* Now we can go back to CloudWatch Insights and see how this affected the metrics for our cluster.
* So we go back to the CloudWatch dashboard, click on CloudWatch Insights under the Overview section, and we'll notice that we have other options here.
* I could look at EKS Clusters.
* I could look at my ECS Services as well as my ECS Tasks and get information on all of those components.
* Just like with our ECS Clusters, you can view CPU, network, disk and memory utilization for your tasks and services as well and filter through them.

-
* But now let's go ahead and look at the number of ECS tasks I have for my cluster.
* So I'll click on ECS Clusters, filter it by `fargate-cluster3` once again, and we'll look at my task count.
* Here we can see the task count steadily increasing to be four tasks.
* We can go ahead and refresh and see this change as CloudWatch collects information.


-
* You can also search and analyze your ECS log data as well using CloudWatch Logs Insights.
* To use this, we'll go ahead and go to the left-hand side and click on CloudWatch Insights under the Logs section.
* From there, you can choose which log group you want to work with.
* If you enable CloudWatch Container Insights in the ECS dashboard as I did earlier in this video, it will autopopulate ECS logs.

-
* CloudWatch Logs Insights allows you to visualize your log data and perform queries to help you troubleshoot and identify potential issues.
* It uses a query language that has a few simple commands such as stats.
* Stats allows us to calculate statistics based off of the values of log fields.

-
* For example, I could do stats average of CPU utilization, average of memory utilization by bin30m.
* This allows me to see the average CPU utilization and memory utilization for log events for each 30-minute period.
* If you wanted to you can use this information to improve performance for your tasks over time.
* The result shows the number of log events in the log group that were received by CloudWatch Logs for each 30-minute period.

-
* To visualize this, you can click on the Visualization tab and the results here will be shown as a line graph.
* You can also view this information in a stacked area chart or a bar chart as well.
* If you're leveraging ECS or EKS, using CloudWatch Insights can provide diagnostic information, metrics, and log investigation.