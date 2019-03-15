#!/bin/bash
#
# auto release using github-release cli
#
ANSIBLE_ROLE_VERSION="0.0.1"
GITHUB_USER=cjsteel
GIT_REPOSITORY=ansible-role-providers

github-release delete \
  --owner $GITHUB_USER \
  --repo $GIT_REPOSITORY \
  --tag $ANSIBLE_ROLE_VERSION \
  --name $ANSIBLE_ROLE_VERSION \
  $ANSIBLE_ROLE_VERSION.zip $ANSIBLE_ROLE_VERSION.tar.gz
