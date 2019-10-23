FROM openjdk:8u212-jre-stretch

MAINTAINER Markus Mayer <widemeadows@gmail.com>

ENV VERSION 0.42.1
ENV ARCHIVE https://daka-media.de/PortfolioPerformance-${VERSION}-linux.gtk.x86_64.tar.gz

ENV DISPLAY=:0

RUN apt-get update \
    && apt-get -y --no-install-recommends install libgtk2.0-0 libcanberra-gtk-module libwebkitgtk-1.0.0 \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash portfolio && mkdir /data && chown portfolio /opt /data
USER portfolio

RUN cd /opt && (curl ${ARCHIVE} | tar xvz)

WORKDIR /data
CMD /opt/portfolio/PortfolioPerformance
