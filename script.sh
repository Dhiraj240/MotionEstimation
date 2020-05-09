#! /bin/sh

RUN apt-get update \
    && apk install -y g++ \
    && apk install -y cmake \
    && apk install -y libgsf-1-dev \
    && apk install -y libc++-dev \
    && aapk install -y git \
    # This is a workaround to solve an issue with xlocale.h due it is not present in glibc 2.26
    #&& ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && cd / \
    && git clone https://github.com/Helioviewer-Project/esajpip-SWHV.git \
    && mkdir build && cd build \
    && cmake ../esajpip-SWHV/ -DCMAKE_INSTALL_PREFIX=$HOME/esajpip -DSWHV_PORT_JPIP=8090 -DSWHV_DIR_IMAGE=$HOME/esajpip/images -DSWHV_DIR_LOG=$HOME/esajpip/log \
    && make install \
    && mkdir $HOME/esajpip/{images,log} \
    && cd /root/esajpip/server/esajpip/

top
