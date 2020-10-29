#!/bin/bash
# script que conta itens
echo qual diretório você deseja contar?
read DIR
cd $DIR
COUNTER=0

for i in *
do
    COUNTER=$((COUNTER+1))
done

echo eu contei $COUNTER itens nesse diretório