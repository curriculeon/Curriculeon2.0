<!--
https://www.linode.com/docs/guides/install-canvas-lms-on-ubuntu-2004/
https://github-wiki-see.page/m/mskcodes/canvas-lms/wiki/Production-Start
https://github.com/FreedomBen/canvas-development-tools/
https://www.youtube.com/watch?v=s6aLDJtkeNc&ab_channel=%E6%9D%9C%E6%9D%9C
-->

# Running Canvas LMS Locally

## Overview
1. Virtualize Ubuntu 16.04 in VirtualBox
2. Configuring Ubuntu Environment
3. Quick Starting `Canvas-LMS`


### Part 1 - Virtualize Ubuntu 16.04 in VirtualBox
* [Install VirtualBox](https://curriculeon.github.io/Curriculeon/lectures/virtualization/virtual-box/installation/content.html)
* [Create new Ubuntu 16.04 image using VirtualBox](https://curriculeon.github.io/Curriculeon/lectures/virtualization/virtual-box/install-ubuntu/content.html)
	* it is **imperatrive** the machine used has at least 8GB memory


### Part 2 - Initialize Ubuntu Environment
* Download [this file](./initialize-ubuntu-environment.sh).
* Execute the command below to switch to `root` user.
    * `sudo -s`
* Change the file's permissions to executable
	* `chmod u+x initialize-ubuntu-environment.sh`
* Execute the file
	* `initialize-ubuntu-environment.sh`

[![](./imgs/initialize-ubuntu-for-canvaslms.gif)](./imgs/initialize-ubuntu-for-canvaslms.gif)


### Part 3 - Config Database
* Execute the command below and replace the `database.yml` contents

	```bash
	nano config/database.yml
	```

	* replacement content:

	```yml
	# do not create a queue: section for your test environment
	test:
		adapter: postgresql
		encoding: utf8
		database: canvas_test
		host: localhost
		username: canvas
		password: pass
		timeout: 5000

	development:
		adapter: postgresql
		encoding: utf8
		database: canvas_production
		host: localhost
		username: canvas
		password: pass
		timeout: 5000

	production:
		adapter: postgresql
		encoding: utf8
		database: canvas_production
		host: localhost
		username: canvas
		password: pass
		timeout: 5000
	```

