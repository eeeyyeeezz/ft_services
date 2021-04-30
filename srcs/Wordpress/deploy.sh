# minikube delete
# minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
docker rmi wordpress_image
docker build -t wordpress_image .
# kubectl delete pods wordpress
kubectl delete deploy wordpress-deployment
kubectl apply -f wordpress.yaml
minikube dashboard