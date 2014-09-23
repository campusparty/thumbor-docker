thumbor-docker
==============

## To run directly getting image from docker registry

  $ sudo docker run -d -p 8880:8880 campusparty/thumbor

## If want to use your own thumbor.conf

  $ sudo docker run -d -p 8880:8880 -v ${PWD}/thumbor.conf:/root/thumbor.conf campusparty/thumbor

## Or clone/fork this repo, change thumbor.conf and do:

  $ docker build -t myown/thumbor .
  $ docker run -d -p 8880:8880 myown/thumbor





