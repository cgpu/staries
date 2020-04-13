MAINTAINER <cgpu>

FROM continuumio/miniconda3:4.8.2

LABEL authors="cgpu" \
      description="Docker image containing dependencies for testing GH actions with conda and docker"

COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a
ENV PATH /opt/conda/envs/staries/bin:$PATH