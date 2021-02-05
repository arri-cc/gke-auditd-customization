#!/bin/sh
gcloud container clusters create gke-auditd --zone us-east1-b --num-nodes 1 --cluster-version 1.17.14-gke.1600 --machine-type g1-small --image-type COS_CONTAINERD --quiet 
