#!/bin/bash
# Esse script copia o conteúdo do ./teste e limpa o arquvio atual
# Utilização variable1.sh

LOGFILE=./teste

cp $LOGFILE $LOGFILE.old
cat /dev/null > $LOGFILE
echo "arquivo de teste copiado e limpo!"

exit 0