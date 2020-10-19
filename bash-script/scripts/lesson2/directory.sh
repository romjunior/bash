#!/bin/bash
#
#Mostrando variáveis entre os shells

echo "Qual diretório você quer olhar?"
read DIR

cd $DIR
pwd
ls

exit 0
