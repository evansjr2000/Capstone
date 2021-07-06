#!/bin/bash -x

 
# apply a custom label to the first node in your cluster: 
kubectl label node $(kubectl get nodes -o jsonpath='{.items[0].metadata.name}') kiamol=ch05
 
# check the nodes with a label selector:
kubectl get nodes -l kiamol=ch05
 
# deploy a PV that uses a local volume on the labeled node:
kubectl apply -f todo-list/persistentVolume.yaml
 
# check the PV:
kubectl get pv
