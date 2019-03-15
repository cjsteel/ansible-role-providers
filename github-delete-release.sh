#!/bin/bash
#
# github-delete-release.sh
#
github-release delete \
  --owner $GITHUB_USER \
  --repo $GIT_REPOSITORY \
  --tag $ANSIBLE_ROLE_VERSION \
  --name $ANSIBLE_ROLE_VERSION \
  $ANSIBLE_ROLE_VERSION.zip $ANSIBLE_ROLE_VERSION.tar.gz
