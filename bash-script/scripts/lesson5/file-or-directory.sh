#!/bin/bash
if [ -d $1 ]
then
    echo $1 é um diretório
elif [ -f $1 ]
then
    echo $1 é um arquivo
else
    echo $1 não é um arquivo, ou diretório
fi