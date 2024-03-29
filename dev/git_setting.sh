#!/bin/bash

cd /home/workuser/work
rm -f ./git_setting.sh

git config --global user.name "GIT_USER_NAME"
git config --global user.email "GIT_USER_EMAIL"
git config --global core.autocrlf false
git config --global core.ignorecase false
git config --global core.quotepath false
git config --global pull.rebase false
