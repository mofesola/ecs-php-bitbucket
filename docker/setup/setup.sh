#!/bin/bash
set -e
set -x


################################################################################
# install packages
################################################################################

apt-get update -qq && apt-get install -y software-properties-common
apt-get update -qq
cat /tmp/apt-packages.txt | xargs apt-get -qq --yes --force-yes install
pip install --user awscli ecs-deploy
ln -s /root/.local/bin/aws /usr/local/bin/
ln -s /root/.local/bin/ecs /usr/local/bin/

mkdir -p ~/.aws

cd /tmp && curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && \
    cp /tmp/phpcs.phar /usr/local/bin/phpcs && \
    chmod +x /usr/local/bin/phpcs

################################################################################
# last steps and cleaning
################################################################################

apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
