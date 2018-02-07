#!/bin/bash -e
# Dummy script

. include.sh

mkdir -p ${LOG_DIR}

for step in dev prod stg infra legacy
do
  Trap_err=$(( ( ($RANDOM * $RANDOM) % 10 )  + 1 ))
  msg "Launching Step ${step}: ${Trap_err}"
  bash sleeper.sh ${Trap_err} > ${LOG_DIR}/${step}.log &
done

msg "Jobs:\n$(jobs -l)"
msg "Waiting for completion..."
wait
msg "Done!"