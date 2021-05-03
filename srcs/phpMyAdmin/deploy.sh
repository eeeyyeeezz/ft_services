# minikube delete
# minikube start --vm-driver=virtualbox
eval $(minikube docker-env)
docker rmi -f phpmyadmin_image
kubectl delete deploy phpmyadmin-deployment
docker build -t phpmyadmin_image .
# kubectl delete pods phpmyadmin
kubectl delete svc phpmyadmin-svc
kubectl delete deploy phpmyadmin-deployment
kubectl apply -f phpmyadmin.yaml
minikube dashboard