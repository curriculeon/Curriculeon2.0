# Amazon Web Services
## Kubernetes Overview

* Kubernetes, from the Greek, meaning helmsman or pilot.
* Kubernetes is also a very popular, portable, extensible, open-source platform for managing containerized workloads and services, that facilitates both declarative configuration and automation.
* Okay, but what does that mean? Let's break it down.


-
* The Kubernetes project itself is managed by the Cloud Native computing foundation, or CNCF.
* It is the second most active repository on GitHub, behind the Linux kernel itself.
* Kubernetes is run by all kinds of companies and all kinds of industries and in all kinds of locations.

-
* Kubernetes can be run anywhere.
* It's incredibly portable, from a single node system running on a laptop, to a multi-thousand node cluster in the cloud.
* From a handful of Raspberry Pi's, to a redundant cluster of high performance GPU powered servers.
* The underlying implementation and interaction with Kubernetes is the same, no matter where it's run.


-
* Kubernetes is also extensible.
* There is a deep and wide ecosystem of software additions, tools and integrations for just about every type of workflow out there.
* Because of its portability, Kubernetes is run in many types of environments and there are many developers and companies building integrations from everything from IoT devices to GPU powered machine learning.
* And this development, for the most part, happens within the open-source community.

-
* Kubernetes has been held up as an example of how open-source technology can power innovation and collaboration on a scale previously impossible.
* The portability and extensibility of Kubernetes require visibility and access to the underlying source code.

-
* In the end, Kubernetes is an orchestration platform.
* As an orchestrator, it handles the work of scheduling containers onto hosts and integrating those containers with each other with the rest of the platform and with external services, no matter where those services are.

-
* Lastly, Kubernetes is entirely based around declarative configuration.
* Rather than imperatively spinning up a container,
    "Hey Kubernetes, spin up a container for me."

-
* With Kubernetes, you describe the desired state of the platform.
    * "Hey Kubernetes, I want a container over here."
* And Kubernetes will automatically and continuously reconcile the current state of the platform with the desired state of the platform.
* In this case, it would spin up one container and make sure there is always one container running until I change the desired state of the platform.

-
* The declarative nature of Kubernetes leads to a number of innovative DevOps patterns.
* Because you describe a desired state and Kubernetes handles the actual implementation, the files that describe the state can be checked into a version control system, such as Git, and repeatedly and deterministically deployed.
* This allows for a tremendous amount of automation and a single source of truth for how the overall system should always look, feel and behave.

-
* The downside of all this flexibility and power, is that Kubernetes is complex and can be daunting.
* Luckily, AWS has a service that removes some of that complexity by providing a fully managed, 100% upstream implementation of Kubernetes.