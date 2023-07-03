FROM nvidia/cuda:12.2.0-devel-ubuntu22.04

ENV DEBIAN_FRONTEND=noninteractive
ENV R_LIBS_USER=$HOME/R
ENV R_LIBS_SITE=/opt/R
RUN apt-get -y update 
RUN apt-get -y install build-essential vim man xclip libc6-dbg gdb valgrind
RUN apt-get -y install tk libglu1-mesa-dev mesa-common-dev mesa-utils libsdl2-2.0-0 libsdl2-dev glew-utils libglew-dev libsdl2-net-2.0-0 libsdl2-net-dev libsdl2-mixer-2.0-0 libsdl2-mixer-dev
RUN apt-get -y install libarchive-dev libfreetype6-dev squashfs-tools
RUN apt-get -y install python3 python3-pip python3-setuptools python3-dev
RUN pip3 install torch==2.0.1+cu117 torchvision==0.15.2+cu117 torchaudio==2.0.2+cu117 -f https://download.pytorch.org/whl/cu117/torch_stable.html
RUN pip3 install --upgrade pytorch_lightning==1.9.0
RUN pip3 install --upgrade anndata scanpy scvi-tools jupyterhub umap rpy2
RUN python3 -c "import numpy; print(numpy.__version__)" > /opt/version_check
RUN pip3 install numpy pandas scipy scanpy matplotlib anndata scirpy ipywidgets
RUN python3 -m pip install -U numba==0.53.0 --no-cache-dir
RUN python3 -c "import numpy; print(numpy.__version__)" > /opt/version_check2

CMD ["jupyter notebook --ip=0.0.0.0 --port=5000 --no-browser --allow-root"]
