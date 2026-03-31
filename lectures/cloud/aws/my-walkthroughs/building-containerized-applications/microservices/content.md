# Amazon Web Services
## Microservices


-
### Monolithic Applications
* We generally discuss monoliths as an anti-pattern because of the way they can be brittle to change
* can constrain teams trying to scale and adapt quickly
* especially true when we look at the extreme examples where all of the functionality of an application is handled in a single package.
* This software architecture starts to show limitations when looking at the ability, scalability and reliability of the app.
* To visualize this, let's look at an application.


* For this example let's make it a photo sharing application.
* The functional parts of this photo sharing application that we are going to look at are our user verification, user profiles, photo viewing, photo uploading and the photo editing components.
* First, we'll take the worst possible way to do this.
* What you see here is a single server containing absolutely everything that is needed for this monolithic photo sharing application.
* Once a request hits the server, the user first has to verify their identity.
* Then they have the ability to upload their photos.
* The photos after upload are edited in a basic way where they are resized for mobile and desktop viewing as well as creating a thumbnail.
* The user, after editing, is now able to view their photos and other information as part of their profiles.
* Seeing the faults in this design is pretty easy.
* Even if this application is very resource efficient, the amount of resources available would have to be quite large to accommodate a software package like this monolith.
* Even if we're storing and serving the photos from a separate location, the user databases for credentials and their profiles would require an ever growing amount of storage.
* Then as we look at the uploading, we're looking at the network utilization and likely the in memory storage where the photos will sit while waiting for processing.
* After that let's consider the compute power available for the resizing aspects.
* For a few photos this may be fine on one server, but a growing user base with everything else that we've already discussed is quickly going to increase your CPU demands on the server.
* Unfortunately the way it sits, I cannot scale the photo processing service.
* I would have to scale the entire application likely by spinning up another server.
* Remember, this is some of the basic functionality that we've discussed here.
* We haven't talked about encryption, queuing or any other essential processes that it would take to actually make this run in a real world scenario.
* Because of how incredibly faulty this first one is, how about I run you through a more realistic setup? In version two a small step has been taken towards some decoupling.
* User profile data is stored off server.
* The raw photos are still being stored and served from another storage location and the server in this case is only handling the user verification, initial receipt and processing of the images.
* What kind of issues are likely to arise? If just looking at these tasks, the servers have to be fine, right? Well look at how this design handles failures and scaling.
* Failures of a function within the application would likely bring the application running on that server to a halt which would then require you to spin up a replacement.
* Because of all of the operations being done on the single server, the user would then have to set their photos for processing again as long as the raw photo was pushed to the persistent storage before the processing.
* Looking at scaling, running more servers is easier because the persistent data is held off server, but sticky sessions or cookies would essentially be a must to ensure the user was able to access their specific jobs without having to reverify every time they reconnect.
* And when scaling in, various safeguards would have to be put into place to make sure that jobs weren't lost when removing servers from the scaling group.
* With enough work and with the correct supporting functions in place, this would be a workable solution, but I still wanna show you the next step.
* The next level of this decoupling would break the functionality of your application into microservices.
* An application designed this way separates the jobs that would be done by an individual server into independent smaller services coined as microservices.
* Microservices gives you the ability to use smaller resources to handle large tasks simply by splitting the jobs up into smaller workloads.
* Instead of requiring a server to handle everything from A to Z, you're able to have the microservices work just their workload and then communicate between each other to make sure that the workload is fully covered.
* For our application what would this look like? In additional to our persistent data stores, we would have functions for user verification, profile viewing, upload management and photo processing.
* Requests for users would be routed to the user verification service first and once verified, they would be able to make selections on what they wanted to do from their profile.
* If uploading a photo, it would be received by the uploading function which would store the original file in the appropriate location, then tell the image processing functions where to retrieve the image for editing before serving it back to the user.
* In terms of recoverability, if any function has an issue or goes down, the others are still able to continue while replacements are brought online.
* With scalability, you gain the potential to scale exactly what needs to be scaled.
* If the image processing needs more capacity, that can be directly addressed while leaving other functions to continue as they are.
* And in addition to reliability and scaling, you gain the potential for expandability.
* With the monolithic deployments, if you wanted to add something like a queuing function, it would require a lot of reorganization and redistribution of resources.
* And likely a much larger server as well.
* With a microservice oriented architecture, adding queues would just require slight changes to the workflow, but the other functions would be able to continue without drastic modifications.
* I hope that starts to give you an idea of how helpful architecting towards microservices can be and I'm sure it's no surprise that containers lend themselves quite well towards handling these microservices.
* The flexibility, speed and recoverability of containers are just a few of the reasons why they fit so well into the role.
* The flexibility is demonstrated with how containers are able to instantiate nearly anything a server would be able to do just at a smaller scale.
* Whether a web front end, processing or database function, this can be handled by containers.
* Additionally, the ease of creating and modifying container images means that you can quickly launch additional capacity or replacements of any function whenever they're needed.
* As you continue through the course, keep thinking about how you can not only implement containers, but also how you can decompose applications into microservices using both managed services and your own containers.
* End of transcript.
* Skip to the start.