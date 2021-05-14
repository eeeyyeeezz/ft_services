eval $(minikube docker-env)
kubectl exec deploy/wordpress-deployment -- pkill nginx
kubectl exec deploy/phpmyadmin-deployment -- pkill nginx
kubectl exec deploy/nginx-deployment -- pkill nginx
kubectl exec deploy/influxdb-deployment -- pkill telegraf
kubectl exec deploy/mysql -- pkill telegraf
kubectl exec deploy/grafana-deployment -- pkill telegraf
kubectl exec deploy/ftps-deployment -- pkill telegraf