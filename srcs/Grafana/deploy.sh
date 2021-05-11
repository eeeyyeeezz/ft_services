eval $(minikube docker-env)
kubectl delete svc grafana-svc
kubectl delete deploy grafana-deployment
docker rmi -f grafana_image
docker build -t grafana_image .
kubectl apply -f grafana.yaml