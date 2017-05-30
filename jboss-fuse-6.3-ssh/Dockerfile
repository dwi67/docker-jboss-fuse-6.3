FROM jboss/base-jdk:8

MAINTAINER Dieter Wijngaards <dieter.wijngaards@adesso.ch>

USER root

# Install the ssh server
RUN yum -y update; yum clean all
RUN yum -y install openssh-server passwd; yum clean all
COPY start.sh /start.sh
RUN mkdir /var/run/sshd

# Install which and curl, referenced by the fabric installation script
RUN yum -y install which
RUN yum -y install curl

RUN ssh-keygen -t rsa -f /etc/ssh/ssh_host_rsa_key -N '' 

RUN chmod 755 /start.sh

# Expose the default ssh port
EXPOSE 22

# Expose the shh and console ports to connect to fuse
EXPOSE 8181
EXPOSE 8101

# Expose the containers
VOLUME /home/user/containers

RUN /start.sh

ENTRYPOINT ["/usr/sbin/sshd", "-D"]
