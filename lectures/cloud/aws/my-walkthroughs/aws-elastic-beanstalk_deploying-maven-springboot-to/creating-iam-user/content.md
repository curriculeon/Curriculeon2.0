<!-- https://www.udemy.com/course/deploy-java-spring-boot-to-aws-amazon-web-service/learn/lecture/15443692#overview -->

# Amazon Web Services
## Creating IAM User

-
* Navigate to `console.aws.amazon.com` to sign in as Root user
* Upon signing in as a root user, navigate to `console.aws.amazon.com/iam` to create a new user
* Select `0 users` from the dashboard.
* Select `new`


-
### Select AWS access type
* Select `Programmatic Access`
* Select `AWS Management Console access`

-
### Add Policies to User
* Add `AdministratorAccess` Policy to newly created user
    * This gives full AWS access to user.
    * this should be modified to match specific needs

-
### Creating new User
* (Optional: Add Tags)
* Finish the creation process by clicking `Create`

[<img src="./create-iam-user.gif">](./create-iam-user.gif)

-
### Obtaining Credentials
* Upon inspecting the newly created User from the root user console interface, copy the `ARN` from the security credentials tab.


-
### Sign in as IAM User
* Sign out as Root user
* Navigate to `console.aws.amazon.com` and sign in as `IAM` using `ARN` credentials