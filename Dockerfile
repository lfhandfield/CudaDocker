FROM nvidia/cuda:12.2.0-devel-ubuntu22.04

RUN sudo apt-get update && apt-get install -y \
  build-essential vim man xclip libc6-dbg gdb valgrind python3 python3-pip python3-setuptools python3-dev 


CMD ["jupyter notebook --ip=0.0.0.0 --port=5000 --no-browser --allow-root"]
