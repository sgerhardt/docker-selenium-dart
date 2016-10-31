FROM selenium/standalone-chrome-debug:latest

MAINTAINER Raphael Adam <raphael.adam@workiva.com, raphael912003@gmail.com>

LABEL Description="This image contains the Selenium-HQ with Chrome and the Dart SDK"

ENV CHANNEL stable
# ENV SDK_VERSION latest
ENV SDK_VERSION 1.17.1
ENV ARCHIVE_URL https://storage.googleapis.com/dart-archive/channels/$CHANNEL/release/$SDK_VERSION
ENV PATH $PATH:/usr/lib/dart/bin

RUN apt-get update && apt-get install -y \
    git \
    ssh \
    unzip \
    wget \
  && apt-get clean

RUN wget $ARCHIVE_URL/sdk/dartsdk-linux-x64-release.zip \
  && unzip dartsdk-linux-x64-release.zip \
  && cp dart-sdk/* /usr/local -r \
  && rm -rf dartsdk-linux-x64-release.zip
