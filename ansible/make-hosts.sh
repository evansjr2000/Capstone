#!/bin/bash -x

cp hosts hosts.sav
cat <<EOF > hosts
[k8s-nodes]
k8smaster01 ansible_host=$master  ansible_ssh_private_key_file=~/.ssh/awskey-202110.pem ansible_user=centos
k8snode01 ansible_host=$worker1   ansible_ssh_private_key_file=~/.ssh/awskey-202110.pem ansible_user=centos
k8snode02 ansible_host=$worker2   ansible_ssh_private_key_file=~/.ssh/awskey-202110.pem ansible_user=centos

[all:vars]
# Ubuntu uses python3 instead of python2, we need to set the interpreter for ansible
ansible_python_interpreter=/usr/bin/python

[kube-master]
k8smaster01

[kube-node]
k8snode01
k8snode02
EOF

cat <<EOF > myhosts

 127.0.0.1   localhost localhost.localdomain localhost4 localhost4.localdomain4
::1         localhost localhost.localdomain localhost6 localhost6.localdomain6

$privatemaster  master01.example.com master master01
$privateworker1 worker01.example.com worker01 node01
$privateworker2  worker02.example.com worker02 node02
EOF


