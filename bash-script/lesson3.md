# Lição 3: Transformando Inputs

## Trabalhando com Substition Operators

* Também conhecido como *string operator* permite que você manipule valores de variáveis de uma maneira fácil.
    * Garanta que a variável exista
    * Coloca valores padrões para as variáveis
    * Pega erros que resultam das variáveis não existirem
    * Remove porções dos valores da variáveis

**Exemplos**

* `${VAR:-word}`: se `$VAR` existir, usa seu valor, se não, retorna a palavra **word**. Isso não altera o valor padrão da variável.
* `${VAR:=word}`: se `$VAR` existir, usa seu valor, se não, altera o valor da variável para **world**.
* `${VAR:?message}`: se `$VAR` existir, mostra o valor. Se não, mostra o VAR seguido pela mensagem. Se a mensagem for omitida, a mensagem `VAR: parameter null or not set` será mostrada
* `${VAR:offset:length}`: se `$VAR` existir, mostra uma substring de `$VAR`, iniciando pelo **offset** com o tamanho usando **length**

[Mais Exemplos](scripts/lesson3/substitution-operator-examples.sh)

## Trabalhando com Pattern Matching

* É usado para remover padrões de uma variável
* É uma excelente maneira de limpar as variáveis que possuem muita informação
    * Exemplo: Se `$DATE` possui 05-01-15 mas você quer só o dia do ano
    * Ou um arquivo tem a extensão *.doc e você quer renomear para usar a extensão *.txt

**Exemplos**

* `${VAR#pattern}`: Procura o pattern do inicio do valor da variável e deleta a parte mais curta que bater, e retorna o resto.
```bash
FILENAME=/usr/bin/bash
echo ${FILENAME#*/}
usr/bin/bash
```

* `${VAR##pattern}`: Procura o pattern do inicio do valor da variável e delete a parte mais longa que bate, e retorna o resto.
```bash
FILENAME=/usr/bin/bash
echo ${FILENAME##*/}
bash
```

* `${VAR%pattern}`: Procura o pattern do fim do valor da variável e delete a parte mais curta que bate, e retorna o resto.
```bash
FILENAME=/usr/bin/bash
echo ${FILENAME##/*}
/usr/bin
```

* `${VAR%%pattern}`: Procura o pattern do fim do valor da variável e delete a parte mais longa que bate, e retorna o resto.
```bash
FILENAME=/usr/bin/bash
echo ${FILENAME##/*}
```

## Entendendo Regular Expressions

* São padrões de busca que podem ser utilizados com algumas utilidades(**grep** e outros processamento de textos, como **awk**, e **sed**)
* Não são a mesma coisa que os shell wildcards
* Quando utilizar, coloque "(strong quotes) para o *shell* não interpretar eles

![Exemplo regex](images/regex-bash.png)

**OBS: Será explorado melhor em conjunto com alguns Utilites na Lição 4**

## Calculos

* Bash oferece maneiras diferentes de calcular no script
* Calculo interno $((1 + 1))
* Calculo externo com `let`:
```bash
#!/bin/bash
# $1 é o primeiro número
# $2 é o operador
# $3 é o segundo número
let x="$1 $2 $3"
echo $x
```
[Exemplo](scripts/lesson3/lets.sh)

* Calculo externo com `bc`
    * As opções acima só lidam com inteiros, e esse comando é feito para lidar com mais que isso.
    * Possui a sua propria interface
    * Use o `bc` de uma maneira não interativa: `echo "scale=9; 10/3"|bc`
    * Ou em uma variável: `VAR=$(echo "scale=9; 10/3"|bc)`
