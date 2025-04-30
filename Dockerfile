FROM openjdk:11-jre-slim

ENV GEOSERVER_VERSION=2.26.2
ENV GEOSERVER_HOME=/opt/geoserver
ENV GEOSERVER_ZIP_URL=https://build.geoserver.org/geoserver/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-bin.zip

RUN apt-get update && apt-get install -y unzip wget && \
    mkdir -p $GEOSERVER_HOME && \
    wget -O /tmp/geoserver.zip $GEOSERVER_ZIP_URL && \
    unzip /tmp/geoserver.zip -d /opt && \
    mv /opt/geoserver-${GEOSERVER_VERSION}/* $GEOSERVER_HOME && \
    rm -rf /tmp/geoserver.zip && \
    apt-get clean

EXPOSE 8080
WORKDIR $GEOSERVER_HOME
CMD ["sh", "bin/startup.sh"]
