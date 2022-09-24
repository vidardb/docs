#!/bin/bash

set -e

git config user.name "VidarDB"
git config user.email "travis.vidardb@gmail.com"
git remote add gh-token "https://${ACCESS_TOKEN}@github.com/vidardb/docs.git";
git fetch gh-token && git fetch gh-token gh-pages:gh-pages;
mkdocs gh-deploy -v --clean --ignore-version --remote-name gh-token;
