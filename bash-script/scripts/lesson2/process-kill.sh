#!/bin/bash
#
#Passe que você quer para de usar e o comando kill vai matá-lo.

echo "Qual processo você quer matar?"
read TOKILL

kill $(ps aux | grep $TOKILL | grep -v grep | awk '{ print $2 }')

# ps aux lista os processos, grep $TOKILL procura na lista dos processos pelo nome,
# o grep -v grep retira o comando grep da lista, pq estamos usando ele para pesquisar o comando,
# e o awk print $2 é para mostrar somente o ID do processo que é a segunda coluna
