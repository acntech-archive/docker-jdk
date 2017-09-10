FROM alpine
MAINTAINER Thomas Johansen "thomas.johansen@accenture.com"


ARG JAVA_URL=http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.tar.gz
ARG JAVA_DIR=jdk1.8.0_144


ENV JAVA_HOME /opt/java/default
ENV PATH $PATH:${JAVA_HOME}/bin


RUN apk update && \
    apk upgrade && \
    apk add bash wget gnupg && \
    rm -rf /var/cache/apk/*

RUN wget --no-cookies \
         --no-check-certificate \
         --header "Cookie: oraclelicense=accept-securebackup-cookie" \
         ${JAVA_URL} \
         -O /tmp/java.tar.gz

RUN mkdir -p /opt/java && \
    tar -xzvf /tmp/java.tar.gz -C /opt/java/ && \
    cd /opt/java && \
    ln -s ${JAVA_DIR}/ default && \
    rm -f /tmp/java.tar.gz


CMD ["java", "-version"]
