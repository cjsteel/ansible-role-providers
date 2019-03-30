#!/bin/bash
#
# scripts/github-prerelease.sh
#
source ~/.private/github/$GIT_ACCOUNT
source scripts/github-release-variables.sh
source scripts/github-release-variables-test.sh
github-release upload \
  --owner $GIT_ACCOUNT \
  --repo $GIT_REPOSITORY \
  --tag $GIT_TAG \
  --name $GIT_TAG \
  --body "Prerelease $GIT_ACCOUNT.$GIT_SHORT_NAME $GIT_TAG" \
  --prerelease
