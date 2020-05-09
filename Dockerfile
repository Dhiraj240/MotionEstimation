FROM alpine

LABEL title="esajpip" \
  author="José Juan Sánchez"

ENV DEBIAN_FRONTEND=noninteractive 
ENV SWHV_PORT_JPIP=8090
ENV SWHV_DIR_IMAGE=/root/esajpip/images
ENV SWHV_DIR_LOG=/root/esajpip/log

RUN apk update \
    && apk add g++ \
    && apk add cmake \
    && apk add libgsf-1-dev \
    && apk add libc++-dev \
    && apk add git \
    # This is a workaround to solve an issue with xlocale.h due it is not present in glibc 2.26
    #&& ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && cd / \
    && git clone https://github.com/Helioviewer-Project/esajpip-SWHV.git \
    && mkdir build && cd build \
    && cmake ../esajpip-SWHV/ -DCMAKE_INSTALL_PREFIX=$HOME/esajpip -DSWHV_PORT_JPIP=8090 -DSWHV_DIR_IMAGE=$HOME/esajpip/images -DSWHV_DIR_LOG=$HOME/esajpip/log \
    && make install \
    && mkdir $HOME/esajpip/{images,log} \
&& cd /root/esajpip/server/esajpip/

VOLUME /root/esajpip/images
VOLUME /root/esajpip/log

EXPOSE 8090

WORKDIR /root/esajpip/server/esajpip

CMD ["/bin/sh", "-c", "/root/esajpip/server/esajpip/esajpip"]
