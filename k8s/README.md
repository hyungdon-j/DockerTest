
# k8s 파일 내용
```
user@DESKTOP-14530KF MINGW64 ~/Desktop/test/DockerTest/DockerTest/k8s (master)
$ cat k8s.sh
kubectl expose deployment/mynginx --type="NodePort" --port 80
```
# k8s 파일 실행권한 추가
```
user@DESKTOP-14530KF MINGW64 ~/Desktop/test/DockerTest/DockerTest/k8s (master)
$ chmod +x k8s.sh

```
# k8s 실행 방법 

```
user@DESKTOP-14530KF MINGW64 ~/Desktop/test/DockerTest/DockerTest/k8s (master)
$ ./k8s.sh
service/mynginx exposed
```

# 실행 후 웹서비스 확인
```
user@DESKTOP-14530KF MINGW64 ~/Desktop/test/DockerTest/DockerTest/k8s (master)
$ kubectl.exe get service
NAME         TYPE        CLUSTER-IP      EXTERNAL-IP   PORT(S)        AGE
kubernetes   ClusterIP   10.96.0.1       <none>        443/TCP        6h23m
mynginx      NodePort    10.98.208.176   <none>        80:32582/TCP   27s
nginx        NodePort    10.104.122.75   <none>        80:32089/TCP   168m

user@DESKTOP-14530KF MINGW64 ~/Desktop/test/DockerTest/DockerTest/k8s (master)
$ kubectl.exe describe service/mynginx
Name:                     mynginx
Namespace:                default
Labels:                   run=mynginx
Annotations:              <none>
Selector:                 run=mynginx
Type:                     NodePort
IP:                       10.98.208.176
LoadBalancer Ingress:     localhost
Port:                     <unset>  80/TCP
TargetPort:               80/TCP
NodePort:                 <unset>  32582/TCP
Endpoints:                10.1.0.16:80,10.1.0.17:80,10.1.0.18:80 + 17 more...
Session Affinity:         None
External Traffic Policy:  Cluster
Events:                   <none>
```