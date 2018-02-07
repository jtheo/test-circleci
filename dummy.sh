#!/bin/bash -e
# Dummy script

. include.sh

mkdir -p ${LOG_DIR}

for step in dev prod stg infra legacy
do
  Trap_err=$(( ( ($RANDOM * $RANDOM) % 10 )  + 1 ))
  msg "Launching Step ${step}: ${Trap_err}"
  bash sleeper.sh ${Trap_err} ${step} > ${LOG_DIR}/${step}.log &
done

msg "Jobs:\n$(jobs -p | while read p; do ps -fp $p | tail -n+2;done)"
msg "Waiting for completion..."
wait
msg "Done!"