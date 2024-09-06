delete:
	kubectl delete service mongo-express-service mongodb-service
	kubectl delete deployment mongo-express mongodb-deployment
	kubectl delete secret mongodb-secret
	kubectl delete configmap mongodb-configmap
	echo ">>> Deleted components"
build:
	kubectl apply -f mongo-secret.yaml
	kubectl apply -f mongo.yaml
	kubectl apply -f mongo-configmap.yaml 
	kubectl apply -f mongo-express.yaml
	echo ">>> Finish build components"