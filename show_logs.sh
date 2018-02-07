#!/bin/bash
# Dummy script

LOG_DIR=.logs

function msg(){
    echo "# ---------------------------------------------# "
    echo "# $1 "
    echo "# ---------------------------------------------# "
}


for log in ${LOG_DIR}/*
do
    msg "Log: ${log}"
    cat ${log} | jq .
    echo "# ---------------------------------------------# "
    printf "\n\n"
done
