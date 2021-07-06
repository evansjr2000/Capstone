#!/bin/bash -x

export INVENTORY="hosts"

ping.sh
timezone.sh
sethostname.sh
hostname.sh
ansible-playbook -i hosts install-epel.yml -K
ansible-playbook -i hosts install-packages.yml -K
# ansible-playbook -i hosts k8s-prep.yml -K
