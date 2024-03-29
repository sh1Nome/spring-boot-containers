#!/bin/bash

function shutdown() {
    echo 'stop container'
    exit 0
}
trap shutdown TERM
tail -f /dev/null & wait $!
