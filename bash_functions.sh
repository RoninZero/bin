#
#Set Colors
#
#if tput setaf 1 &> /dev/null; then
#    tput sgr0
#    if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
#      magenta=$(tput setaf 9)
#      orange=$(tput setaf 172)
#      green=$(tput setaf 190)
#      purple=$(tput setaf 141)
#      white=$(tput setaf 256)
#    else
#      magenta=$(tput setaf 5)
#      orange=$(tput setaf 4)
#      green=$(tput setaf 2)
#      purple=$(tput setaf 1)
#      white=$(tput setaf 7)
#    fi
#    bold=$(tput bold)
#    reset=$(tput sgr0)
#else
#    magenta="\033[1;31m"
#    orange="\033[1;33m"
#    green="\033[1;32m"
#    blue="\033[1;34m"
#    purple="\033[1;35m"
#    white="\033[1;37m"
#    bold=""
#    reset="\033[m"
#fi



bold=$(tput bold)
underline=$(tput sgr 0 1)
reset=$(tput sgr0)

purple=$(tput setaf 171)
red=$(tput setaf 1)
green=$(tput setaf 76)
tan=$(tput setaf 3)
blue=$(tput setaf 38)

ceol=$(tput el)
#
# Headers and  Logging
#

e_header() { printf "\n${bold}${purple}==========  %s  ==========${reset}\n" "$@"
}
e_arrow() { printf "➜ $@\n"
}
e_success() { printf "${green}✔ %s${reset}\n" "$@"
}
e_error() { printf "${red}✖ %s${reset}\n" "$@"
}
e_warning() { printf "${tan}➜ %s${reset}\n" "$@"
}
e_underline() { printf "${underline}${bold}%s${reset}\n" "$@"
}
e_bold() { printf "${bold}%s${reset}\n" "$@"
}
e_note() { printf "${underline}${bold}${blue}Note:${reset}  ${blue}%s${reset}\n" "$@"
}

eol_spinner() {
    prog=$1
    msg=$2
    ${prog} &
    pid=$!
    i=1
    sp="/-\|"
    echo -n ' '
    echo -ne "${msg} ${prog}...  "
    while [ -d /proc/$pid ]
    do
      printf "\b${sp:i++%${#sp}:1}"
      sleep .1
    done
    printf "\r${ceol}"
}

bol_spinner() {
    prog=$1
    msg=$2
    ${prog} &
    pid=$!
    i=1
    sp="/-\|"
    echo -n ' '
    echo -ne "  ${msg} ${prog}..."
    while [ -d /proc/$pid ]
    do
      printf "\r\b${sp:i++%${#sp}:1}"
      sleep .1
    done
    printf "\r${ceol}"
}

oscillator() {
    prog=$1
    msg=$2
    ${prog} &
    pid=$!
    i=0
    id="inc" #increment or decrement
    s=("*      " "**     " "***    " " ***   " "  ***  " "   *** " "    ***" "     **" "      *")
    max_len=${#s[@]}

  while [ -d /proc/$pid ]; do
    if [ $id == "inc" ]; then
      echo -ne "\r[${s[i]}]   ${msg}  "
      (( i++ ))
      #if [[ $i -ge ${#s[@]} ]]; then
      if [ $i -ge $(( max_len - 1 )) ]; then
        id="dec"
      fi
    elif [ $id == "dec" ]; then
      echo -ne "\r[${s[i]}]   ${msg}  "
      (( i-- ))
      if [ "$i" -lt 1 ]; then
        id="inc"
      fi
    else
      echo "something when terribly wrong..."
      exit 4
    fi
    sleep .1
  done
  printf "\r${ceol}"
}

seek_confirmation() {
  printf "\n${bold}$@${reset}"
  read -p " (y/n) " -n 1
  printf "\n"
}

# Test whether the result of an 'ask' is a confirmation
is_confirmed() {
if [[ "$REPLY" =~ ^[Yy]$ ]]; then
  return 0
fi
return 1
}
