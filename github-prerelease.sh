#!/bin/bash
#
# auto release using github-release cli
#
ANSIBLE_ROLE_VERSION="0.0.1"
GITHUB_USER=cjsteel
GIT_REPOSITORY=ansible-role-providers

echo $ANSIBLE_ROLE_VERSION > VERSION
source ~/.private/github/$GITHUB_USER
github-release upload \
  --owner $GITHUB_USER \
  --repo $GIT_REPOSITORY \
  --tag $ANSIBLE_ROLE_VERSION \
  --name $ANSIBLE_ROLE_VERSION \
  --body "Release $ANSIBLE_ROLE_VERSION" \
  --prerelease
