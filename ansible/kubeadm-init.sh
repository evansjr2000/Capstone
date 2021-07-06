#!/bin/bash -x

ip a

sleep 5

#kubeadm --v=5 init
kubeadm --v=5 init --feature-gates CoreDNS=true
