FROM ubuntu
MAINTAINER Thomas Johansen "thomas.johansen@accenture.com"


ARG JDK_URL=http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz
ARG JDK_DIR=jdk1.8.0_131


ENV JAVA_HOME /opt/java/default
ENV PATH $PATH:${JAVA_HOME}/bin
ENV DEBIAN_FRONTEND noninteractive


RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get -y install apt-utils wget gnupg-agent

RUN wget --no-cookies \
         --no-check-certificate \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
         ${JDK_URL} \
         -O /tmp/jdk.tar.gz

RUN mkdir /opt/java && \
    tar -xzvf /tmp/jdk.tar.gz -C /opt/java/ && \
    cd /opt/java && \
    ln -s ${JDK_DIR}/ default && \
    rm -f /tmp/jdk.tar.gz

RUN update-alternatives --install "/usr/bin/java" "java" "${JAVA_HOME}/bin/java" 1 && \
    update-alternatives --set "java" "${JAVA_HOME}/bin/java"

RUN update-alternatives --install "/usr/bin/javac" "javac" "${JAVA_HOME}/bin/javac" 1 && \
    update-alternatives --set "javac" "${JAVA_HOME}/bin/javac"

RUN update-alternatives --install "/usr/bin/jar" "jar" "${JAVA_HOME}/bin/jar" 1 && \
    update-alternatives --set "jar" "${JAVA_HOME}/bin/jar"


CMD ["/bin/bash"]
