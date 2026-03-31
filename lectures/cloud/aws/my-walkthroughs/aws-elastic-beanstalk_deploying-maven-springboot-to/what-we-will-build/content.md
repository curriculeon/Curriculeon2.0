# Amazon Web Services

## What we will build
Code and build is all happening inside our local environment.
In the exercises, we will be coding, building, and testing on a Cloud9 instance, or this is the equivalent of something you might be doing on your own laptop.
When we're happy with the code, we're ready to provision and deploy it somewhere.
Let's pretend our manager has walked over and said,
   "Let's have a look at your proof of concept."
We are going to need a place, or an environment, provisioned for this proof of concept.
In the exercises in week one, we will be doing this with Elastic Beanstalk.

There will be acceptance tests, but let's say we're doing this manually.
I'm shooting it out into an environment created for me by Beanstalk.
Then I'm jumping onto a browser, clicking through, and saying, yes, everything is meeting my level-of-acceptance test.
As we progress through the weeks, we will look at the processes that we will take to automate each of these steps in the CI/CD pipeline.
Towards the end of the course, we'll start thinking about, what are our options for deploying to a prod-like environment?
We might have many environments inside our organization:
   an environment for QA testing,
   an environment for another version of the application.
At the end of the CD pipeline, we have an artifact that is ready to be deployed to an environment.
So that's a quick introduction to week one.
