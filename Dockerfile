FROM openjdk:8u212-jre-stretch

MAINTAINER Markus Mayer <widemeadows@gmail.com>

ENV VERSION 0.42.1
ENV ARCHIVE https://github.com/buchen/portfolio/releases/download/${VERSION}/PortfolioPerformance-${VERSION}-linux.gtk.x86_64.tar.gz

ENV DISPLAY=:0

RUN apt-get update \
    && apt-get -y --no-install-recommends install libgtk3.0-0 libcanberra-gtk-module libwebkitgtk-3.0.0 \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash portfolio && mkdir /data && chown portfolio /opt /data
USER portfolio

RUN cd /opt && (curl ${ARCHIVE} | tar xvz)

WORKDIR /data
CMD /opt/portfolio/PortfolioPerformance
