#!/usr/bin/env bash
export DOCKERCLOUD_USER=$1
export DOCKERCLOUD_APIKEY=$2

DOCKER_CLOUD_CLI_VERSION="1.0.1"
AWS_CLI_VERSION="1.9.20"



apt-get update
apt-get install -y python-pip jq

pip install -q docker-cloud==$DOCKER_CLOUD_CLI_VERSION awscli==$AWS_CLI_VERSION

docker-cloud node byo | sed -n 4p | source /dev/stdin

export NODE_UUID=$(cat /etc/dockercloud/agent/dockercloud-agent.conf | jq -r .UUID)
echo $NODE_UUID




