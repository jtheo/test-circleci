#!/bin/bash
# Dummy script

LOG_DIR=.logs

for log in ${LOG_DIR}/*
do
    msg "Log: ${log}"
    cat ${log}
    echo ""
done
