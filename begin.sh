minikube delete
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
minikube addons enable metallb

docker rmi nginx_image
docker build -t nginx/nginx_image .
kubectl delete pods nginx
kubectl apply -f nginx/config.yaml
kubectl apply -f nginx/nginx.yaml



minikube dashboard