FROM nvidia/cuda:devel

ENV DEBIAN_FRONTEND=noninteractive
ENV R_LIBS_USER=$HOME/R
ENV R_LIBS_SITE=/opt/R
RUN apt-get -y update 
RUN apt-get -y install build-essential vim man xclip libc6-dbg gdb valgrind
RUN apt-get -y install tk libglu1-mesa-dev mesa-common-dev mesa-utils libsdl2-2.0-0 libsdl2-dev glew-utils libglew-dev libsdl2-net-2.0-0 libsdl2-net-dev libsdl2-mixer-2.0-0 libsdl2-mixer-dev
RUN apt-get -y install libarchive-dev libfreetype6-dev squashfs-tools
RUN apt-get -y install libarchive-dev python3 python3-pip python3-setuptools python3-dev
RUN python3 -m pip install -U numpy; python3 -m pip install -U pandas; python3 -m pip install -U scipy; python3 -m pip install -U scanpy;  python3 -m pip install -U matplotlib ;  python3 -m pip install -U anndata
RUN python3 -m pip install -U scvi ;  python3 -m pip install -U scirpy;  python3 -m pip install -U ipywidgets
RUN python3 -m pip install -U vireoSNP ; python3 -m pip install -U scrublet; python3 -m pip install -U rbcde ; python3 -m pip install cellSNP
RUN python3 -m pip install -U scvi-tools ; python3 -m pip install -U scarches; python3 -m pip install -U torch ; python3 -m pip install -U opencv-python ; python3 -m pip install -U rpy2

RUN apt-get -y install libcurl4-gnutls-dev
RUN apt-get -y install r-base

CMD ["jupyter notebook --ip=0.0.0.0 --port=5000 --no-browser --allow-root"]
