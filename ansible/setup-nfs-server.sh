#!/bin/bash -x



3Setup NFS-server

#In this post, we are doing it in Centos, which uses yum as the package manager.
# 1.Installing nfs-utils

# sudo su -
yum install -y nfs-utils

#2.Choose the directory to share. If not present create one.

mkdir /var/nfs_share_dir

# 3.Add permissions and ownwership privilages to the shared directory.

chmod -R 755 /var/nfs_share_dir
chown nfsnobody:nfsnobody /var/nfs_share_dir

# 4.Start the nfs services.

systemctl enable rpcbind
systemctl enable nfs-server
systemctl enable nfs-lock
systemctl enable nfs-idmap
systemctl start rpcbind
systemctl start nfs-server
systemctl start nfs-lock
systemctl start nfs-idmap

#5.Configuring the exports file for sharing.
# Open the exports file and add these lines.

#vi /etc/exports

#Fill in the the file-shared path and clients details in /etc/exports.
# 192.168.48.101 - Client's IP

#/var/nfs_share_dir    192.168.48.101(rw,sync,no_root_squash)

# 6.Restart the service

systemctl restart nfs-server

# 7.Only for Centos 7,NFS service override

firewall-cmd --permanent --zone=public --add-service=nfs
firewall-cmd --permanent --zone=public --add-service=mountd
firewall-cmd --permanent --zone=public --add-service=rpc-bind
firewall-cmd --reload

