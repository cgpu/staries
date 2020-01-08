cd ~ && sudo apt update && \

DEBIAN_FRONTEND=noninteractive \
  apt-get \
  -o Dpkg::Options::=--force-confold \
  -o Dpkg::Options::=--force-confdef \
  -y --allow-downgrades --allow-remove-essential

#The command will install a bunch of new packages including gcc, g++ and make.
sudo apt install -y build-essential   && \
#You may also want to install the manual pages about using GNU/Linux for development:
sudo apt-get install -y manpages-dev && \
sudo apt install -y git htop wget vim nano tree make tmux   && \

sudo DEBIAN_FRONTEND=noninteractive apt install -y  libcurl4-openssl-dev  && \
sudo apt install -y openjdk-8-jre-headless && \
wget -qO- https://get.nextflow.io | bash && \
PATH="/home/ubuntu/nextflow:${PATH}" && \
sudo mv nextflow /usr/bin/ && \
sudo apt-get  install  -y dh-autoreconf  && \
sudo apt-get  install  -y libarchive-dev && \

sudo apt install -y docker.io debootstrap  && \
#singularity 3.3.0
sudo apt-get install -y libssl-dev uuid-dev libgpgme11-dev libseccomp-dev pkg-config squashfs-tools && \

#golang for singularity # change this as you need
export VERSION=1.13.1 OS=linux ARCH=amd64 && \
wget -O /tmp/go${VERSION}.${OS}-${ARCH}.tar.gz https://dl.google.com/go/go${VERSION}.${OS}-${ARCH}.tar.gz && \
sudo tar -C /usr/local -xzf /tmp/go${VERSION}.${OS}-${ARCH}.tar.gz  && \

#set up your environment
echo 'export GOPATH=${HOME}/go' >> ~/.bashrc && \
echo 'export PATH=/usr/local/go/bin:${PATH}:${GOPATH}/bin' >> ~/.bashrc && \
source ~/.bashrc  && \

## Install golangci-lint
curl -sfL https://install.goreleaser.com/github.com/golangci/golangci-lint.sh | sh -s -- -b $(go env GOPATH)/bin v1.15.0  && \

# Golang is a bit finicky about where things are placed. Here is the correct way to build Singularity from source:
mkdir -p ${GOPATH}/src/github.com/sylabs &&   cd ${GOPATH}/src/github.com/sylabs &&   git clone https://github.com/sylabs/singularity.git &&   cd singularity &&  git checkout v3.3.0 && \

## Compiling Singularity
cd ${GOPATH}/src/github.com/sylabs/singularity && \
  ./mconfig && \
  cd ./builddir && \
  make && \
  sudo make install  && \

# Now go home and start 
cd ~ && \
sudo apt install -y python-pip  && \
sudo apt -y install awscli && \
sudo apt install jq  -y && \
sudo apt install --reinstall zlibc zlib1g zlib1g-dev -y && \
sudo apt install seqtk -y   && \
USER=`whoami` && \
sudo groupadd docker && \
sudo usermod -aG docker $USER  && \
newgrp docker
