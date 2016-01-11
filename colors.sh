#!/bin/bash

for i in {0..255}; do (( $i  % 8 )) || printf "\n"; printf "\x1b[38;5;${i}mcolor${i}  "; done
printf "\n"
