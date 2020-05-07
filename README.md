# dockeresa

This repository contains a Dockerfile for building a JPIP Server image containing the [esajpip][1] software used in the [JHelioviewer project][2].

This Docker image is also available on Docker Hub [dhiraj240/dockeresa:01][3].

## The whole size used in this container is compact and is packaged in small size due to use of best docker image building practices.
## It is of size 2 MB which could have been more than 200 MB without the use of my development process.

## ESA JPIP Server

The ESA JPIP server is capable to handle the following types of JPEG2000 image files:
raw `J2C`, `JP2` and `JPX` with or without hyperlinks. The codestreams of the images
must comply with the following requirements:

- No tiles partition is allowed.
- The progression order must be LRCP, RLCP or RPCL.
- PLT markers must be included with the information of all the packets.

If one image does not fit these requirements then it can not be served by this
server. Moreover, although they are not mandatory, the following requirements
are strongly recommended:

- No tile-parts.
- Use the RPCL progression order.
- Use an appropriate precinct partition.

The ESA JPIP server does not transcode the images at all, serving them as it. 
Therefore the last requirement is particularly recommended for big images in
order to improve the transmission efficiency. For resolution levels bigger 
than `1024x1024` precincts of `512x512` or `256x256` are recommended.

## How to use

Run container in foreground specifying a port and a volume for the JPEG2000 images.

```
docker run -it --rm -p 8090:8090 -v $(pwd)/jp2/:/root/esajpip/images dhiraj240/dockeresa:01
```

Run container in foreground specifying a port, a volume for the JPEG2000 images and a volume for the log files.

```
docker run -it --rm -p 8090:8090 -v $(pwd)/jp2/:/root/esajpip/images -v $(pwd)/log:/root/esajpip/log dhiraj240/dockeresa:01
```

Run container in background specifying a port and a volume for the JPEG2000 images.

```
docker run -d --rm -p 8090:8090 -v $(pwd)/jp2/:/root/esajpip/images dhiraj240/dockeresa:01
```

Run container in background specifying a port, a volume for the JPEG2000 images and a volume for the log files.

```
docker run -d --rm -p 8090:8090 -v $(pwd)/jp2/:/root/esajpip/images -v $(pwd)/log:/root/esajpip/log dhiraj240/dockeresa:01
```

## Docker Hub

https://hub.docker.com/r/dhiraj240/dockeresa


[1]: https://github.com/Helioviewer-Project/esajpip-SWHV
[2]: https://www.jhelioviewer.org
[3]: https://hub.docker.com/r/dhiraj240/dockeresa
