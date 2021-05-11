eval $(minikube docker-env)
docker rmi wordpress_image
docker build -t wordpress_image .
kubectl delete svc wordpress-svc
kubectl delete deploy wordpress-deployment
kubectl apply -f wordpress.yaml
minikube dashboard