#!/bin/bash -x

# get the basic information about the Pod:
kubectl get pod hello-kiamol

# Excerpt From: Elton Stoneman. “Learn Kubernetes in a Month of Lunches.” Apple Books.
# specify custom columns in the output, selecting network details:
kubectl get pod hello-kiamol --output custom-columns=NAME:metadata.name,NODE_IP:status.hostIP,POD_IP:status.podIP 
 
# specify a JSONPath query in the output,
# selecting the ID of the first container in the Pod:
kubectl get pod hello-kiamol -o jsonpath='{.status.containerStatuses[0].containerID}'

