#!/bin/bash -x

docker container ls -q --filter label=io.kubernetes.container.name=hello-kiamol

sleep 3

# now delete that container:
docker container rm -f $(docker container ls -q --filter label=io.kubernetes.container.name=hello-kiamol)
sleep3

# check the Pod status:
kubectl get pod hello-kiamol

sleep3

# and find the container again:
docker container ls -q --filter label=io.kubernetes.container.name=hello-kiamol


#Excerpt From: Elton Stoneman. “Learn Kubernetes in a Month of Lunches.” Apple Books.
