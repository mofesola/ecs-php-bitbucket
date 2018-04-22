FROM php:7.1.7-fpm
LABEL MAINTAINER Mofesola Babalola <me@mofesola.com>


################################################################################
## setup container
################################################################################

COPY docker/* /tmp/
RUN /tmp/setup.sh

################################################################################
## setup aws
################################################################################

COPY . /deploy
RUN mv /deploy/.aws/credentials.tmpl ~/.aws/credentials.tmpl && rm -rf /deploy/.aws && rm /deploy/Dockerfile

WORKDIR /deploy
