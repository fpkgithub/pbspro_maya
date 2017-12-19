#!/bin/sh
echo "install pbs at worker:$HOSTNAME"
if [ -f "/etc/init.d/pbs" ]; then
  echo "$HOSTNAME:pbs was installed"
  /etc/init.d/pbs restart
else
  echo "start install ..."
  cd
  cd /root/rpmbuild/RPMS/x86_64
  yum install -y pbspro-execution-14.1.0-0.x86_64.rpm
  echo "install is over ..."
  sed -i "s/PBS_SERVER=.*/PBS_SERVER=master/g" /etc/pbs.conf
  echo '$clienthost master' > /var/spool/pbs/mom_priv/config
  /etc/init.d/pbs start
fi
exit
 
#cd
#cd /root/rpmbuild/RPMS/x86_64
#yum install -y pbspro-execution-14.1.0-0.x86_64.rpm
#echo "install is ok"
#sed -i "s/PBS_SERVER=.*/PBS_SERVER=master/g" /etc/pbs.conf
#echo '$clienthost master' > /var/spool/pbs/mom_priv/config
#/etc/init.d/pbs start
#echo "$HOSTNAME:pbs is runing"
#exit
