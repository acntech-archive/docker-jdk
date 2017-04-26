FROM alpine
MAINTAINER Thomas Johansen "thomas.johansen@accenture.com"


ARG JDK_URL=http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz
ARG JDK_DIR=jdk1.8.0_131


ENV JAVA_HOME /opt/java/default
ENV PATH $PATH:${JAVA_HOME}/bin


RUN apk update && \
    apk upgrade && \
    apk add bash wget gnupg && \
    rm -rf /var/cache/apk/*

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
