eval $(minikube docker-env)
kubectl delete svc ftps-svc
kubectl delete deploy ftps-deployment
docker rmi -f ftps-image
docker build -t ftps-image .
kubectl apply -f ftps.yml