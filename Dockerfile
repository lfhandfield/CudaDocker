FROM nvidia/cuda:11.6.0-devel-ubuntu18.04

ENV DEBIAN_FRONTEND=noninteractive
ENV R_LIBS_USER=$HOME/R
ENV R_LIBS_SITE=/opt/R
RUN apt-get -y update 
RUN apt-get -y install build-essential vim man xclip libc6-dbg gdb valgrind
RUN apt-get -y install tk libglu1-mesa-dev mesa-common-dev mesa-utils libsdl2-2.0-0 libsdl2-dev glew-utils libglew-dev libsdl2-net-2.0-0 libsdl2-net-dev libsdl2-mixer-2.0-0 libsdl2-mixer-dev
RUN apt-get -y install libarchive-dev libfreetype6-dev squashfs-tools
RUN apt-get -y install python3 python3-pip python3-setuptools python3-dev
RUN pip3 install torch==1.10.2+cu113 torchvision==0.11.3+cu113 torchaudio==0.10.2+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html
RUN python3 -m pip install -U numpy; python3 -m pip install -U pandas; python3 -m pip install -U scipy; python3 -m pip install -U scanpy;  python3 -m pip install -U matplotlib ;  python3 -m pip install -U anndata
RUN python3 -m pip install -U scvi-tools ; python3 -m pip install -U scirpy;  python3 -m pip install -U ipywidgets
RUN python3 -m pip install -U pytorch_lightning  --no-cache-dir
CMD ["jupyter notebook --ip=0.0.0.0 --port=5000 --no-browser --allow-root"]
