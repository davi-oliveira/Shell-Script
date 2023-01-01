#!/bin/bash

FILES="/var/log/*log"

for f in $FILES
do
    #echo "Processos de $f: `sudo lsof -t $f | wc -w`"

    if [ `sudo lsof -t $f | wc -w` -ge 1 ]; then
        echo "file $f: one or most process using this file"
        echo -n > $f
    fi
done