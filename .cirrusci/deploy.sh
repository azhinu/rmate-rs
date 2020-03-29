#!/usr/local/bin/bash
# This script takes care of building your crate and packaging it for release

set -ex

main() {
    local src=$(pwd) stage=$(mktemp -d)
    tar czvf rmate.tar.gz "$src/target/release/rmate"
    export artifacts=rmate.tar.gz
    echo ${CIRRUS_REPO_OWNER} ${CIRRUS_REPO_NAME} ${CIRCLE_SHA1} ${CIRCLE_TAG} ${artifacts}
    # "$ghr_exe" -t ${GITHUB_TOKEN} -u ${CIRCLE_PROJECT_USERNAME} -r ${CIRCLE_PROJECT_REPONAME} -c ${CIRRUS_SHA1} -delete ${CIRRUS_TAG} ${artifacts}


if [ -n "$CIRRUS_TEST" ]; then
    echo "CIRCLE_TEST is set, exitting"
fi
if [ -z "$CIRRUS_TAG" ]; then
    echo "Not a tagged commit, exitting."
    exit 1
elif [ -z "$GITHUB_TOKEN" ]; then
    echo "Github access token not set, exitting."
else
    echo "This is a tagged commit, running before_deploy"
fi

main