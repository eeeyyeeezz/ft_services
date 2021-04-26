eval $(minikube docker-env)
docker rmi nginx_image
docker build -t nginx_image .
kubectl delete pods nginx
kubectl apply -f nginx.yaml
sleep 3s
kubectl get pods