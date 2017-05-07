#!/bin/bash
#
# We configure the distro, here before it gets imported into docker
# to reduce the number of UFS layers that are needed for the Docker container.
#

#
# Set owner & execute
#
cd /opt/jboss/jboss-fuse/fabric
chown jboss:jboss fabric.sh
chmod +x fabric.sh

#
# Remove the install script again
#
rm /opt/jboss/install.sh
