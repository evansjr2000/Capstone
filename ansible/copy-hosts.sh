#!/bin/bash -x
ansible all -b -i $INVENTORY -m ansible.builtin.copy -a "src=./myhosts  dest=/etc/hosts"
ansible all -b -i $INVENTORY -m ansible.builtin.copy -a "src=./mygenders dest=/etc/genders"
ansible all -b -i $INVENTORY -m ansible.builtin.shell -a 'cat /etc/hosts'
ansible all -b -i $INVENTORY -m ansible.builtin.shell -a 'amazon-linux-extras install epel -y'

exit 0

ansible kube-master -i hosts -a date
ansible  kube-master -b -i $INVENTORY -a "hostnamectl set-hostname master.example.com"
ansible  kube-master -b -i $INVENTORY -a "hostname"
ansible  k8snode01 -b -i $INVENTORY -a "hostnamectl set-hostname worker01.example.com"
ansible  k8snode02 -b -i $INVENTORY -a "hostnamectl set-hostname worker02.example.com"
ansible  all -b -i $INVENTORY -a "hostname"

