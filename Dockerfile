# Pull in Docker hub on ubuntu image download
FROM ubuntu:latest

# Creater name 
MAINTAINER "gauravkhandate@gmail.com"

# Update lib and apllication uprade 
RUN apt-get update && apt-get upgrade -y && apt-get -y install vim
RUN apt-get -y install openssh-server 
run service ssh start && bash
# create folder create 
RUN mkdir -p /opt/download
RUN mkdir -p /opt/download/extract
RUN mkdir -p /opt/download/extract/java
RUN mkdir -p /opt/download/extract/maven
RUN mkdir -p /opt/download/extract/tomcat
WORKDIR /opt/download

# Download minimal file of maven and java
# ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.78/bin/apache-tomcat-9.0.78.tar.gz .
ADD https://dlcdn.apache.org/tomcat/tomcat-8/v8.5.98/bin/apache-tomcat-8.5.98.tar.gz .
ADD https://dlcdn.apache.org/maven/maven-3/3.9.4/binaries/apache-maven-3.9.4-bin.tar.gz .
COPY jdk-11.0.19_linux-x64_bin.tar.gz .
RUN tar -zxf apache-tomcat-9.0.80.tar.gz
RUN tar -zxf apache-maven-3.9.4-bin.tar.gz
RUN tar -zxf jdk-11.0.19_linux-x64_bin.tar.gz
RUN mv -f apache-tomcat-9.0.80/* /opt/download/extract/tomcat
RUN mv -f apache-maven-3.9.4/* /opt/download/extract/maven
RUN mv -f jdk-11.0.19/* /opt/download/extract/java

# user add & maven,java configuration of bashrc entry
RUN useradd -m -d /home/Nature4 -s /bin/bash Nature4
RUN mkdir -p /home/Nature4/slave
RUN chmod 777 /home/Nature4/slave
RUN echo "Nature4:redhat" | chpasswd && adduser Nature4 sudo
USER Nature4
WORKDIR /home/Nature4
ENV JAVA_HOME /opt/download/extract/java
ENV M2_HOME /opt/download/extract/maven
ENV PATH=$JAVA_HOME/bin:$M2_HOME/bin:$PATH
