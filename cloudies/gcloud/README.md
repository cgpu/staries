# Day to day gcloud commands

## [Sync gs with s3 (interoperability)](https://cloud.google.com/storage/docs/gsutil/commands/rsync)

Mirror objects present in s3 bucket in gs cloud storage bucket

```
gsutil -m  rsync -r s3://my-bucket/this-object gs://my-bucket/this-object
```

## Util public container image

gcr.io/cloud-genomics-pipelines/tools

## [Install](https://cloud.google.com/storage/docs/gsutil_install#linux)

```
# Enter the following at a command prompt:
curl https://sdk.cloud.google.com | bash

# Restart your shell:
exec -l $SHELL

# Run gcloud init to initialize the gcloud environment:
gcloud init
```

## Auth

```bash
gcloud auth login
```


## [NF x gcloud docs](http://andersenlab.org/dry-guide/pipeline-GCPconfig/)

API needed

## [Custom GCE VM](https://medium.com/@lynnlangit/cloud-native-hello-world-for-bioinformatics-7831aecc8d1a)


# Error messages and potential cause

If: `Unknow cloud driver name: google`
Maybe: echo $GOOGLE_APPLICATION_CREDENTIALS is empty, aka has not been set up

# 


## Go back in time (if your [gcloud SDK gives you attitude](https://issuetracker.google.com/issues/160074681))

```
 gcloud components update --version 280.0.0
```

## Unset specific zone to list all VMs in region

```
gcloud config list
gcloud config unset compute/zone
```

## Verify preemptible status for all running instances

```
# set project first:
gcloud config set project one-project-id

# list all running instances and grab their name
# use their name to fetch preemptibility info

for instance in `gcloud compute instances list | awk '{print $1}' | grep -v NAME` ; do gcloud compute instances describe $instance  | grep preemptible; done
```


## Get metadata

machine-type
```
curl "http://169.254.169.254/computeMetadata/v1/instance/${metadata_item}" -H "Metadata-Flavor: Google" | awk -F/ '{print $NF}'
```

Available metadata item/entity:

```
cpu-platform
description
hostname
id
image
machine-type
maintenance-event
name
preempted
remaining-cpu-time
tags
zone
```

```
attributes/startup-script
disks/?recursive=true&alt=json
guest-attributes/?recursive=true&alt=json
legacy-endpoint-access/?recursive=true&alt=json
licenses/?recursive=true&alt=json

network-interfaces/?recursive=true&alt=json
curl "http://169.254.169.254/computeMetadata/v1/instance/network-interfaces/0/" -H "Metadata-Flavor: Google"
access-configs/
dns-servers
forwarded-ips/
gateway
ip
ip-aliases/
mac
mtu
network
subnetmask
target-instance-ips

scheduling/?recursive=true&alt=json
service-accounts/?recursive=true&alt=json
virtual-clock/?recursive=true&alt=json
```

```
metadata_item="machine-type"
curl "http://169.254.169.254/computeMetadata/v1/instance/${metadata_item}" -H "Metadata-Flavor: Google"

# json with all in
curl "http://169.254.169.254/computeMetadata/v1/instance/?recursive=true&alt=json" -H "Metadata-Flavor: Google"
```
