#!/bin/bash -e
# Dummy script to show the output

. include.sh
check_for=$1
Mark_msg=0
list_logs=$(ls -1 ${LOG_DIR}/*)

case ${check_for} in
    ok|Ok)
      logs=$(grep -lvE ":Error:|:Warn:" ${list_logs})
      ;;
    warn|Warn)
      logs=$(grep -l :Warn: ${list_logs})
      ;;
    err|Err)
      logs=$(grep -l :Error: ${list_logs})
      Mark_msg=1
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
        if [[ ${Mark_msg} -eq 0 ]]
        then
            cat ${log} | jq .
        else
            msg "Danger Will Robinson!"
            cat ${log}; echo ""
        fi
        printf "\n# ---------------------------------------------# "
        printf "\n\n"
       
    done
    exit 1
else
    msg "No Logs for ${check_for} logs. Lucky Bastard"
fi