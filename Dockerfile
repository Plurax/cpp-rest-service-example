FROM ubuntu:latest

# Install.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential git cmake

ADD . /opt/cpp-rest-service-example

# checkout submodule and build
RUN \
  cd /opt/cpp-rest-service-example &&\
  git submodule update --init --depth 1 && \
  mkdir build &&\
  cd build &&\
  cmake .. &&\
  make && \
  cp /opt/cpp-rest-service-example/bin/restservice /usr/bin
#COPY /opt/cpp-rest-service-example/bin/restservice /usr/bin

CMD ["/usr/bin/restservice"]

# Set environment variables.
#ENV HOME /root

# Define working directory.
#WORKDIR /root

# Define default command.
