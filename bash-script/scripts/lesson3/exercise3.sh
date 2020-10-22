#!/bin/bash
#
#Script que mostra o dia, mês e ano em sentenças separadas

DATE2=$(date +%d-%m-%y)
echo data é $DATE2
echo o dia é ${DATE2:0:2}
echo o mês é ${DATE2:3:2}
echo o ano é ${DATE2:6:4}