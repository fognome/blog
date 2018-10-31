#!/bin/bash
git add .
git commit -a -m "$*"
git pull origin blog --rebase
git push -u origin blog

# update master branch
rm -rf public/*
hugo

if [ ! -d "public/.git" ]; then
    cp -r .git public
    git checkout -b master
fi

cd public
git commit -a -m "$*"
git pull origin master --rebase
git push -u origin master