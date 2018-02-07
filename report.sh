#!/bin/bash

. include.sh

t=0
for l in ${LOG_DIR}/*
do 
  work_time=$(grep "^# Sleep timing:" $l | sed 's/# Sleep timing: .* - Sum: \([0-9]*\)/\1/')
  t=$(( ${t} + ${work_time} ))
done

msg "Total time that would have lasted in a sequential execution: $t seconds "