## This is my attempt at SAS Enterprise Miner for Containers.

### Now you can launch SAS with the SAS Studio web interface or Enterprise Miner Java Web Start from a docker image repo

To get the image:
```
$ docker pull docker.sas.com/canbxb/sasem:latest
```
To run it:
```
$ docker run -d -p 7980:7980 -p 8080:8080 docker.sas.com/canbxb/sasem:latest
```
Point your browser to (replace docker-hostname with the hostname where the docker image was run):
```
http://<docker-hostname>:8080/SASStudio as user:sas password: ____
http://<docker-hostname>:7980/SASEnterpriseMinerJWS/Status as user:sas password: ____
```

ToDo: 
* Reduce size of tarball
