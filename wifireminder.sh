#!/bin/bash
#usage:wifireminder.sh <interface>

if [ "$#" -ne 1 ]; then
    echo "Usage:  wifireminder.sh interface"
fi

while true; do
        iwlist $1 scanning | grep \'s | cut -f1 --delimiter="'" | cut -f2 --delimiter=\" | while read -r line; do
                espeak "$line... your wifi...is...on"
                echo $line
        done
        sleep 1
        clear
done
