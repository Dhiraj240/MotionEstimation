FROM alpine

LABEL title="esajpip" \
  author="Dhiraj Sharma"

ENV DEBIAN_FRONTEND=noninteractive 
ENV SWHV_PORT_JPIP=8090
ENV SWHV_DIR_IMAGE=/root/esajpip/images
ENV SWHV_DIR_LOG=/root/esajpip/log

COPY script.sh /script.sh

CMD ["/script.sh"] 

VOLUME /root/esajpip/images
VOLUME /root/esajpip/log

EXPOSE 8090

WORKDIR /root/esajpip/server/esajpip

CMD ["/bin/sh", "-c", "/root/esajpip/server/esajpip/esajpip"]