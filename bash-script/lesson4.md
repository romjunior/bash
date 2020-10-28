# Lição 4: Utilizando ferramentas externas essenciais

## Usando grep

`grep` é uma ferramenta bem flexível para busca de padrões de texto utilizando regex.

```bash

grep -i what * #case isensitive
grep -v what * #excluir as linhas que batem com o padrão
grep -r what * # recursivo
grep -e 'what' -e 'else' * # procura mais de um regex
grep -A5 #mostra 5 linhas após bater a regex
grep -B4 #mostra 4 linhas antes de bater a regex 
```

## Usando test

Permite que você teste várias coisas

```bash
test ( ls /etc/hosts ) #Testa expressões
test -z $1 #Testa textos
test $1 #Testa inteiros
test file1 -nt file2 #comparação de arquivos
test -x file1 #propriedade de arquivos
```

### 3 maneiras de usar o test

* `test -z $1` - Maneira antiga, usando um comando interno do bash
* `[ -z $1 ]` - Equivalente ao `test`, usando um comando interno do bash
* `[[ -z $1 ]]` - Nova versão melhorada do `[...]`, Não é universal como ela, mas possue o `&&` e `||` nativos
* Melhores práticas: se não funcionar o `[]` tente `[[]]`
* Se a compatibilidade com os shells antigos não importa use `[[]]`

## Usando cut e sort

* `cut` é usado para filtrar uma coluna específica ou um campo fora da linha
* `sort` é usado para ordenar os dados
* Eles são frequentemente vistos juntos

Exemplos:
```bash
cut -f 1 -d : caminho/arquivo # mostra a primeira coluna do arquivo, separado por :
sort caminho #ordena as informações que serão mostradas na tela
cut -f 2 -d : caminho/arquivo | sort -n  # mostra a segunda do arquivo, separado por : ordenado por número(-n)
du -h | sort -rn #mostra todos os arquivos e pastas, e quanto elas pessam, -h é utilizado para mostrar se é Kilo, Mega, Gigabytes. E depois ordena por números em ordem reversa
sort -n -k3 -t : caminho/arquivo #ordena o arquivo de forma numérica utilizando a coluna 3 com o delimitador :
```

## Usando tail e head

* `tail` mostra as ultimas linhas de um arquivo
* `head` mostra as primeiras linhas de um arquivo
* Se não especificar o número de linhas o padrão é 10

Exemplo:
```bash
tail -2 caminho/arquivo #mostra as 2 ultimas linhas do arquivo
head -5 caminho/arquivo #mostra as 5 primeiras linhas do arquivo
head -5 caminho/arquivo | tail -1 #mostra somente a linha de numero 5
```

## Usando sed

Ele é mais que um processador de texto, ele é uma linguagem com muitos recursos.

Exemplos:
```bash
sed -n 5p /etc/password # isso mostra a linha de numero 5
sed -i s/old-text/new-text/g ~/myfile # ele substitui(s) o old-text pelo new-text, é global(g) então serão todas as ocorrências no arquivo e -i escreve a alteração no arquivo, pode usar sem o -i para ver no console como vai ficar.
sed -i -e '2d' ~/myfile #deleta a segunda linha do arquivo
sed -i -e '2d;20,25d' ~/myfile #deleta a linha 2, e depois deleta da linha 20 até a 25 do arquivo
```

## Usando awk

Que nem o `sed` é uma linguagem bem rica. É um utilitário de filtragem bem avançada, utilizado ao invés do `cut`, ele é baseado em regex

Utilização básica `awk '/search pattern/ {Actions}' file`

Exemplos:
```bash
awk -F : '{print $4}' caminho/arquivo #filtra e mostra a coluna 4 do arquivo
awk -F : '/user/{print $4}' caminho/arquivo #filtra pelo /user/ e mostra a coluna 4
awk -F : '{print $1,$NF}' caminho/arquivo #mostra a coluna 1 e a ultima coluna($NF)
awk -F : '$3>500' caminho/arquivo #mostra as linhas onde a coluna 3 tenha o valor maior que 500
awk -F : '$NF ~/bash/' caminho/arquivo #mostra a linha se na ultima linha($NF) ele termina com /bash
```

## Usando tr

Usado para transformar strings

```bash
echo hello | tr [a-z][A-Z] #Transforma lower em upper case
echo hello | tr [:lower:][:upper:] # Transforma lower em upper case
```