# Demo: MongoDB and MongoExpress
<!-- ABOUT THE PROJECT -->
## About The Repository

This repo deploys 2 applications: MongoDB and MongoExpress since it demonstratee really wlel a typical simple setup of a web application and its database

## Overview of K8s Components
* 2 Deployments/Pods
* 2 Services
* 1 ConfigMap
* 1 Secret

## About architechture
![image](https://github.com/user-attachments/assets/97d4abeb-acf5-4401-9f5b-c506a971fa32)
![image](https://github.com/user-attachments/assets/8ad76492-03ef-4783-b222-3982e36c8d5e)

## Browser Request Flow through the K8s components
Request comes from the browser and goes to MongoExpress external service which will forward to MongoExpress Pod. The Pod will then connect to internal service of MongoDB then continues to forward to MongoDB Pod where it will authenticate the request using credentials.
![image](https://github.com/user-attachments/assets/7b733cf4-d8b7-4554-9eec-2bdf62b05d3a)

## Running components
```sh
minikube start #Start the minikube cluster
echo -n <username> | base64
echo -n <password> | base64
#You can use these data to authenticate the request by pasting into mongo-secret.yaml
kubectl apply -f mongo-secret.yaml
kubectl apply -f mongo.yaml
kubectl apply -f mongodb-configmap.yaml
kubectl apply -f mongo-express.yaml
kubectl get svc # To check services running
minikube service mongo-express-service
```
![image](https://github.com/user-attachments/assets/c609b7a7-d7bb-42fd-b3ad-a1e66552627d)

If your browser required to login, ```sh kubectl logs <mongo-express-pod-id>``` to see the default username and password (basically "admin:pass")
Note that: Storing the data in Secret component doesn't automatically make it secure
There are built-in mechanism for basic security, which are not enabled by default
It's important to use '-n' tag in 'echo' command otherwise it's not going to work!
## References
https://hub.docker.com/_/mongo-express
https://hub.docker.com/_/mongo
https://www.youtube.com/watch?v=X48VuDVv0do
https://kubernetes.io/docs/concepts/
