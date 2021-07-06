#!/bin/bash -x
ansible all -b -i $INVENTORY -m ansible.builtin.copy -a "src=/home/evansjr/.ssh/id_rsa  dest=/home/ec2-user/.ssh/id_rsa"
ansible all -b -i $INVENTORY -m ansible.builtin.copy -a "src=/home/evansjr/.ssh/id_rsa.pub  dest=/home/ec2-user/.ssh/id_rsa.pub"
ansible all -b -i $INVENTORY -m ansible.builtin.shell -a 'hostname'

exit 0

ansible kube-master -i hosts -a date
ansible  kube-master -b -i $INVENTORY -a "hostnamectl set-hostname master.example.com"
ansible  kube-master -b -i $INVENTORY -a "hostname"
ansible  k8snode01 -b -i $INVENTORY -a "hostnamectl set-hostname worker01.example.com"
ansible  k8snode02 -b -i $INVENTORY -a "hostnamectl set-hostname worker02.example.com"
ansible  all -b -i $INVENTORY -a "hostname"

