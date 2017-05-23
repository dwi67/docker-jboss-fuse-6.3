#!/bin/bash
#
# Set owner & execute
#
cd /opt/jboss/jboss-fuse/fabric
chown jboss:jboss fabric.sh
chmod +x fabric.sh
chown jboss:jboss join.sh
chmod +x join.sh

#
# Remove the install script again
#
rm /opt/jboss/install.sh
