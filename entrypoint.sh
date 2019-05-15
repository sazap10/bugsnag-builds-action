#!/bin/sh

set -e

URL=${BUILD_API_URL:-"https://build.bugsnag.com"}
RELEASE_STAGE=${RELEASE_STAGE:-production}
BUILDER_NAME=${BUILDER_NAME:-"Bugsnag build reporting"}
METADATA=${METADATA:-"{}"}
AUTO_ASSIGN_RELEASE=${AUTO_ASSIGN_RELEASE:-false}
VERSION=${VERSION:-$GITHUB_REF}

curl $URL \
    --header "Content-Type: application/json" \
    --data '{
      "apiKey": "'${BUGSNAG_API_KEY}'",
      "appVersion": "'${VERSION}'",
      "releaseStage": "'${RELEASE_STAGE}'",
      "autoAssignRelease": "'${AUTO_ASSIGN_RELEASE}'",
      "builderName": "'${BUILDER_NAME}'",
      "sourceControl": {
        "provider": "github",
        "repository": "'https://github.com/${GITHUB_REPOSITORY}'",
        "revision": "'${GITHUB_SHA}'"
      },
      "metadata": '${METADATA}'
    }'
