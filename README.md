# kube-gcp-deployment

This repo contains a kubernetes Google Cloud Platform (GCP) deployment script based on kubernetes-the-hard way. The scripts only work for GCE. No other scripts are planned.

The scripts are created such that they are readable and limited in use. They are meant to give insight and provide the user with a chance to create a working cluster quick.

Main differences with kubernetes the hard way:

* GCE use is a bit more advanced: No fixed IP addresses coded in the for loops: Machines are created on demand and than queried for their settings;
* cloud provider is configured so that GCE functionalities (like mounting a disk in a deployment) works;
* In the addition of kube components a more usuable list is added;
* RBAC (in this script a beta setup) has been added.

# Usage

Initialize a GCE on the project you would like to deploy a kubernetes environment in.

Set environment variables:

* REGION
* ZONE
* MasterNodePrefix
* WorkerNodePrefix
* NumberOfMasters
* NumberOfWorkers
* WorkerTags
* ClusterName
* MasterNodeSize
* WorkerNodeSize

After that execute:

    source initialize.sh
    installCluster

# Create more workers

To create more workers set environment variables:

* REGION
* ZONE
* WorkerNodePrefix
* NumberOfWorkers
* WorkerTags

The code will add the new workers.

Different prefixes can be used. The tags are applied to the nodes created as GCE labels. The tags are also added to the nodes so that they can be used by the Kubernetes scheduler.

# Additional deployments

The created cluster just runs kubernetes.
For additional functionalities, run the deployments from the deployment folder.



