### FUSE Docker compose template using ssh

This example project composes a [JBoss Fuse](http://www.jboss.org/products/fuse/overview/) cluster with one fabric server and 4 managed server.

### Usage

Run the cluster:

    docker-compose up --build

The administration console of the fabric server should be available at [http://localhost:8181/hawtio](http://localhost:8181/hawtio)

### Source

The source is [available on GitHub](https://github.com/dwi67/docker-jboss-fuse-6.3-compose/ssh).

### Create openshift cluster using the docker compose import utility

oc login -u system:admin
oc adm policy add-cluster-role-to-user cluster-admin admin
oc adm policy add-scc-to-group anyuid system:authenticated
oc import docker-compose -f ./docker-compose.yml