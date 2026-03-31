# Part 2 - IAM, Identity and Access Management

## Defining Terms

### Root Account
* Primary purpose of Root Account is to make IAM Users and groups.
* The purpose of Users and groups is to narrow accessible resources of a client on an AWS Account to only those which are necessary.
* Users can be assigned JSON Documents called policies.
* Policies define permissions which dictate what resources a user can access, and what actions they can perform on that resource.


### Groups
* Groups can only contain users.
* Groups cannot contain groups.

### Users
* Users are people within an organization.
* Users can be grouped
* Users do not have to belong to a group.
* Users can belong to multiple groups.

## IAM Policy Structure
* Consists of
    * Version
    * Id (_optional_)
    * Statement
* Statement consists of
    * `Effect`: whether the statement allows or denies access (`allow`, `deny`)
    * `Principal`: account/user/role to which this policy us applied to
    * `Action`: list of actions this policy allows or denies
    * `Resource`: list of resources to which the actions applied to
    * `Condition`: conditions for when this policy is in effect (optional)

### Example Policy

```json
{
    "Version": "2012-10-17", // specifies the version of the policy language.
    "Statement": [ // contains an array of individual statements, each of which represents a permission rule.
        {
            "Effect": "Allow", // indicates that the actions specified will be allowed.
            "Action": [ // specifies the AWS API actions that are allowed.
                "iam:GenerateCredentialReport",
                "iam:GenerateServiceLastAccessedDetails",
                "iam:Get*", // any action prefixed with `Get`        
                "s3:GetObject", // allows `s3:GetObject` (to read objects)
                "s3:ListBucket" // allows `s3:ListBucket` (to list objects in the bucket)
            ],
            "Resource": [
                "arn:aws:s3:::your-bucket-name", // represents the bucket itself
                "arn:aws:s3:::your-bucket-name/*" // represents all objects within the bucket
            ]
        }
    ]
}
```