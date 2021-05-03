eval $(minikube docker-env)
kubectl delete deploy ftps-deployment
docker rmi -f ftps-image
docker build -t ftps-image .
# kubectl delete pods ftps
kubectl apply -f ftps.yaml
# minikube dashboard