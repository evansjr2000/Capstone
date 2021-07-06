#!/bin/bash -x

yum install -y nfs-utils

mkdir -p /mnt/nfs/var/nfs_share_dir

# 3.Mounting the filesystem

mount -t nfs nfsserver:/var/nfs_share_dir /mnt/nfs/var/nfs_share_dir

df
