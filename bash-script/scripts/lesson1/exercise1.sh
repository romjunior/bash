#!/bin/sh
#
#
# script que renomeia o arquivo message para message.old e deleta o message
cp message message.old
# pega o resultado do cat /dev/null e lança no message(limpa o arquivo)
cat /dev/null > message
echo "Concluído com sucesso!"

exit 0
