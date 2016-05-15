#!/usr/bin/env bash
export DOCKERCLOUD_USER="@docker_username@"
export DOCKERCLOUD_APIKEY="@docker_apikey@"
DOCKERCLOUD_ROLE="@dockercloud_environment@"
DOCKERCLOUD_ENVIRONMENT="@dockercloud_environment@"

DOCKER_CLOUD_CLI_VERSION="1.0.1"

apt-get update
apt-get install -y python-pip jq

pip install -q docker-cloud==$DOCKER_CLOUD_CLI_VERSION

docker-cloud node byo | sed -n 4p | source /dev/stdin

export NODE_UUID=$(cat /etc/dockercloud/agent/dockercloud-agent.conf | jq -r .UUID)
echo $NODE_UUID

docker-cloud tag add -t $DOCKERCLOUD_ROLE $NODE_UUID
docker-cloud tag add -t $DOCKERCLOUD_ENVIRONMENT $NODE_UUID




