FROM nvidia/cuda:10.0-devel-ubuntu16.04


RUN apt-get update && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common vim && \
  add-apt-repository ppa:jonathonf/python-3.6

RUN apt-get update -y
RUN apt-get install -y python3.6 python3-pip

COPY requirements.txt /
RUN pip3 install -r requirements.txt
