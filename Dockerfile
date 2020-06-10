FROM openjdk:8-jdk-alpine3.9
MAINTAINER Steven Gerritsen <steven.gerritsen@gmail.nl>

ARG BLADE_VERSION="latest"

WORKDIR /usr/local

RUN  set -x \
    && apk update --no-cache \
    && apk add curl tree unzip dpkg bash bash-completion ttf-dejavu --no-cache \
    && mkdir -p /opt/blade \
    && curl -fsL https://github.com/jpm4j/jpm4j.installers/blob/master/dist/biz.aQute.jpm.run.jar?raw=true -o biz.aQute.jpm.run.jar \
    && java -jar biz.aQute.jpm.run.jar -g init

COPY files/setBladeProxy.sh /opt/setBladeProxy.sh

RUN set -x \
    && jpm install -f https://releases.liferay.com/tools/blade-cli/${BLADE_VERSION}/blade.jar \
    && blade update

COPY ./files/entrypoint.sh /opt/entrypoint.sh

VOLUME /opt/blade
WORKDIR /opt/blade

ENTRYPOINT ["/opt/entrypoint.sh"]
