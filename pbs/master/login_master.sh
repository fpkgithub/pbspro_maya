#!/bin/sh
echo "use command '" ./login_master.sh containerId/containerName "' to login master container "
echo 'enter the' $1 'container'
docker exec -it $1 /bin/sh /pbs/master/installpbs_master.sh

