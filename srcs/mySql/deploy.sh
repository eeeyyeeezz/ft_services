# minikube delete
# minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
docker rmi mysql_image
docker build -t mysql_image .
# kubectl delete pods mysql
kubectl delete deploy mysql-deployment
kubectl apply -f mysql.yaml
minikube dashboard