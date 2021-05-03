# minikube delete
# minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
docker rmi -f ftps-image
docker build -t ftps-image .
# kubectl delete pods ftps
kubectl delete deploy ftps-deployment
kubectl apply -f ftps.yaml
minikube dashboard