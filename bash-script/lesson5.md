# Lição 5: Usando Condicionais

## Usando if...then...fi

* Usado para executar ações baseado em expressões
```bash
if expression
then
    command1
    command2
fi
```

* `else` pode ser incluído para definir o que acontece se a expressão não for `true`
```bash
if expresssion
then 
    command1
else
    command2
fi
```

* `elif` igual ao `else if()` das outras linguagens de programação.
```bash
if expression
then
    command1
elif expression2
then
    command2
fi
```

## Usando && e ||

* São os operadores lógicos E e OU
* Quando usado o `&&` o segundo comando só será executado se o primeiro retornar código zero
```bash
[ -z $1 ] && echo $1 não foi definido
```
* Quando usado o `||` o segundo só será executado se o primeiro retornar código diferente de zero
```bash
[ -f $1 ] || echo $1 não é um arquivo
```

## Usando for

* usados para iterar sobre um intervalo ou séries:
```bash
for i in something
do
    command1
    command2
done
```

Exemplo(Iterando as linhas do arquivo passwd):
```bash
for i in `cat /etc/passwd`
do
    echo $i
done
```

Exemplo(Iterando 10 números):
```bash
for i in {200..210}; do echo $i; done
```

## Usando case

* Usado quando você espera por valores específicos nas condições
Exemplo:
```bash
case $VAR in
    yes) #especifica o case assim
    echo ok;; #termina aquela condição
    no|nee)
    echo too bad;;
    *) #default case
    echo try again;;
esac
```

## Usando while e until

* `while` usado para executar comandos desde de que a condição seja `true`
* `until` usado para executar comandos desde de que a condição seja `false`

Sintaxe:
```bash
while|until condition
do
    command
done
```
