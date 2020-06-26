
# k8s 파일 내용
 * docker 에서  있는 이미지 (kubectl run mynginx --image=hyungdon/nginx_ubuntu --port=80) run
 * pod 20 증가하여 포트 80 으로 구동 
```
user@DESKTOP-14530KF MINGW64 ~/Desktop/test/DockerTest/DockerTest/k8s (master)
$ cat k8s.sh

kubectl run $1 --image=hyungdon/nginx_ubuntu --port=80
kubectl scale  deployment $1 --replicas=20
kubectl expose deployment/$1 --type="NodePort" --port 80

```
# k8s 파일 실행권한 추가
```
user@DESKTOP-14530KF MINGW64 ~/Desktop/test/DockerTest/DockerTest/k8s (master)
$ chmod +x k8s.sh

```
# k8s 실행 방법 
 * ./k8s.sh <deploy명> 작성하여 동작 
```
user@DESKTOP-14530KF MINGW64 ~/Desktop/test/DockerTest/DockerTest/k8s (master)
$ ./k8s.sh mynginx2
kubectl run --generator=deployment/apps.v1 is DEPRECATED and will be removed in a future version. Use kubectl run --generator=run-pod/v1 or kubectl create instead.
deployment.apps/mynginx2 created
deployment.apps/mynginx2 scaled
service/mynginx2 exposed

```
# 실행 후 웹서비스 확인
```
user@DESKTOP-14530KF MINGW64 ~/Desktop/test/DockerTest/DockerTest/k8s (master)
$ kubectl.exe get service
NAME         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
kubernetes   ClusterIP   10.96.0.1       <none>        443/TCP        7h21m
mynginx      NodePort    10.98.208.176   <none>        80:32582/TCP   58m
mynginx2     NodePort    10.99.202.238   <none>        80:31557/TCP   2m39s
nginx        NodePort    10.104.122.75   <none>        80:32089/TCP   3h46m

user@DESKTOP-14530KF MINGW64 ~/Desktop/test/DockerTest/DockerTest/k8s (master)
$ kubectl.exe describe service/mynginx2
Name:                     mynginx2
Namespace:                default
Labels:                   run=mynginx2
Annotations:              <none>
Selector:                 run=mynginx2
Type:                     NodePort
IP:                       10.99.202.238
LoadBalancer Ingress:     localhost
Port:                     <unset>  80/TCP
TargetPort:               80/TCP
NodePort:                 <unset>  31557/TCP
Endpoints:                10.1.0.37:80,10.1.0.38:80,10.1.0.39:80 + 17 more...
Session Affinity:         None
External Traffic Policy:  Cluster
Events:                   <none>

user@DESKTOP-14530KF MINGW64 ~/Desktop/test/DockerTest/DockerTest/k8s (master)
$ kubectl.exe  get deployment
NAME        READY   UP-TO-DATE   AVAILABLE   AGE
mynginx     20/20   20           20          73m
mynginx2    20/20   20           20          3m54s
myubuntu    0/1     1            0           154m
myubuntu2   0/1     1            0           75m
nginx       4/4     4            4           6h9m
testtest    0/1     1            0           23m


```
#### 웹서버 접속 curl 수행
```
user@DESKTOP-14530KF MINGW64 ~/Desktop/test/docker_test/df (master)
$ winpty kubectl.exe exec -it mynginx-65bb6bff6c-4trnp bash
root@mynginx-65bb6bff6c-4trnp:/etc/nginx#
root@mynginx-65bb6bff6c-4trnp:/etc/nginx#
root@mynginx-65bb6bff6c-4trnp:/etc/nginx#
root@mynginx-65bb6bff6c-4trnp:/etc/nginx# curl loaclhost
curl: (6) Could not resolve host: loaclhost
root@mynginx-65bb6bff6c-4trnp:/etc/nginx# curl localhost
<!DOCTYPE html>
<html>
<head>
<title>Welcome to nginx!</title>
<style>
    body {
        width: 35em;
        margin: 0 auto;
        font-family: Tahoma, Verdana, Arial, sans-serif;
    }
</style>
</head>
<body>
<h1>Welcome to nginx!</h1>
<p>If you see this page, the nginx web server is successfully installed and
working. Further configuration is required.</p>

<p>For online documentation and support please refer to
<a href="http://nginx.org/">nginx.org</a>.<br/>
Commercial support is available at
<a href="http://nginx.com/">nginx.com</a>.</p>

<p><em>Thank you for using nginx.</em></p>
</body>
</html>
root@mynginx-65bb6bff6c-4trnp:/etc/nginx#
```
