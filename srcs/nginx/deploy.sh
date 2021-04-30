# minikube delete
# minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb
docker rmi -f nginx_image
docker build -t nginx_image .
kubectl delete pods nginx
kubectl apply -f config.yaml
kubectl apply -f nginx.yaml
minikube dashboard