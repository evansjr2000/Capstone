#!/bin/bash

ansible kube-master -i hosts -a date
ansible  kube-master -b -i $INVENTORY -a "hostnamectl set-hostname master01.example.com"
ansible  kube-master -b -i $INVENTORY -a "hostname"
ansible  k8snode01 -b -i $INVENTORY -a "hostnamectl set-hostname worker01.example.com"
ansible  k8snode02 -b -i $INVENTORY -a "hostnamectl set-hostname worker02.example.com"
ansible  all -b -i $INVENTORY -a "hostname"

