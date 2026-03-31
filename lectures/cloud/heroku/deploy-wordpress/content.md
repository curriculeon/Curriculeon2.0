# Heroku Wordpress Deployment


### Overview
* Prerequisites
* Clone Heroku flavored Wordpress Instance

### Prequisites
* [Heroku Account](../create-account/content.md)
* [Heroku Cli](../install-cli/content.md)

### Clone Heroku flavored Wordpress Instance
* Execute the command below to download Heroku flavored Wordpress instance
    * `git clone https://github.com/mhoofman/wordpress-heroku.git`

### Initialize Heroku Application
* Execute the command below to download Heroku flavored Wordpress instance
    * `heroku create`

### Add Heroku-PostgreSQL AddOn
* Execute the command below to add Heroku-PostgreSQL AddOn
    * `heroku addons:create heroku-postgresql`
* _Take note of the name of the newly added `postgresql` database name_


### Provision PostgreSQL Database
* Execute the command below to provision PostgreSQL database
    * `heroku pg:promote postgresql-tetrahedral-56871`

### Push Contents to Heroku
* Execute the command below to push contents to Heroku
    * `git add .`
    * `git push heroku master`

[<img src="./deploy-wordpress.gif">](./deploy-wordpress.gif)