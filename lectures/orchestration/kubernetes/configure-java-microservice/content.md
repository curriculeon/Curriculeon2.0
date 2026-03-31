<!-- (https://kubernetes.io/docs/tutorials/configuration/configure-java-microservice/configure-java-microservice-interactive/) -->

# Configuring a Java microservices
* **Objective** - Breakout rooms to configuring a java microservices:
	* have a driver
	* Documenter
	* All must complete the tutorial
	* presenter

## Overview
* Prerequisites
* Start Kubernetes
* Navigate to microservices directory
* Build each microservice
* Deploy each microservice
* Check Status of Microservices
* Send GET Request to system Service
* Send GET Request to inventory Service
* Fetch Current Values from Kubernetes ConfigMap 
* Modify Values from Kubernetes ConfigMap 
* Modify System Microservice
* Modify Inventory Microservice
* Create ConfigMap
* Create Secret to Configgure Inventory Service Credentials
* Update Kubernetes Resources
* Add Kubernetes.yml to start directory
* Deploy Changes
* Delete Old Kubernetes Deployment
* Check Staus of Pods of Services
* Call Updated System Service
* Verify Inventory Service is using Kubernetes Secret

    
    


	



### Prerequisites
* [Install Docker](../../../containerization/docker/installation/index.md)
* [Install Kubectl](../install-kubectl/content.md)
* [Install Minikube](../install-minikube/content.md)



### Clone Project
* Clone project by clicking [here](https://github.com/jamiecoleman92/guide-kubernetes-microprofile-config)


### Start Kubernetes

### Navigate to microservices directory
* Execute the command below to navigate to microservices directory
	* `cd guide-kubernetes-microprofile-config/start/`


### Build Each Microservice
* Build each microservice
	* `mvn package -pl system`
	* `mvn package -pl inventory`
	
### Deploy Each microservice
* Use the yaml file to deploy 2 microservices and accompanying services by executing command below
	* `kubectl apply -f kubernetes.yaml`

### Check Status of Microservices
* The two commands below will check the status of the pods and check when they are in a ready state.
* This is done by providing the command with the labels for the pod such as inventory.
* Issue the following commands to check the status of your microservices:

```
kubectl wait --for=condition=ready pod -l app=inventory
kubectl wait --for=condition=ready pod -l app=system
```


### Send GET Request to system Service
* use `curl` to make an `HTTP GET` request to the `system` service.
* The service is secured with a user id and password that is passed in the request.
* Execute the command below
	* `curl -u bob:bobpwd http://$( minikube ip ):31000/system/properties`

### Send GET Request to inventory Service
* The inventory service will call the system service and store the response data in the inventory service before returning the result.
* use the following curl command to call the inventory service:
* Execute the command below
	* `curl http://$( minikube ip ):32000/inventory/systems/system-service`
	

### Fetch Current Values from Kubernetes ConfigMap 
* use a Kubernetes `ConfigMap` to modify the `X-App-Name`: response header.
* Take a look at their current values by running the following curl command:

```
curl -# -I -u bob:bobpwd -D - http://$( minikube ip ):31000/system/properties | grep -i ^X-App-Name:
```


### Modify Values from Kubernetes ConfigMap 
* use a Kubernetes `ConfigMap` to modify the `X-App-Name`: response header.
* Take a look at their current values by running the following curl command:

```
curl -# -I -u bob:bobpwd -D - http://$( minikube ip ):31000/system/properties | grep -i ^X-App-Name:
```

### Modify System Microservice
* The `system` service is hardcoded to have `system` as the app name.
* To make this configurable, add the `appName` member and code to set the `X-App-Name` to the `SystemResource` file.
* Add the code below to the file `/guide-kubernetes-microprofile-config/start/system/src/main/java/system/SystemResource.java`
* These changes use `MicroProfile Config` and CDI to inject the value of an environment variable called `APP_NAME` into the appName member of the `SystemResource` class.

```java
package system;

// CDI
import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.GET;
// JAX-RS
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.eclipse.microprofile.config.inject.ConfigProperty;

@RequestScoped
@Path("/properties")
public class SystemResource {

  @Inject
  @ConfigProperty(name = "APP_NAME")
  private String appName;

  @Inject
  @ConfigProperty(name = "HOSTNAME")
  private String hostname;

  @GET
  @Produces(MediaType.APPLICATION_JSON)
  public Response getProperties() {
    return Response.ok(System.getProperties())
      .header("X-Pod-Name", hostname)
      .header("X-App-Name", appName)
      .build();
  }
}
```



### Modify Inventory Microservice
* The `inventory` service is hardcoded to use `bob` and `bobpwd` as the credentials to authenticate against the `system` service.
* make these credentials configurable using a Kubernetes Secret.
* These changes use `MicroProfile Config` and CDI to inject the value of the environment variables `SYSTEM_APP_USERNAME` and `SYSTEM_APP_PASSWORD` into the `SystemClient` class.
* In a text editor, open the file by clicking on the navigating to the link below
    * `/guide-kubernetes-microprofile-config/start/inventory/src/main/java/inventory/client/SystemClient.java`
    * Edit the two lines under `// Basic Auth Credentials` with the following

```java
  // Basic Auth Credentials
  @Inject
  @ConfigProperty(name = "SYSTEM_APP_USERNAME")
  private String username;

  @Inject
  @ConfigProperty(name = "SYSTEM_APP_PASSWORD")
  private String password;
```



### Create ConfigMap
* Create a `ConfigMap` to configure the application name by executing the command below:
    * `kubectl create configmap sys-app-name --from-literal name=my-system`
    * This command deploys a `ConfigMap` named `sys-app-name` to your cluster.
    * It has a key called `name` with a value of `my-system`.
    * The `--from-literal` flag allows you to specify individual key-value pairs to store in this `ConfigMap`.



### Create Secret to Configure Inventory Service Credentials
* Create a secret to configure the credentials that the `inventory` service will use to authenticate against system service with the following `kubectl` command:
    * `kubectl create secret generic sys-app-credentials --from-literal username=bob --from-literal password=bobpwd`


### Update Kubernetes Resources
* Update Kubernetes deployment to set the environment variables in your containers, based on the values configured in the `ConfigMap` and `Secret`.
* Edit the `kubernetes.yaml` file (located in the `start` directory).
* This file defines the Kubernetes deployment.
    * Note the `valueFrom` field.
        * This specifies the value of an environment variable, and can be set from various sources.
        * Sources include
            * a ConfigMap,
            * a Secret
            * information about the cluster
        * In this example `configMapKeyRef` sets the key name with the value of the `ConfigMap` `sys-app-name`. Similarly, `secretKeyRef` sets the keys username and password with values from the Secret `sys-app-credentials`.
        * Similarly, `secretKeyRef` sets the keys username and password with values from the Secret `sys-app-credentials`.


### Add Kubernetes.yml to start directory
* Edit the `kubernetes.yaml` file in the `start` directory by adding the following lines of code:

```yml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: system-deployment
  labels:
    app: system
spec:
  selector:
    matchLabels:
      app: system
  template:
    metadata:
      labels:
        app: system
    spec:
      containers:
      - name: system-container
        image: system:1.0-SNAPSHOT
        ports:
        - containerPort: 9080
        # Set the APP_NAME environment variable
        env:
        - name: APP_NAME
          valueFrom:
            configMapKeyRef:
              name: sys-app-name
              key: name
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: inventory-deployment
  labels:
    app: inventory
spec:
  selector:
    matchLabels:
      app: inventory
  template:
    metadata:
      labels:
        app: inventory
    spec:
      containers:
      - name: inventory-container
        image: inventory:1.0-SNAPSHOT
        ports:
        - containerPort: 9080
        # Set the SYSTEM_APP_USERNAME and SYSTEM_APP_PASSWORD environment variables
        env:
        - name: SYSTEM_APP_USERNAME
          valueFrom:
            secretKeyRef:
              name: sys-app-credentials
              key: username
        - name: SYSTEM_APP_PASSWORD
          valueFrom:
            secretKeyRef:
              name: sys-app-credentials
              key: password
---
apiVersion: v1
kind: Service
metadata:
  name: system-service
spec:
  type: NodePort
  selector:
    app: system
  ports:
  - protocol: TCP
    port: 9080
    targetPort: 9080
    nodePort: 31000
---
apiVersion: v1
kind: Service
metadata:
  name: inventory-service
spec:
  type: NodePort
  selector:
    app: inventory
  ports:
  - protocol: TCP
    port: 9080
    targetPort: 9080
    nodePort: 32000
```



### Deploy Changes
* You now need rebuild and redeploy the applications for your changes to take effect.
* Rebuild the application by executing the commands below from the `start` directory:
    * `mvn package -pl system`
    * `mvn package -pl inventory`


### Delete Old Kubernetes Deployment
* Now you need to delete your old Kubernetes deployment then deploy your updated deployment by issuing the following commands:
    * `kubectl replace --force -f kubernetes.yaml`


### Check Staus of Pods of Services
* Check the status of the pods for the services by executing the command below:
    * `kubectl get --watch pods`
* You should eventually see the status of `Ready` for the two services.
* Press `Ctrl-C` to exit the terminal command. 



### Call Updated System Service
* Call the updated system service and check the headers by executing the command below:
    * `curl -u bob:bobpwd -D - http://$( minikube ip ):31000/system/properties -o /dev/null`


### Verify Inventory Service is using Kubernetes Secret
* Verify that inventory service is now using the Kubernetes Secret for the credentials by executing the command below:
    * `curl http://$( minikube ip ):32000/inventory/systems/system-service`


