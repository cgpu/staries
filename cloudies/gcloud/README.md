# Day to day gcloud commands

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
