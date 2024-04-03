kubectl delete deploy mysql-and-app
kubectl apply -f ./book-app.yml
kubectl apply -f ./book-app-service.yml
kubectl apply -f book-app-ingress.yml
sleep 1
# Wait until the pod is in the "Running" state
while true; do
    pod_name=$(kubectl get po -l app=mysql-and-app | grep -i running | grep "2/2" | awk '{print $1}')
    if [ -n "$pod_name" ]; then
        break
    fi
    sleep 1
done

kubectl port-forward $pod_name 8081:8081
