#!/bin/bash -e
# Pretend to do something clever

. include.sh
Trap_err=$1
Time=""
Mark_Error=0

function ReportTime(){
    Sum_Sleep=0
    for t in $(echo ${Time})
    do
      Sum_Sleep=$(( ${Sum_Sleep} + ${t} ))
    done

    msg "Sleep timing: ${Time} - Sum: ${Sum_Sleep}"
}

for useless in {1..5}
do
  curl -s https://randomuser.me/api/
  RND_SLEEP=$(( ($RANDOM % 10) + 1 ))
  sleep ${RND_SLEEP}
  Time="${RND_SLEEP} ${Time}"

  if [[ ${Trap_err} -eq 1 || ${Trap_err} -eq 6 ]]
  then
      msg "\nYou picked the wrong one! Trap::Error: ${Trap_err}"
      ReportTime ${Time}
      exit 1
  fi
done

ReportTime ${Time}
(>&2 echo "Process: $$ completed!")