# dockies
Useful scripts, snippets and guidelines for common tasks related to docker

## Permission denied Docker daemon socket at `unix:///var/run/docker.sock`

```console
Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock
```

```bash
# https://www.digitalocean.com/community/questions/how-to-fix-docker-got-permission-denied-while-trying-to-connect-to-the-docker-daemon-socket
sudo chmod 666 /var/run/docker.sock

# login
docker login
```

## List docker images, descending order by size]

```zsh
 docker images --format "{{.ID}}\t{{.Size}}\t{{.Repository}}:{{.Tag}}" | sort -k 2 -rh
 alias dockerls=' docker images --format "{{.ID}}\t{{.Size}}\t{{.Repository}}:{{.Tag}}" | sort -k 2 -rh'
 ```

## Using `--build-arg` to pass parameters in docker builds

The `ARG`, `ENV` combination has been used to enable using persistent between stages environmental variables in multi-stage docker builds.
In this case, it enables us to leverage the predictable beagle archive names, thanks to semantic versioning being utilised by the developers of `atool` to
be able to build different versions of `atool` without updating the files of this repo. 

The functionality of using the ARG-ENV combo is officially documented [here <sup>1</sup>](https://docs.docker.com/develop/develop-images/multistage-build/). Also, a nice and simple tutorial can be also found [here <sup>2</sup>](https://vsupalov.com/docker-arg-vs-env/), but note! that the syntax in this tutorial is a bit outdated. The correct syntax for Docker >= 18.09 is using `=` and not whitespace to seperate key-value ARG pairs, see below the correct syntax:

```Dockerfile
ARG TOOL_BUILD_LABEL="iamthedefaultvalue"
ENV TOOL_BUILD_VERSION=$TOOL_BUILD_LABEL
```

The value `iamthedefaultvalue` is the default value but this can be overriden during the build by using the flag `--build-arg` as follows:

```bash
cd Docker-containers/beagle
docker build --build-arg TOOL_BUILD_VERSION="custom-version"  -t cgpu/awesome-image:1.0
```

**References:**

1. [_"Use multi-stage builds"_](https://docs.docker.com/develop/develop-images/multistage-build/), Docker official documentation
2. [_"Docker ARG vs ENV"_](https://vsupalov.com/docker-arg-vs-env/), Blogpost from  https://vsupalov.com/

## [Change from USER root to USER 500 from intermediate builds](https://github.com/WASdev/ci.docker/issues/194#issuecomment-433519379)

```Dockerfile
FROM websphere-liberty:webProfile7
ARG SSL_KEYSTORE_PASSWORD
USER root
RUN apt-get update && 
    apt-get install -y 
    curl
USER 1001
```


## Check if image with tag exists 

exit: 0 if exists, 1 if not exists

```
# experimental mode on required
echo '{"experimental": "enabled"}' >> ~/.docker/config.json
docker manifest inspect $IMGNAME:$IMGTAG > /dev/null ; echo $?


if DOCKER_CLI_EXPERIMENTAL=enabled docker manifest inspect $image:$tag >/dev/null; then
  echo  'Do nothing'
else
  echo 'Build and push docker image with that tag'
fi
```

## Thou shalt [lint thy Dockerfile with hadolint](https://github.com/cgpu/staries/blob/master/.github/workflows/hadolint_dockerfile.yml) 

```
docker run --rm -i hadolint/hadolint < Dockerfile

# better
alias dockerlint='docker run --rm -i hadolint/hadolint < Dockerfile'

# best 
image="quay.io/lalauser/poofpoofcontainer:111"
docker build -t ${image} . && dockerlint
```

## Host your docker images on GitHub packages

```bash
# for this .PAT you will need package read permission too
cat ~/.PAT | docker login docker.pkg.github.com -u cgpu --password-stdin
docker build -t docker.pkg.github.com/cgpu/staries/alpinegit:v2.24.1 .
docker push docker.pkg.github.com/cgpu/staries/alpinegit:v2.24.1
```

| preview|  <img src="https://user-images.githubusercontent.com/38183826/77017134-857cf000-6971-11ea-98e2-2a9f9e6f44cc.png" alt="drawing" width="600"> |
|-----:|:-----|
how-to  | <img src="https://user-images.githubusercontent.com/38183826/77017339-2bc8f580-6972-11ea-96ea-80847d4a40e2.png" alt="drawing" width="600"> |
 


## Use Jupyter Notebooks (and Jupyter Lab) via Docker

```bash

docker run --rm -p 8888:8888  -e JUPYTER_ENABLE_LAB=yes -v "$PWD":"$PWD" -w "$PWD" jupyter/datascience-notebook

# or 

docker run --rm -p 8888:8888  -e JUPYTER_ENABLE_LAB=yes jupyter/datascience-notebook

# or

docker run --rm -v $PWD:$PWD -w $PWD -it --entrypoint /bin/bash  -e GRANT_SUDO=yes  --user root jupyter/datascience-notebook
```

## Build jupyter notebook images
```
# FROM jupyter/datascience-notebook:f9c990eb6295
docker build --rm -t cgpu/sci-note . 
```

## Mount working directory for in/out

```bash
docker run --rm -v $PWD:$PWD -w $PWD -it lifebitai/samtools bash 

```

## Mount Rstudio (rocker) images to have access to your data 

```bash
# https://stackoverflow.com/questions/48432299/mount-local-volume-accessible-to-r-rstudio-in-docker-tidyverse
docker run --rm -it -e PASSWORD=p@$$ -e ROOT=TRUE -p 8787:8787  -v "$PWD":"$PWD" -w "$PWD"  rocker/r-ver:3.6.1
```

## Include and export files to/from container

<details>
<summary>
Mount your current directory for input and output:
</summary>

```bash
docker run --rm -it  -v "$PWD":"$PWD" -w "$PWD" broadinstitute/gatk
```
</details>


## Centos ec2 instance and very big container

<details>
<summary>
If a container is too big and you're working in an Centos based EC2 instance (does not work for ubuntu), this might work:
</summary>

```
sudo service docker stop
sudo nano /etc/sysconfig/docker-storage
# change the storage
DOCKER_STORAGE_OPTIONS= --storage-opt dm.basesize=30G
sudo service docker start
```
</details>




## Ubuntu and no memory swap supported

https://unix.stackexchange.com/questions/342735/docker-warning-no-swap-limit-support




<details>
<summary>
You can enable these capabilities on Ubuntu or Debian by following these instructions. Memory and swap accounting incur an overhead of about 1% of the total available memory and a 10% overall performance degradation, even if Docker is not running.
</summary>

1) Log into the Ubuntu or Debian host as a user with sudo privileges.

2) Edit the /etc/default/grub file. Add or edit the GRUB_CMDLINE_LINUX line to add the following two key-value pairs:

`$ sudo nano  /etc/default/grub`
> `GRUB_CMDLINE_LINUX="cgroup_enable=memory swapaccount=1"`

3) Update GRUB.

