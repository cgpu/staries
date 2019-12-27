# dockies
Useful scripts, snippets and guidelines for common tasks related to docker

## Mount Rstudio (rocker) images to have access to your data 

```bash
# https://stackoverflow.com/questions/48432299/mount-local-volume-accessible-to-r-rstudio-in-docker-tidyverse
docker run -it -e PASSWORD=p@$$ -e ROOT=TRUE -p 8787:8787  -v "$PWD":"$PWD" -w "$PWD"  huber/image:v1
```

## Include and export files to/from container

<details>
<summary>
Mount your current directory for input and output:
</summary>

```bash
docker run -it  -v "$PWD":"$PWD" -w "$PWD" broadinstitute/gatk
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
