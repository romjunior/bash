#!/bin/bash
#
#maneira alternativa do file-or-directory

[ -d $1 ] && echo $1 é um diretório && exit 0
[ -f $1 ] && echo $1 é um arquivo || echo $1 não é um arquivo ou diretório