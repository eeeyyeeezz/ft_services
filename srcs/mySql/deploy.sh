# minikube delete
# minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
docker rmi -f mysql_image
docker build -t mysql_image .
# kubectl delete pods mysql
kubectl delete svc mysql
kubectl delete deploy mysql
kubectl apply -f mysql.yaml
minikube dashboard