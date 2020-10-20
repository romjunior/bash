#!/bin/bash
#
#Script que copia todos os arquivos passados como argumentos para a paste pessoal.

if [ -z $1 ]
then 
    echo "lista os arquivos para serem copiados"
    read FILENAMES
else
    FILENAMES="$@"
fi

echo os seguintes arquivos foram providos: $FILENAMES

for i in $FILENAMES
do
    echo "copiando $i para $HOME"
    #cp $i $HOME
done