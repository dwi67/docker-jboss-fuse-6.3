### FUSE ssh docker image

This project builds a ssh accessible docker image for [JBoss Fuse](http://www.jboss.org/products/fuse/overview/) that can be used to auto create a nanaged server by the admin node.

### Usage

Run the image:

    docker run -it -p 22:22 dwi67/jboss-fuse-6.3-ssh

The image can be accessed using:

    ssh user@localhost
    
The default password is admin.

### Ports Opened by Fuse

You may need to map ports opened by the Fuse container after installation to host ports if you need to access it's services.
Those ports are:

* 8181 - Web access (also hosts the Fuse admin console).
* 8101 - SSH Karaf console access

### Other ports

You can access the image using ssh on port 22, user = user and password is admin.

### Image internals

This image extends the [`jboss/base-jdk:8`](https://github.com/JBoss-Dockerfiles/base-jdk/tree/jdk8) image which adds the OpenJDK distribution on top of the [`jboss/base`](https://github.com/JBoss-Dockerfiles/base) image. Please refer to the readme.md for selected images for more info.

The server is run as the `jboss` user which has the uid/gid set to `1000`.

### Source

The source is [available on GitHub](https://github.com/dwi67/docker-jboss-fuse-6.3-ssh).


