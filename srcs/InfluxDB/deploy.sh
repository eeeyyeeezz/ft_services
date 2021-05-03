eval $(minikube docker-env)
kubectl delete deploy influxdb-deployment
docker rmi -f influxdb-image
docker build -t influxdb-image .
kubectl apply -f influxdb.yaml