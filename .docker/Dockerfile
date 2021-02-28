FROM continuumio/miniconda3:4.9.2-alpine
LABEL authors="cgpu" \
      description="Smøl docker image containing dependencies for testing GH actions with conda and docker"

ARG ENV_NAME="base"

# make sure the package repository is up to date
RUN apk update \
 && apk upgrade \
 && apk --no-cache add bash=5.0.17-r0 \
 && rm -rf /var/cache/*/* \
 && echo "" > /root/.ash_history

# Change default shell from ash or sh to bash by soft linking
# source: https://stackoverflow.com/a/24323271
RUN ln -sf /bin/bash /bin/ash
RUN ln -sf /bin/bash /bin/sh

# Install the conda environment
COPY environment.yml /
RUN conda install --revision 0 && \
    conda env update --quiet --name ${ENV_NAME} --file /environment.yml && \
    conda clean --all --force-pkgs-dirs

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/${ENV_NAME}/bin:$PATH

# Dump the details of the installed packages to a file for posterity
RUN conda env export --name ${ENV_NAME} > ${ENV_NAME}_exported.yml

RUN conda init bash
