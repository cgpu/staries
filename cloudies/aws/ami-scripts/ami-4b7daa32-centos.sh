sudo yum install -y \
tree \
openssl \
openssl-devel \
gcc-c++ \
tmux \
python34-pip \
htop && \
curl -s https://get.nextflow.io | bash && \
sudo mv /home/ec2-user/nextflow /bin/ && \
pip-3.4 install awscli --upgrade --user
