#!/bin/bash
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
