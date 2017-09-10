FROM ubuntu:16.04
MAINTAINER Thomas Johansen "thomas.johansen@accenture.com"


ARG JAVA_URL=http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz
ARG JAVA_DIR=jdk1.8.0_144


ENV JAVA_HOME /opt/java/default
ENV PATH $PATH:${JAVA_HOME}/bin
ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install apt-utils wget gnupg-agent && \
    rm -rf /var/lib/apt/lists/*

RUN wget --no-cookies \
         --no-check-certificate \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
         ${JAVA_URL} \
         -O /tmp/java.tar.gz

RUN mkdir /opt/java && \
    tar -xzvf /tmp/java.tar.gz -C /opt/java/ && \
    cd /opt/java && \
    ln -s ${JAVA_DIR}/ default && \
    rm -f /tmp/java.tar.gz

RUN update-alternatives --install "/usr/bin/java" "java" "${JAVA_HOME}/bin/java" 1 && \
    update-alternatives --set "java" "${JAVA_HOME}/bin/java"

RUN update-alternatives --install "/usr/bin/javac" "javac" "${JAVA_HOME}/bin/javac" 1 && \
    update-alternatives --set "javac" "${JAVA_HOME}/bin/javac"

RUN update-alternatives --install "/usr/bin/jar" "jar" "${JAVA_HOME}/bin/jar" 1 && \
    update-alternatives --set "jar" "${JAVA_HOME}/bin/jar"


CMD ["java", "-version"]
