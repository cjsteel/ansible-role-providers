#!/bin/bash
#
# scripts/github-draft-release.sh
#
source ~/.private/github/$GIT_ACCOUNT
source scripts/github-release-variables.sh
source scripts/github-release-variables-test.sh
github-release upload \
  --owner $GIT_ACCOUNT \
  --repo $GIT_REPOSITORY \
  --tag $GIT_TAG \
  --name $GIT_TAG \
  --body "Draft release $GIT_ACCOUNT.$GIT_SHORT_NAME $GIT_TAG" \
  --draft
