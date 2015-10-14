#!/bin/bash

echo "Press ENTER to ssh to $1"
read a
exec ssh -XY $1

