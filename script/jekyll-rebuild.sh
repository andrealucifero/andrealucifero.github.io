#!/bin/bash

# skip if build is triggered by pull request
if [ $TRAVIS_PULL_REQUEST == "true" ]; then
  echo "this is PR, exiting"
  exit 0
fi

# enable error reporting to the console
set -e

# cleanup "_site"
rm -rf _site
mkdir _site

# clone remote repo to "_site"
git clone https://${GH_TOKEN}@github.com/andrealucifero/andrealucifero.github.io.git --branch main _site

# build with Jekyll into "_site"
# exec jekyll build
bundle exec jekyll build


# push empty commit
cd _site
git config user.email "andrea.lucifero@hotmail.com"
git config user.name "andrealucifero"
git commit -a -m "Travis #$TRAVIS_BUILD_NUMBER"
git push origin main

# remove last empty commit
git reset HEAD~
git push origin main --force