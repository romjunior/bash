#!/bin/bash
#
#Script que mostra o dia, mês e ano em sentenças separadas

DATE=$(date +%d-%m-%y)
echo o dia é ${DATE%%-*}
MONTH=${DATE%-*}
echo o mês é ${MONTH#*-}
echo o ano é ${DATE##*-}