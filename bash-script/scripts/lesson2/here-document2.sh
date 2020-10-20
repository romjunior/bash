#!/bin/bash
#
# Exemplo 2 usando como alternativa para o comando echo

ftp localhost <<EndOfSession
ls
get hosts
bye
EndOfSession