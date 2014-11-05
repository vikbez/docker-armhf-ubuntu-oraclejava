FROM armbuild/ubuntu:latest

RUN apt-get -qy install wget gzip
RUN mkdir /opt/java
WORKDIR /opt/java
RUN wget -q "http://42k.fr/b/jdk-8u6-linux-arm-vfp-hflt.gz" -O jdk.tar.gz
RUN gunzip jdk.tar.gz
RUN tar -xf jdk.tar
RUN rm -f jdk.tar
RUN update-alternatives --install "/usr/bin/java" "java" "/opt/java/jdk1.8.0_06/bin/java" 1
RUN update-alternatives --set java /opt/java/jdk1.8.0_06/bin/java
RUN echo "JAVA_HOME=\"/opt/java/jdk1.8.0_06\"" >> /etc/environment

