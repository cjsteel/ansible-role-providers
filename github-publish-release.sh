#!/bin/bash
#
# auto release using github-release cli
#
source ~/.private/github/$GITHUB_USER
github-release upload \
  --owner $GITHUB_USER \
  --repo $GIT_REPOSITORY \
  --tag $ANSIBLE_ROLE_VERSION \
  --name $ANSIBLE_ROLE_VERSION \
  --body "Release $ANSIBLE_ROLE_VERSION" \
  --prerelease=false
