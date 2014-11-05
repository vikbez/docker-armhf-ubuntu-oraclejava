FROM armbuild/ubuntu:latest

RUN apt-get -qy install wget gzip && apt-get clean

RUN mkdir /opt/java && cd /opt/java && \
    wget -q "http://42k.fr/b/jdk-8u6-linux-arm-vfp-hflt.gz" -O jdk.tar.gz && \
    gunzip jdk.tar.gz && \
    tar -xf jdk.tar && \
    rm -f jdk.tar

RUN update-alternatives --install "/usr/bin/java" "java" "/opt/java/jdk1.8.0_06/bin/java" 1 && \
    update-alternatives --set java /opt/java/jdk1.8.0_06/bin/java && \
    echo "JAVA_HOME=\"/opt/java/jdk1.8.0_06\"" >> /etc/environment

