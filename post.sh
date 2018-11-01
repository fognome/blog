#!/bin/bash
git add .
git commit -a -m "$*"
git pull origin blog --rebase
git push -u origin blog

# update master branch
rm -rf public/*
hugo
cd public

if [ ! -d ".git" ]; then
    echo "copy .ssh to public"
    cp -r ../.git .
    git checkout -b master
fi

git add .
git commit -a -m "$*"
git pull origin master --rebase
git push -u origin master