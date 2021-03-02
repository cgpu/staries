FROM continuumio/miniconda3:4.9.2-alpine
LABEL authors="cgpu" \
      description="Smøl docker image containing dependencies for testing GH actions with conda and docker"

ARG ENV_NAME="base"

# make sure the package repository is up to date
RUN apk update \
 && apk --no-cache add bash=5.0.17-r0 \
 && rm -rf /var/cache/*/* \
 && echo "" > /root/.ash_history

# Use bash as the default shell
# https://github.com/hadolint/hadolint/wiki/DL4005
SHELL ["/bin/bash", "-c"]

# Install the conda environment
COPY environment.yml /
RUN conda env update --quiet --name ${ENV_NAME} --file /environment.yml && \
    conda clean --all --force-pkgs-dirs

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/${ENV_NAME}/bin:$PATH

# Dump the details of the installed packages to a file for posterity
RUN conda env export --name ${ENV_NAME} > ${ENV_NAME}_exported.yml

RUN conda init bash
