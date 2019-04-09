#!/bin/bash
#
# scripts//github-delete-release.sh
#
source scripts/github-release-variables.sh
source ~/.private/github/$GIT_ACCOUNT
source scripts/github-release-variables.sh
source scripts/github-release-variables-test.sh
github-release delete \
  --owner $GIT_ACCOUNT \
  --repo $GIT_REPOSITORY \
  --tag $GIT_TAG \
  --name $GIT_TAG \
  "*.*"
