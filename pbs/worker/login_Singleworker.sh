#!/bin/sh
printf "\n"
echo "This shell for auto install pbspro at one worker node "
printf "\n"

    echo "container:"$1
    docker exec -it  $1 /bin/sh /pbs/worker/installpbs_worker.sh

printf "\n"
echo "container:"$1" pbs operations is over...."
echo "Next add worker node and check it on the pbs_sched"
printf "\n"


