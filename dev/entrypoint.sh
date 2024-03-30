#!/bin/bash

cd /home/workuser/work
rm -f ./entrypoint.sh

git config --global user.name "${GIT_USER_NAME}"
git config --global user.email "${GIT_USER_EMAIL}"
git config --global core.autocrlf false
git config --global core.ignorecase false
git config --global core.quotepath false
git config --global pull.rebase false

echo 'entrypoint finished'

function shutdown() {
    echo 'stop container'
    exit 0
}
trap shutdown TERM
tail -f /dev/null & wait $!
