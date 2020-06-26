## Ubuntu nginx build : hyungdon/nginx_ubuntu
```
user@DESKTOP-14530KF MINGW64 ~/Desktop/test/DockerTest/DockerTest (master)
$ docker build --tag hyungdon/nginx_ubuntu .
```
## Docker Image run
```
user@DESKTOP-14530KF MINGW64 ~/Desktop/test/DockerTest/DockerTest (master)
$ winpty docker run -it --name nu1 -p 8888:80 hyungdon/nginx_ubuntu
```