`$ sudo update-grub && sudo reboot` 

You will get kidcked out from the instance but that's ok. Log in after 2'.

</details>

## Ubuntu and no memory swap supported

https://unix.stackexchange.com/questions/342735/docker-warning-no-swap-limit-support




<details>
<summary>
If you get this error (macOS):
  
```
Error saving credentials: error storing credentials - err: no credentials server URL, out: `no credentials server URL
```
Do the following (found [here](https://github.com/docker/for-mac/issues/1540)):
</summary>

Edit your `~/.docker/config.json`
```
{
  "credSstore" : "",
  "auths" : {
    "https://index.docker.io/v1/" : {

    }
  },
  "stackOrchestrator" : "swarm"
}
```

</details>


## Add alias to miniconda based container

```Dockerfile
RUN echo "alias ontologizer=java -jar /opt/conda/envs/base/Ontologizer.jar" >> ~/.bashrc
```


## Authenticate with applicattion token (account type: organisation)

```
# https://docs.quay.io/api/
$ docker login quay.io
Username: $oauthtoken
Password: {{ThisIsTheAccessToken}}
```

## Reduce image size for conda based containers

- Official miniconda alpine image: 
```
continuumio/miniconda3         4.9.2-alpine        63fc92789da9        2 days ago          175MB
continuumio/miniconda3         4.8.2               b4adc22212f1        9 months ago        429MB
fat-bgenix                     revision-0-alpine   b138bc04b15c        22 seconds ago      385MB
fat-bgenix                     revision-0          0a1d1202a6dd        8 minutes ago       763MB
fat-bgenix                     force-pkgs-dirs     b693243610ca        21 minutes ago      1.8GB
fat-bgenix                     latest              de4edd177f03        32 minutes ago      1.81GB
```
