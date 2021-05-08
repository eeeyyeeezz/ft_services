eval $(minikube docker-env)
kubectl delete deploy phpmyadmin-deployment
kubectl delete svc phpmyadmin-svc
docker rmi -f phpmyadmin_image
kubectl delete deploy phpmyadmin-deployment
docker build -t phpmyadmin_image .
kubectl apply -f phpmyadmin.yaml