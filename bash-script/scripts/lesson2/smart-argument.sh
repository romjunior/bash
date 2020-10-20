#!/bin/bash
# Script que mostra como lidar com os argumentos

echo "\$* vai dar $*"
echo "\$# vai dar $#"
echo "\$@ vai dar $@"
echo "\$0 é $0"

# Mostrando a interpretação do \$*

for i in "$*"
do
    echo $i
done

# Mostrando a interpretação do \$@
for j in "$@"
do 
    echo $j
done

exit 0