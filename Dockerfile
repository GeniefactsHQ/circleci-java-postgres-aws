FROM ubuntu:xenial

# Install AWS CLI
RUN \
  apt-get update -y && \
	apt-get install -y python-dev python-pip && \
	pip install awscli --upgrade --user

# Define path for pip
ENV PATH=${PATH}:/root/.local/bin

# Install Java.
RUN \
  apt-get install -y software-properties-common python-software-properties && \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer

# Define commonly used JAVA_HOME variable
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle