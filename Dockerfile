# Define master image
FROM centos:7

# Package install
RUN yum update -y &&\
	yum install -y  java-1.8.0-openjdk-devel \
					cron \
					wget \
					net-tools

# Prepare Directories
RUN mkdir -p java/bin &&\
    mkdir -p java/src &&\
    mkdir -p java/classes	

# Prepare app
WORKDIR java
COPY src/* ./src
RUN javac ./src/HelloWorld.java -d ./classes

# Prepare volume
RUN mkdir /data/myvol -p

# Write file
RUN echo "Taper votre texte ici" > /data/myvol/test

# Map volume
VOLUME /data/myvol

EXPOSE 80 8080

# Launch app
#ENTRYPOINT ["java", "HelloWorld"]
ENTRYPOINT ["ping","127.0.0.1"]