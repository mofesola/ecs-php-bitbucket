FROM php:7.1.7-fpm
LABEL MAINTAINER Mofesola Babalola <me@mofesola.com>

RUN apt-get update && apt-get install -y software-properties-common
RUN apt-get install -y gettext-base python2.7 python-pip rsync
RUN mkdir -p ~/.aws

RUN pip install --user awscli ecs-deploy
RUN ln -s /root/.local/bin/aws /usr/local/bin/
RUN ln -s /root/.local/bin/ecs /usr/local/bin/

RUN cd /tmp && curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && \
    cp /tmp/phpcs.phar /usr/local/bin/phpcs && \
    chmod +x /usr/local/bin/phpcs

COPY . /deploy
RUN mv /deploy/.aws/credentials.tmpl ~/.aws/credentials.tmpl && rm -rf /deploy/.aws && rm /deploy/Dockerfile

WORKDIR /deploy
