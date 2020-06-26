
kubectl run $1 --image=hyungdon/nginx_ubuntu --port=80
kubectl scale  deployment $1 --replicas=20
kubectl expose deployment/$1 --type="NodePort" --port 80