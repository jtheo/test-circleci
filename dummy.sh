#!/bin/bash
# Dummy script

LOG_DIR=.logs

function msg(){
    echo "# ---------------------------------------------# "
    echo "# $1 "
    echo "# ---------------------------------------------# "
}

mkdir ${LOG_DIR}

for step in dev prod stg infra legacy
do
  SLEEP=$(( ( $RANDOM % 20 )  + 1 ))
  msg "Launching Step ${step}: ${SLEEP}"
  bash sleeper > ${LOG_DIR}/${step}.log &
done

wait

for log in ${LOG_DIR}/*
do
    msg "Log: ${log}"
    cat ${log}
    echo ""
done
