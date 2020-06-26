## Ubuntu nginx build : hyungdon/nginx_ubuntu
```
user@DESKTOP-14530KF MINGW64 ~/Desktop/test/DockerTest/DockerTest (master)
$ docker build --tag hyungdon/nginx_ubuntu .
```
## Docker Image 실행 방법 (윈도우10 프로)
```
user@DESKTOP-14530KF MINGW64 ~/Desktop/test/DockerTest/DockerTest (master)
$ winpty docker run -it --name nu1 -p 8888:80 hyungdon/nginx_ubuntu
```
## 실행 결과
```
user@DESKTOP-14530KF MINGW64 ~/Desktop/test/docker_test/df (master)
$ winpty docker exec -it nu1 bash
root@b0a129624a68:/etc/nginx#
root@b0a129624a68:/etc/nginx#
root@b0a129624a68:/etc/nginx#
root@b0a129624a68:/etc/nginx# curl localhost
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
root@b0a129624a68:/etc/nginx#
```
#### 실행결과 웹사이트 접속 화면
![image](https://raw.githubusercontent.com/hyungdon-j/DockerTest/master/nginx_run.png)
