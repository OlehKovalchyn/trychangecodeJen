#!/usr/bin/env bash

sed -e 's/Jenkins/Oleh/; s/Hello/Cap/' ./script.sh > ./newscript.sh
./newscript.sh
