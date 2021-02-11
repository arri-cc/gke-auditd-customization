#!/bin/sh
gcloud beta container clusters create gke-auditd \
    --zone us-east1-b \
    --num-nodes 3 \
    --enable-logging-monitoring-system-only \
    --scopes=logging-write \
    --cluster-version 1.17.14-gke.1600 \
    --machine-type g1-small \
    --image-type COS_CONTAINERD \
    --quiet 