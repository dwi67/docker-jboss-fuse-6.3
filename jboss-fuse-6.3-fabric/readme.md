### FUSE Docker image

This project builds a fabric single node Docker image for [JBoss Fuse](http://www.jboss.org/products/fuse/overview/) with a default users.properties configuration file.

### Usage

Run the image:

    docker run -it -p 8181:8181 dwi67/jboss-fuse-6.3-fabric

The administration console should be available at [http://localhost:8181/hawtio](http://localhost:8181/hawtio)

### Ports Opened by Fuse

You may need to map ports opened by the Fuse container to host ports if you need to access it's services.
Those ports are:

* 8181 - Web access (also hosts the Fuse admin console).
* 8101 - SSH Karaf console access

If you add the ``-p 8181:8181` to your `docker run` command, then you should be able to load [http://localhost:8181/hawtio](http://localhost:8181/hawtio) in your web browser to mange the Fuse server.

If you add the ``-p 8101:8101` to your `docker run` command, then you should be able to ssh into the Karaf container using a command similar to: `ssh admin@localhost -p 8101`

### Ports used by JBoss AMQ

* 61616 - AMQ Openwire port.
* 1883  - AMQ MQTT port.
* 5672  - AMQ AMQP port.
* 61613 - AMQ STOMP port.
* 61617 - AMQ Openwire over SSL port.
* 8883  - AMQ MQTT over SSL port.
* 5671  - AMQ AMQP over SSL port.
* 61614 - AMQ STOMP over SSL port.

### Fabric node name

The root node name can be changed using the following environment variable:

* FUSE_KARAF_NAME - The default node name equals the host name of the docker runtime

### Credentials

Credentials can be set using the following environment variables:

* FABRIC_USER - The fabric admin user (default=admin)
* FABRIC_PASSWD - The fabric admin password (default=admin)
* ZOOKEEPER_PASSWD - The zookeeper password (default=FABRIC_PASSWD)

### Managed host mode

This image can create managed server via ssh. For this purpose you can use the jboss-fuse-6.3-ssh image as a base for the managed server. This image contains all prerequisites for a remote installation of JBoss Fuse.

To identify the docker instances running the ssh image, the MANAGED_HOSTS environment paramter must be set. Multiple hosts are seperated by commas.

    MANAGED_HOSTS=root1,root2,root3,root4

Will create 4 managed server. These server must be accessible using the managed host name.     

### Joined host mode

It is possible to join a fabric server using the join entry point of this image.

    entrypoint: /opt/jboss/jboss-fuse/fabric/join.sh

To join a fabric server, the following environment variables must be set:ß

* FUSE_KARAF_NAME - The name of the managed server
* FABRIC_SERVER_NAME - The host name of the fabric server
* ZOOKEEPER_PASSWD - The zookeeper password, to connect to the fabric server

### Image internals

This image extends the [`jboss/base-jdk:8`](https://github.com/JBoss-Dockerfiles/base-jdk/tree/jdk8) image which adds the OpenJDK distribution on top of the [`jboss/base`](https://github.com/JBoss-Dockerfiles/base) image. Please refer to the readme.md for selected images for more info.

The server is run as the `jboss` user which has the uid/gid set to `1000`.

Fuse is installed in the `/opt/jboss/jboss-fuse` directory.

### Source

The source is [available on GitHub](https://github.com/dwi67/docker-jboss-fuse-6.3).