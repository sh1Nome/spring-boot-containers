#!/bin/bash

function start() {
    # MySQLの起動確認
    while true
    do
        nc -vz db 3306
        if [ $? = 0 ]; then
            break
        fi
        sleep 1
    done

    # SpringBootアプリケーションの起動
    JAR_NAME=`ls /opt/app | grep jar`
    java -jar /opt/app/${JAR_NAME}
}

function shutdown() {
    exit 0
}

trap shutdown TERM
start & wait $!
