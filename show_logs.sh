#!/bin/bash -e
# Dummy script to show the output

. include.sh
check_for=$1
list_logs=$(ls -1 ${LOG_DIR}/*)

case check_for in
    ok|Ok)
      logs=$(grep -lvE ":Error:|:Warn:" ${list_logs})
      ;;
    warn|Warn)
      logs=$(grep -l :Warn: ${list_logs})
      ;;
    err|Err)
      logs=$(grep -l :Error: ${list_logs})
      ;;
      *)
        msg "Da Fuq? Check for: ${check_for}"
        exit 1
      ;;
esac

if [[ ${#logs} -gt 0 ]]
then
    for log in ${logs}
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
else
    msg "No Logs for ${check_for} logs"
fi