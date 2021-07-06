#!/bin/bash -x
mydir=`pwd`
echo "mydir = $mydir"
sleep 3


cd ~/.ssh

scp -i ~/.ssh/awskey-202110.pem ./id_rsa* centos@${master}:./.ssh/
scp -i ~/.ssh/awskey-202110.pem ./id_rsa* centos@${worker1}:./.ssh/
scp -i ~/.ssh/awskey-202110.pem ./id_rsa* centos@${worker2}:./.ssh/

sleep 3
							   
cd $mydir

pwd

sleep 3

scp -i ~/.ssh/awskey-202110.pem ./authorized_keys centos@${master}:./.ssh/
scp -i ~/.ssh/awskey-202110.pem ./authorized_keys centos@${worker1}:./.ssh/
scp -i ~/.ssh/awskey-202110.pem ./authorized_keys centos@${worker2}:./.ssh/

scp ./mygenders centos@${master}:./genders
scp ./mygenders centos@${worker1}:./genders
scp ./mygenders centos@${worker2}:.//genders

scp ./calico-network-fix.sh centos@${master}:./
scp ./calico-network-fix.sh centos@${worker1}:./
scp ./calico-network-fix.sh centos@${worker2}:./

scp ./myhosts centos@${master}:./
scp ./myhosts centos@${worker1}:./
scp ./myhosts  centos@${worker2}:./

scp ./kubeadm*.sh centos@${master}:./
scp ./kubeadm*.sh centos@${worker1}:./
scp ./kubeadm*.sh  centos@${worker2}:./

exit 0



