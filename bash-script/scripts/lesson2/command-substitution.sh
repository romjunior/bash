#!/bin/bash
# Esse script copia o conteudo de teste e limpa o arquivo
# Utilização ./command-substitution

cp teste teste.$(date +%d-%m-%y)
cat /dev/null > teste
echo "arquivo copiado e limpo"

exit 0