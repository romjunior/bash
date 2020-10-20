#!/bin/bash
#
#Script para demostrar o uso do shift

echo "os argumentos passados foram esses $*"
echo "o valor de \$1 é $1"
shift
echo "o novo valor de \$1 é $1"

exit 0