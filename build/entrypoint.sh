#!/bin/bash

cd /home/workuser/work/ARTIFACT_NAME
./gradlew build
cp ./build/libs/* ../build
echo 'build finished'

trap 'exit 0' TERM
tail -f /dev/null & wait $!
