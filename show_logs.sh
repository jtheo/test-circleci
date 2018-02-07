#!/bin/bash -e
# Dummy script to show the output

. include.sh

for log in ${LOG_DIR}/*
do
    msg "Log: ${log}"
    cat ${log} | jq .
    ERROR_MSG=$(grep ":Error:" ${log})
    if [[ $? -ne 0 ]]
    then
        msg "Danger Will Robinson!\n ${ERROR_MSG}"
    fi
    printf "\n# ---------------------------------------------# "
    printf "\n\n"
    
done

t=0
for l in .logs/*
do 
  work_time=$(grep "^# Sleep timing:" $l | sed 's/# Sleep timing: .* - Sum: \([0-9]*\)/\1/')
  t=$(( ${t} +  ))
done

msg "Total time would be: $t"