kubectl delete deploy product-app
kubectl apply -f ./product-deployment.yml
kubectl apply -f ./product-service.yml
kubectl apply -f ./product-ingress.yml
sleep 1
# Wait until the pod is in the "Running" state
while true; do
    pod_name=$(kubectl get po -l app=product-app | grep -i running | grep "2/2" | awk '{print $1}')
    if [ -n "$pod_name" ]; then
        break
    fi
    sleep 1
done

nginx_pod_name=$(kubectl get po -n ingress-nginx -l app.kubernetes.io/component=controller | grep -i running | awk '{print $1}')

if [ -n "$nginx_pod_name" ]; then
       kubectl port-forward $nginx_pod_name  -n ingress-nginx 8443:80
fi

#now run API's using http://<ingress-for-app>:8443/<path>


