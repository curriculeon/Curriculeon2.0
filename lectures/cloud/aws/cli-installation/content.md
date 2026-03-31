# AWS Command Line Interface Installation
* _Click [here](./troubleshooting) to view the troubleshooting content for this document_




## Create an Access Key

1. [Create an IAM User](../iam/creating-user/content.md)
2. Navigate to [`https://console.aws.amazon.com/iam/`](https://console.aws.amazon.com/iam/)
3. In the navigation pane, choose `Users`.
4. Select the name of the user you would like to generate an access key for
5. Select the `Security credentials` tab.
6. Select `Create access key` from the `Access keys` section.


[![](./aws-create-access-key.gif)](./aws-create-access-key.gif)







## Install AWS CLI


## Windows Operating System

* Execute the command below from an administrative PowerShell.
   * `choco install awscli`


[![](./choco-install-awscli.gif)](./choco-install-awscli.gif)


## Verify Installation
* Execute the command below to ensure that the AWS CLI has been installed
   * `aws --version`
* Execute the command below to ensure that the `.aws` directory has been created
   * `cd ~/.aws`   

[![](./aws-cli-verify.gif)](./aws-cli-verify.gif)



## Configure AWS CLI

* Upon executing `aws configure` the AWS CLI prompts you for:
   * Access key ID
   * Secret access key
   * AWS Region
   * Output format

* Sample output

```
AWS Access Key ID [None]: AKIAIOSFODNN7EXAMPLE
AWS Secret Access Key [None]: wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY
Default region name [None]: us-west-2
Default output format [None]: json
```


[![](./aws-cli-configure.gif)](./aws-cli-configure.gif)

## Validate AWS CLI Configuration
* Execute the command below to verify that the `~/.aws/credentials` file has been modified respectively
   * `cat ~/.aws/credentials`


[![](./aws-cli-verify-configure.gif)](./aws-cli-verify-configure.gif)


## Verify AWS CLI Configuration
* Execute the command below to verify that you are able to connect.
   * `aws iam list-users`
* Ensure the command output **is <u>not</u>** the text below
   * `An error occurred (InvalidClientTokenId) when calling the ListUsers operation: The security token included in the request is invalid.`




## Fetch ECR Password

* Execute the command below to fetch the ecr login password
   * `aws ecr get-login-password`

* Execute the command below to log in
   * `aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin AMAZON_USER_ID.dkr.ecr.us-east-1.amazonaws.com`