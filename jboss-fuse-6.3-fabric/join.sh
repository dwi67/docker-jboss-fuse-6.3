#!/bin/sh
#
# Starts a fabric with the given environment variables
#
# Sets the environment variables
#
if [ -z $FABRIC_USER ]; then
    export FABRIC_USER=admin
fi
if [ -z $FABRIC_PASSWD ]; then
    export FABRIC_USER=admin
fi
if [ -z $ZOOKEEPER_PASSWD ]; then
    export ZOOKEEPER_PASSWD=${FABRIC_PASSWD}
fi
if [ -z $FABRIC_SERVER_NAME ]; then
    export FABRIC_SERVER_NAME=admin
fi

#
# Run standalone version of fuse
#
echo "Starting JBoss Fuse"
./bin/fuse server & FUSE_SERVER=$!

sleep 200
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

# Join the fabric
./bin/client "fabric:join --zookeeper-password ${ZOOKEEPER_PASSWD} --resolver localip ${FABRIC_SERVER_NAME} ${FUSE_KARAF_NAME}"

# Wait for fuse to end
echo Fuse Fabric Server ready for requests
wait $FUSE_SERVER