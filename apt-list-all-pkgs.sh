#!/bin/bash

dpkg-query -f '${binary:Package}\n' -W
