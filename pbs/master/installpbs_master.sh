#!/bin/sh
echo "start install pbspro at $hostname node"
echo "****************install***********************"
cd
cd /root/rpmbuild/RPMS/x86_64
yum install -y pbspro-server-14.1.0-0.x86_64.rpm
echo "*************install is ok********************"
echo "***********edit /etc/pbs.conf*****************"
sed -i "s/PBS_START_MOM=0/PBS_START_MOM=1/g" /etc/pbs.conf
echo "**************start pbs***********************"
/etc/init.d/pbs start
echo "*******************ok*************************"

