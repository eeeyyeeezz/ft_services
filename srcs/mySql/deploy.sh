eval $(minikube docker-env)
kubectl delete deploy mysql
kubectl delete svc mysql
docker rmi -f mysql_image
docker build -t mysql_image .
kubectl apply -f mysql.yaml
minikube dashboard