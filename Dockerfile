FROM openjdk:11-jre-slim

ENV GEOSERVER_VERSION=2.26.2
ENV GEOSERVER_HOME=/opt/geoserver

# Usa URL com redirecionamento permitido (-L) para SourceForge
RUN apt-get update && apt-get install -y unzip wget && \
    mkdir -p $GEOSERVER_HOME && \
    wget -O /tmp/geoserver.zip -L "https://downloads.sourceforge.net/project/geoserver/GeoServer/${GEOSERVER_VERSION}/geoserver-${GEOSERVER_VERSION}-bin.zip" && \
    unzip /tmp/geoserver.zip -d /opt && \
    mv /opt/geoserver-${GEOSERVER_VERSION}/* $GEOSERVER_HOME && \
    rm -rf /tmp/geoserver.zip && \
    apt-get clean

EXPOSE 8080
WORKDIR $GEOSERVER_HOME
CMD ["sh", "bin/startup.sh"]
