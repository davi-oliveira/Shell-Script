#!/bin/bash

FILES="/var/log/*log /var/log/**/*log /var/log/*.gz /var/log/**/*.gz"

for f in $FILES
do
    if [ -f "$f" ];then
        if [ `sudo lsof -t $f | wc -w` -ge 1 ]; then
            echo "file $f: one or most process using this file"
            echo -n > $f
        else
            echo "File $f not used in system so it was removed"
            rm $f
        fi
    fi
done
