# Deploy Multiple Apps to Kubernetes Cluster

## Overview
1. Prerequisites
2. Append to `hosts` file
3. Create Deployment.yml



### Prerequisites
1. [Install Docker](../../../containerization/docker/installation/index.md)
2. [Install Kubectl](../install-kubectl/index.md)
3. [Install Minikube](../install-minikube/index.md)


### Fetch minikube IP
* Execute the command below to get minikube IP address
    * minikube ip


### Append to Hosts File
* Execute the command below to append to your hosts file

```bat
echo "${MY-MINIKUBE_IP}	adminer.k8s.com" >> c:\Windows\System32\Drivers\etc\hosts
echo "${MY-MINIKUBE_IP}	kanban.k8s.com" >> c:\Windows\System32\Drivers\etc\hosts
```

### Create Deployment.yml


```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: adminer
  labels:
    app: adminer
    group: db
spec:
  replicas: 1
  selector:
    matchLabels:
      app: adminer    # indicates which Pods (with which labeles) need be handled by this Deployment
  template:
    metadata:         # indicates the metadata that will be added to each Pod
      labels:
        app: adminer
        group: db
    spec:
      containers:     # defines a running container inside the Pod
        - name: adminer
          image: adminer:4.7.6-standalone
          ports:
            - containerPort: 8080   # which port of the container is exposed to the Pod
          env:
            - name: ADMINER_DESIGN
              value: pepa-linha
            - name: ADMINER_DEFAULT_SERVER
              value: postgres
```



### Run adminer-deployment.yml
* Execute command below
    * `kubectl apply -f adminer-deployment.yaml`


### Verify adminer 

<!-- https://wkrzywiec.medium.com/deployment-of-multiple-apps-on-kubernetes-cluster-walkthrough-e05d37ed63d1 -->