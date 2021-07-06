#!/bin/bash -x
kubectl run hello-kiamol --image=kiamol/ch02-hello-kiamol --restart=Never
# Wait for pod to be ready
kubectl wait --for=condition=Ready pod hello-kiamol
# List all the pods in the cluster
kubectl get pods
# show detailed information about the Pod:
kubectl describe pod hello-kiamol
