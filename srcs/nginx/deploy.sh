eval $(minikube docker-env)
kubectl delete deployment nginx-deployment
docker rmi -f nginx_image
docker build -t nginx_image .
kubectl apply -f config.yaml
kubectl apply -f nginx.yaml