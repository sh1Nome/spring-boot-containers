#!/bin/bash

function start() {
    JAR_NAME=`ls /opt/app | grep jar`
    java -jar /opt/app/${JAR_NAME}
}

function shutdown() {
    exit 0
}

trap shutdown TERM
start & wait $!
