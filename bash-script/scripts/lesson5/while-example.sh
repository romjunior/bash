#!/bin/bash
COUNTER=0

while true
do
    sleep 1
    COUNTER=$(( COUNTER + 1 ))
    echo $COUNTER segundos se passaram desde o inicio desse script
done