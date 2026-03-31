# Part 3 - Password Policy <!-- # Part 3 - EC2, Elastic Compute Cloud -->

### How to Set up
* You can setup password policy by
    * Allow all IAM users to change their own passwords
    * Prevent password reuse
    * Set password expiration
    * Set password conditions
        * set minimum length
        * include numbers
        * include case-specific letters
        * include non-alphanumeric characters

### Multi Factor Authentication - MFA
* Practically imperative to use on AWS for your root account and suggestably IAM users as well.
* MFA = your password + security device that you own
* Main benefit - even if a password is stolen, forgotten, or broken, the account will not be compromised without procuring the physical devices of owner

### MFA Device Options in AWS
* Authy - Multiple devices
* Google Authenticator - 1 Phone at a time only
* Universal 2nd Factor (_U2F_) Security Key - physical devices
* you can use multiple tokens on a single device
    * I.e. you can access
        * Your root user
        * Your IAM user1
        * Your IAM user2
        * Your IAM user3