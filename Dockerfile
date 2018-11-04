# Based from https://github.com/Luke035/nvidia-anaconda-docker/blob/master/Dockerfile

FROM nvidia/cuda:9.0-cudnn7-runtime-ubuntu16.04

MAINTAINER toon.sripata@gmail.com

RUN apt-get update && apt-get install -y \
	wget \
	vim \
	bzip2

#Install MINICONDA
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O Miniconda.sh && \
	/bin/bash Miniconda.sh -b -p /opt/conda && \
	rm Miniconda.sh

ENV PATH /opt/conda/bin:$PATH

#Install ANACONDA Environment
RUN conda create -y -n jupyter_env python=3.6 anaconda && \
	/opt/conda/envs/jupyter_env/bin/pip install tensorflow-gpu keras jupyter-tensorboard jupyterlab

RUN conda install --yes -c pytorch pytorch-nightly cuda92
RUN conda install --yes -c fastai torchvision-nightly
RUN conda install --yes -c fastai fastai

COPY jupyter_notebook_config.json /root/.jupyter/
COPY mykey.key /root/.jupyter
COPY mycert.pem /root/.jupyter
