#!/bin/bash

set -e

if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_BRANCH" != "master" ]; then exit 0; fi

git config user.name "vidarDB"
git config user.email "travis.vidardb@gmail.com"
git remote add gh-token "https://${GITHUB_TOKEN}@github.com/vidardb/docs.git";
git fetch gh-token && git fetch gh-token gh-pages:gh-pages;
mkdocs gh-deploy -v --clean --remote-name gh-token;

