[k8s-nodes]
k8smaster01 ansible_host=3.91.201.217  ansible_ssh_private_key_file=~/.ssh/awskey-202110.pem ansible_user=centos
k8snode01 ansible_host=54.204.65.33   ansible_ssh_private_key_file=~/.ssh/awskey-202110.pem ansible_user=centos
k8snode02 ansible_host=3.85.123.95   ansible_ssh_private_key_file=~/.ssh/awskey-202110.pem ansible_user=centos

[all:vars]
# Ubuntu uses python3 instead of python2, we need to set the interpreter for ansible
ansible_python_interpreter=/usr/bin/python

[kube-master]
k8smaster01

[kube-node]
k8snode01
k8snode02
