delete:
	kubectl delete service mongo-express-service mongodb-service
	kubectl delete deployment mongo-express mongodb-deployment
	echo ">>> Deleted components"
build:
	kubectl apply -f mongo-secret.yaml
	kubectl apply -f mongo.yaml
	kubectl apply -f mongo-configmap.yaml 
	kubectl apply -f mongo-express.yaml
	echo ">>> Finish build components"