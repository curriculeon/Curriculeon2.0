# Amazon Web Services
## Hosting Static HTML





-
-
### Prequisites
* AWS Account
    * Click [here]() to view the lecture on creating an AWS account.
* Domain Name and DNS Access
    * Click [here]() to view the lecture on acquiring a domain name
    * Click [here]() to view the lecture on acquiring DNS access





-
-
### Part 1 - Create S3 Bucket
* Sign into your AWS console and go to S3 service at `https://console.aws.amazon.com/s3/`. 
* Create two S3 buckets
	* `www.example.com` and `example.com`
	* Ensure `blocking all public access` is disabled and all other settings are default.
   * Upload you website to your `www.example.com` bucket.






-
### Part 2 - Upload site to S3 Bucket
* From the `www.example.com` bucket select **Permissions** and select **Bucket Policy**
   * **Replacing version date with the current date and `example.com` with the bucket name** copy and paste the following `.json` bucket policy.


-

```json
{
   "Version":"2012-10-17",
   "Statement":[
      {
         "Sid":"PublicReadGetObject",
         "Effect":"Allow",
         "Principal":"*",
         "Action":[
            "s3:GetObject"
         ],
         "Resource":[
            "arn:aws:s3:::example.com/*"
         ]
      }
   ]
}
```




-
* Press Save and BOOM now have public read access so people can view your bucket



-
### Part 3 - Static Website Hosting
* Next after applying policy
   1. Go to **Properties**
   2. Select **Static Website Hosting**
   3. Select first option *Use this bucket to host a website* 
   4. In the **Index Document** box, type the name that you gave your index page then click save.
   5. Next, go to your other bucket `example.com`, select **Properties**, select **Static Website Hosting**, and select the *Redirect requests* option


-
### Part 4 - Ensuring the application works
* To ensure that the website has been hosted, navigate to ...