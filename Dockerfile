FROM centos
## thanks Donne.Decapite@sas.com
MAINTAINER brad barnes brad.barnes@sas.com
## install necessary libraries
RUN yum -y install numactl-libs.x86_64
RUN yum -y install libXp
RUN yum -y install passwd
RUN yum -y install libpng12
RUN yum -y install libXmu.x86_64
## example adding staff group
RUN useradd -m sas
RUN groupadd -g 1002 sasstaff
#### example adding sas user
RUN usermod -a -G sasstaff sas
## set default password for this example only
## another technique - point to /etc/passwd
RUN echo -e "foobar" | /usr/bin/passwd --stdin sas
## make SASHome directory
RUN mkdir -p /usr/local/sasemhome
ADD sasemhome.tar.gz /
RUN chown -R sas:sasstaff /usr/local/sasemhome
### make SASHome directory
RUN mkdir -p /usr/local/eminer
ADD eminer.tar.gz /
RUN chown -R sas:sasstaff /usr/local/eminer
## make SASHome directory
RUN mkdir -p /etc/opt/vmware/vfabric
ADD vfabric.tar.gz /
RUN chown -R sas:sasstaff /etc/opt/vmware/vfabric/

## Sas studio
EXPOSE 8080
## sas em jws   
EXPOSE 7980
## An optional startup script can be added (more details below)
ADD startup.sh /
ENTRYPOINT ["/startup.sh"]

