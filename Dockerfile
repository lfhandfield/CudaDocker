FROM nvidia/cuda:11.7.1-devel-ubuntu22.04
RUN apt-get update && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common vim

RUN apt-get update -y
RUN apt-get install -y python3.8 python3-pip

RUN pip install -U numba scanpy jupyterlab jupyter-core traitlets anndata scikit-misc leidenalg --upgrade
RUN pip install torch==1.13.1+cu117 torchvision==0.14.1+cu117 torchaudio==0.13.1 --extra-index-url https://download.pytorch.org/whl/cu117
RUN pip install scvi-tools --upgrade

COPY requirements.txt /
RUN pip3 install -r requirements.txt
