# Amazon Web Services
## Deployment


You and your organization will decide on the culture, practices, and tools that work for you.
We can work through the steps we plan to automate.
We can group these steps into Continuous Integration, CI, and Continuous Delivery, CD.
Continuous integration is the build and unit testing stages of the software release process.
We will run automated build and test with every commit of code.


Code, software engineers are working on code
and we will want to think about a shared source repository
for engineers to commit code.

Build, we need a location to build our application, for example compiling the code.
It's best to do this in a clean consistent environment.
This tells us the code coming from our source repository is in a good state.
Code in a bad state can hit the productivity of the team.

Test, software engineers are running code.
We are also running unit tests to test our code.
This is where we can perform some code analysis like linting tools.
Tests will run with every commit, again giving us immediate feedback on the quality of our code.
With Continuous Delivery, we extend this process.
Code changes are automatically built, tested, and prepared for a release.

Provision, now that we have code we are happy with, we can provision a test environment.
Here we are turning on the compute, network, and storage resources for our applications.
We don't want to do this manually.
Within AWS, everything can be scripted and we can look at products that will help with this.

Deploy, we want to automate the process of getting our application installed and configured on our provisioned environment.
If we automate this process, we are also capturing a lot of tribal knowledge that could be lost if this was a manual process.

Acceptance test, our code has made it onto our provision environment, now we can perform end-to-end integration tests.
This automates many of the sanity tests that you would want to perform to ensure nothing bad has been introduced.
But does our process end here?
No, along the way we are monitoring the software.
Continuous automated builds are giving us feedback on the health of the code.
Once we are in a production environment, development and operation teams can work together to build monitoring solution.