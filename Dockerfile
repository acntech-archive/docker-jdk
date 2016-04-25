FROM ubuntu:15.10


RUN apt-get -y update && apt-get -y install wget
RUN wget --no-cookies --no-check-certificate --header "Cookie: oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u92-b14/jdk-8u92-linux-x64.tar.gz" -O /tmp/jdk.tar.gz
RUN mkdir /opt/java && tar -xzvf /tmp/jdk.tar.gz -C /opt/java/ && ln -s /opt/java/jdk1.8.0_92/ /opt/java/default && rm -f /tmp/jdk.tar.gz


ENV JAVA_HOME /opt/java/default
ENV PATH $PATH:$JAVA_HOME/bin


#CMD ["java -version"]
CMD ["/bin/bash"]