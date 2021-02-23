#!/bin/sh
set -x
gcloud beta container clusters create gke-auditd \
    --zone us-east1-b \
    --num-nodes 1 \
    --enable-logging-monitoring-system-only \
    --scopes=logging-write \
    --cluster-version 1.18.12-gke.1210 \
    --machine-type g1-small \
    --image-type COS_CONTAINERD \
    --quiet
gcloud container clusters get-credentials gke-auditd --zone us-east1-b
kubectl apply -f resources.yaml