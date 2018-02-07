#Include functions and Vars

LOG_DIR=.logs
LINE="# -----------------------------------------------------------------------------------#"
function msg(){
    printf "${LINE} \n"
    printf "# $1 \n"
    printf "${LINE} \n"
}
