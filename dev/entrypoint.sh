#!/bin/bash

git config --global user.name "${GIT_USER_NAME}"
git config --global user.email "${GIT_USER_EMAIL}"
git config --global core.autocrlf false
git config --global core.ignorecase false
git config --global core.quotepath false
git config --global pull.rebase false

sed -i "s#GIT_SSH_URL#${GIT_SSH_URL}#g" /home/devusr/work/git_clone.sh

rm -f /home/devusr/work/entrypoint.sh

echo 'entrypoint finished'

function shutdown() {
    echo 'stop container'
    exit 0
}
trap shutdown TERM
tail -f /dev/null & wait $!
