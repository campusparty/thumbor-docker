FROM phusion/baseimage:0.9.13

MAINTAINER Guilherme Rezende <guilhermebr@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN apt-get update
RUN apt-get install -y python-dev
RUN apt-get install -y python-pip

# Clean up any files used by apt-get
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN pip install thumbor
RUN pip install opencv-engine

ADD thumbor.conf /root/thumbor.conf

RUN echo SECRET_KEY=\"`date +%s | sha256sum | base64 | head -c 32`\" >> /root/thumbor.conf

VOLUME ['/root/']

EXPOSE 8880

CMD ["/usr/local/bin/thumbor --port=8880 -c /root/thumbor.conf"]