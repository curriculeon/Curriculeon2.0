# Running Canvas LMS Locally

## Overview
1. Virtualize Ubuntu 16.04 in VirtualBox
2. Configuring Ubuntu Environment
3. Quick Starting `Canvas-LMS`


### Part 1 - Virtualize Ubuntu 16.04 in VirtualBox
* [Install VirtualBox](https://curriculeon.github.io/Curriculeon/lectures/virtualization/virtual-box/installation/content.html)
* [Create new Ubuntu 16.04 image using VirtualBox](https://curriculeon.github.io/Curriculeon/lectures/virtualization/virtual-box/install-ubuntu/content.html)


### Part 2 - Configuring Ubuntu Environment
* install `curl`

	```bash
	sudo apt install curl
	````

* Execute the command below to install `Git`

	```bash
	sudo apt install git
	```

* Execute the command below to install `Docker`
	
	```bash
	sudo apt install docker.io
	```

* Execute the command below to `curl` an installation of  `Docker-Compose 1.20.0`
	
	```bash
	sudo curl -L "https://github.com/docker/compose/releases/download/1.20.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	```

* Execute the command below to change permissions on `docker-compose` installation
	
	```bash
	sudo chmod +x /usr/local/bin/docker-compose
	```

* Execute the command below to verify that `docker-compose` has been installed

	```bash
	docker-compose -version
	```

* Execute the command below to create a `dev` directory

	```bash
	mkdir ~/dev
	```



### Part 3 - Quick Starting `Canvas-LMS`
* Execute the command below to clone `canvas-lms`

	```bash
	git clone https://github.com/instructure/canvas-lms.git ~/dev/canvas-lms
	```

* Execute the command below to change directories to newly cloned project

	```bash
	cd ~/dev/canvas-lms
	```

* Execute the command below to quick-start the project
	
	```bash
	./script/docker_dev_setup.sh
	```





<hr/><hr/>
# Troubleshooting



### E: Could not get lock /var/lib/dpkg/lock-frontend - open (11: Resource temporarily unavailable)
This may happen if

1.  'Synaptic Package Manager' or 'Software Updater' is open.
    
2.  Some apt command is running in Terminal.
    
3.  Some apt process is running in background.
    

For above wait for the process to complete. If this does not happen run in terminal:


```bash
sudo killall apt apt-get
```

If none of the above works, remove the lock files. Run in terminal:

```bash
sudo rm /var/lib/apt/lists/lock
sudo rm /var/cache/apt/archives/lock
sudo rm /var/lib/dpkg/lock*
```

then reconfigure the packages. Run in terminal:

```bash
sudo dpkg --configure -a
```

and

```bash
sudo apt update
```
