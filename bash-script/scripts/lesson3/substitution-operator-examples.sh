#!/bin/bash
#
#Outros exemplos para ver no script

echo ${DATE:-today}
echo $DATE

echo ${DATE:=today}
echo $DATE


DATE2=$(date +%d-%m-%y)
echo data é $DATE2
echo o dia é ${DATE2:0:2}

echo ${DATE2:?variável não foi populada}