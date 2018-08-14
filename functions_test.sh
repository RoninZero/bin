#!/bin/bash

source bash_functions.sh

e_header "I am a sample script"
e_success "I am a success message"
e_error "I am an error message"
e_warning "I am a warning message"
e_underline "I am underlined text"
e_bold "I am bold text"
e_note "I am a note"


e_header "I am a sample script"

#set -x
#end_spinner "rpm -qa &> /dev/null" "Currently running this crap ->   "
eol_spinner "sleep 5" "Currently running this crap ->   "
e_bold "done"
#
bol_spinner "sleep 5" "Currently running this new crap ->   "
e_bold "done"

oscillator "sleep 5" "This is a test message"
e_bold "oscillator done!"

#seek_confirmation "Do you want to print a success message?"
#if is_confirmed; then
#  e_success "Here is a success message"
#else
#  e_error "You did not ask for a success message"
#fi
#
#magenta1=$(tput setaf 9)
#orange1=$(tput setaf 172)
#green1=$(tput setaf 190)
#purple1=$(tput setaf 141)
#white1=$(tput setaf 256)
#
#magenta2=$(tput setaf 5)
[dkemeza@fahad-1 bash-testing]$ ^more^cat
cat test.sh 
#!/bin/bash

source functions.sh

e_header "I am a sample script"
e_success "I am a success message"
e_error "I am an error message"
e_warning "I am a warning message"
e_underline "I am underlined text"
e_bold "I am bold text"
e_note "I am a note"


e_header "I am a sample script"

#set -x
#end_spinner "rpm -qa &> /dev/null" "Currently running this crap ->   "
eol_spinner "sleep 5" "Currently running this crap ->   "
e_bold "done"
#
bol_spinner "sleep 5" "Currently running this new crap ->   "
e_bold "done"

oscillator "sleep 5" "This is a test message"
e_bold "oscillator done!"

#seek_confirmation "Do you want to print a success message?"
#if is_confirmed; then
#  e_success "Here is a success message"
#else
#  e_error "You did not ask for a success message"
#fi
#
#magenta1=$(tput setaf 9)
#orange1=$(tput setaf 172)
#green1=$(tput setaf 190)
#purple1=$(tput setaf 141)
#white1=$(tput setaf 256)
#
#magenta2=$(tput setaf 5)
#orange2=$(tput setaf 4)
#green2=$(tput setaf 2)
#purple2=$(tput setaf 1)
#white2=$(tput setaf 7)
#
#
#emagenta="\033[1;31m"
#eorange="\033[1;33m"
#egreen="\033[1;32m"
#eblue="\033[1;34m"
#epurple="\033[1;35m"
#ewhite="\033[1;37m"
#ebold=""
#ereset="\033[m"
#
#
#echo -e "${magenta} magenta ${magenta1} magenta1 ${magenta2} magenta2 ${emagenta} emagenta ${reset}"
#echo -e "${orange} orange ${orange1} orange1 ${orange2} orange2 ${eorange} eorange ${reset}"
#echo -e "${green} green ${green1} green1 ${green2} green2 ${egreen} egreen ${reset}"
#echo -e "${blue} blue ${blue1} blue1 ${blue2} blue2 ${eblue} eblue ${reset}"
#echo -e "${purple} purple ${purple1} purple1 ${purple2} purple2 ${epurple} epurple ${reset}"
#echo -e "${white} white ${white1} white1 ${white2} white2 ${ewhite} ewhite ${reset}"
#echo printf
#printf  "${magenta} magenta ${magenta1} magenta1 ${magenta2} magenta2 ${emagenta} emagenta ${reset}\n"
#printf  "${orange} orange ${orange1} orange1 ${orange2} orange2 ${eorange} eorange ${reset}\n"
#printf  "${green} green ${green1} green1 ${green2} green2 ${egreen} egreen ${reset}\n"
#printf  "${blue} blue ${blue1} blue1 ${blue2} blue2 ${eblue} eblue ${reset}\n"
#printf  "${purple} purple ${purple1} purple1 ${purple2} purple2 ${epurple} epurple ${reset}\n"
#printf  "${white} white ${white1} white1 ${white2} white2 ${ewhite} ewhite ${reset}\n"
#
