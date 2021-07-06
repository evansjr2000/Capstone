#!/bin/bash -x

ip a

sleep 5

# Run as root

kubeadm --v=5 init \
  --apiserver-advertise-address=192.168.122.10 \
  --pod-network-cidr 192.168.0.0/16 \
  --upload-certs
