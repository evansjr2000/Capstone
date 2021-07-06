#!/bin/bash -x

# deploy the database:
kubectl apply -f postgres/
 
# wait for Postgres to initialize:
sleep 30
 
# check the database logs: 
kubectl logs -l app=todo-db --tail 1
 
# check the data files in the volume:
kubectl exec deploy/sleep -- sh -c 'ls -l /node-root/volumes/pv01 | grep wal'
