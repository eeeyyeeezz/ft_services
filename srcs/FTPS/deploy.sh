# minikube delete
# minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
docker rmi -f ftps_image
kubectl delete deploy ftps-deployment
docker build -t ftps_image .
# kubectl delete pods ftps
kubectl delete deploy ftps-deployment
kubectl apply -f ftps.yaml
minikube dashboard