#!/bin/sh
#
# We configure the distro, here before it gets imported into docker
# to reduce the number of UFS layers that are needed for the Docker container.
#

#
# Run standalone version of fuse
#
echo "Starting JBoss Fuse"
./bin/fuse server & FUSE_SERVER=$!

#
# Wait until the container is available to run client commands
#
count=0
while :
do
	echo "Wait for container"
	./bin/client "version"; return=$?
	if [ $return -eq 0 ]; then
		sleep 15
		break
	else
		sleep 5
		(( count++ ))
		echo "Failed to get client session " $count " times."
		if [ $count == 60 ]; then
			echo "Failed to get a client session after 5 minutes, fabric create failed"
			exit 1
		fi
	fi
done

# Create the fabric
./bin/client "fabric:create --wait-for-provisioning --verbose --clean --bootstrap-timeout 60000 --new-user admin --new-user-password admin --zookeeper-password admin --resolver manualip --manual-ip 127.0.0.1"

# Wait for fuse to end
echo Fuse Fabric Server ready for requests
wait $FUSE_SERVER