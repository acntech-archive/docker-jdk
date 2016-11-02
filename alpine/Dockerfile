FROM alpine
MAINTAINER Thomas Johansen "thomas.johansen@accenture.com"


ARG JDK_URL=http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.tar.gz
ARG JDK_DIR=jdk1.8.0_101


ENV JAVA_HOME /opt/java/default
ENV PATH $PATH:${JAVA_HOME}/bin


RUN apk update && \
    apk upgrade && \
    apk add wget

RUN wget --no-cookies \
         --no-check-certificate \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
         ${JDK_URL} \
         -O /tmp/jdk.tar.gz

RUN mkdir -p /opt/java && \
    tar -xzvf /tmp/jdk.tar.gz -C /opt/java/ && \
    cd /opt/java && \
    ln -s ${JDK_DIR}/ default && \
    rm -f /tmp/jdk.tar.gz


CMD ["/bin/bash"]