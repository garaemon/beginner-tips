#!/bin/bash
set -e # exit with nonzero exit code if anything fails
pip install mkdocs --user --quiet
mkdocs build

# clear and re-create the out directory
rm -rf out || exit 0;
mkdir out;

# run our compile script, discussed above


# go to the out directory and create a *new* Git repo
cd out
cp -r ../site/* .
git init

# inside this git repo we'll pretend to be a new user
git config user.name "Travis CI"
git config user.email "garaemon@gmail.com"

# The first and only commit to this new Git repo contains all the
# files present with the commit message "Deploy to GitHub Pages".
git add .
git commit -m "Deploy to GitHub Pages"

# Force push from the current repo's master branch to the remote
# repo's gh-pages branch. (All previous history on the gh-pages branch
# will be lost, since we are overwriting it.) We redirect any output to
# /dev/null to hide any sensitive credential data that might otherwise be exposed.
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages
