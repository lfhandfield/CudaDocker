FROM nvidia/cuda:12.4-devel-ubuntu22.04
RUN apt-get update && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common vim

RUN apt-get update -y
RUN apt-get install -y python3.11 python3-pip

RUN pip install -U numba scanpy jupyterlab jupyter-core traitlets anndata scikit-misc leidenalg --upgrade 
RUN pip install torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu124 

RUN pip install scvi-tools --upgrade 

CMD ["jupyter notebook --port=8888 --no-browser --allow-root"]
