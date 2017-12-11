#!/bin/bash

source resetWorker.sh

function resetCluster() {
  resetWorkers
  for j in $(seq 1 ${NUMBER_OF_MASTERS}); do
    gcloud compute instances delete ${MASTER_NODE_PREFIX}${j} -q &
  done
  sleep 125
  gcloud compute forwarding-rules delete ${CLUSTER_NAME}-forwarding-rule --region ${REGION} -q
  gcloud compute target-pools delete ${CLUSTER_NAME}-target-pool -q
  gcloud compute http-health-checks delete ${CLUSTER_NAME}-apiserver-health-check -q
  gcloud compute firewall-rules delete ${CLUSTER_NAME}-allow-health-checks -q
  gcloud compute firewall-rules delete ${CLUSTER_NAME}-allow-external -q
  gcloud compute firewall-rules delete ${CLUSTER_NAME}-allow-internal -q
  gcloud compute networks subnets delete ${CLUSTER_NAME} -q
  gcloud compute networks delete ${CLUSTER_NAME} -q
  gcloud compute addresses delete ${CLUSTER_NAME} -q
}


