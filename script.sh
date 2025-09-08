#!/bin/bash


LOG_DIR="/var/log"
START=$(date +%s)
COUNT=$(sudo grep -nra "php7.4" "$LOG_DIR" | wc -l)
END=$(date +%s)
DIFF=$((END-START))

echo "php7.4 in $LOG_DIR: $COUNT"
echo "Taken time: $DIFF seconds"

