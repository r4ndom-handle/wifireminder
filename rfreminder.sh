#!/bin/bash
#usage:rfreminder.sh <wifi interface>

if [ "$#" -ne 1 ]; then
    echo "Usage:  rfreminder.sh <wifi interface>"
fi

while true; do
        iwlist $1 scanning | grep \'s | cut -f1 --delimiter="'" | cut -f2 --delimiter=\" | while read -r line; do
                espeak "$line... your wifi...is...on"
                echo "[*]WiFi $line"
        done
        hcitool scan | cut -f3 | grep \'s | cut -f1 --delimiter="'" | cut -f2 --delimiter=\" | while read -r line; do
                espeak "$line... your bluetooth...is...on"
                echo "[*]Bluetooth $line"
        done
        sleep 1
        clear
done
