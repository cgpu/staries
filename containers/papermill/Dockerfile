# https://github.com/nf-core style template for Dockerfile
# build time: ~ 3min in a 4cpu machine
FROM continuumio/miniconda3:4.8.2
LABEL description="Base docker image containing util software requirements for Nextflow and conda"
ARG ENV_NAME="base"

# Install procps so that Nextflow can poll CPU usage and
# deep clean the apt cache to reduce image/layer size
RUN apt-get update \
 && apt-get install -y procps \
 && apt-get clean -y && rm -rf /var/lib/apt/lists/*

# Install mamba for faster installation in the subsequent step
RUN conda install -c conda-forge mamba r-base -y

# Install the conda environment
COPY environment.yml /
RUN conda env update --quiet --name ${ENV_NAME} --file /environment.yml && conda clean --all

# Install R packages that are possibly not available via conda
COPY bin/install.R /
RUN Rscript /install.R

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/${ENV_NAME}/bin:$PATH

# Dump the details of the installed packages to a file for posterity
RUN mamba env export --name ${ENV_NAME} > ${ENV_NAME}_exported.yml

# Copy additional scripts from bin and add to PATH
RUN mkdir /opt/bin
COPY bin/* /opt/bin/
RUN chmod +x /opt/bin/*
ENV PATH="$PATH:/opt/bin/"
