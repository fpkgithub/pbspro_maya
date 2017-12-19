#!/bin/sh
printf "\n"
echo "This shell for auto install pbspro at all worker node "
printf "\n"

#get all worker containerId save it at the containerList.txt

#get container count
count=`docker ps -q -f "name=cluster_worker_*" | wc -l` 
echo  "container count:$count"

#check file
if [ ! -f "/containerList.txt" ]; then
  touch $PWD/containerList.txt
  chmod +x containerList.txt
fi

#save id
docker ps -q -f "name=cluster_worker_*" | tee -a containerList.txt

printf "\n"

#login every container and install pbspro
index=1
cat containerList.txt | while read CID
do
    echo "container:cluster_worker_$index ---  $CID"
    echo "info:"
    echo "login comtainer,install pbs and start pbs_mom that all the operations are running in the background, may be need little time, please wait 1 min before check the compute node on the sched node ..."

    docker exec -i  $CID /bin/sh /pbs/worker/installpbs_worker.sh
    let index+=1
    printf "\n"
done

rm -rf $PWD/containerList.txt

printf "\n"
echo "All($count) container pbs operations is over...."
echo "Next add worker node and check it on the pbs_sched"
printf "\n"


