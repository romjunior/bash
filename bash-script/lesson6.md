# Lição 6: Usando opções avançadas de script

## Trablhando com Options

* É um argumento que muda o comportamento do script
* Não são usados com frequencia nos scripts
* `getopts` é usado para lidar com opções

## Trabalhando com Functions

* São úteis se o código é precisa se repetir com frequência
* Devem ser definidas antes de serem usadas
* É boa prática definir todas as funções no inicio do script

Sintaxe1:
```bash
function help
{
    echo isso é como você faz
}
```

Sintaxe2:
```bash
function help()
{
    echo isso é como você faz
}
```

## Trabalhando com Arrays

* É uma variável de texto que pode guardar multiplos valores
* Embora apreciado, usar Arrays pode ser evitado por causa do bash moderno onde uma variável pode possuir multiplos valores também
* A quantidade de valores mantidos nela são maiores que a abordagem acima, então tem situações específicas para sua utilização

Exemplos:
```bash
names=(linda lisa laura lori)
names[0]=linda
names[1]=lisa
names[2]=laura
names[3]=lori
echo ${names[2]} #Mostra o valor na posição
echo ${names[@]} #Mostra tudo
echo ${#names[@]} #Mostra a quantidade dos itens no Array
```

## Criando menu de interfaces

* `select` é usado para criar menu de seleção:
```bash
select DIR in /bin /usr/ etc
do
    if [ -n $dir ]
    then
        DIR=$DIR
        echo você selecionou $DIR
        export DIR
        break
    else
        echo escolha inválida
    fi
done
```
* note a utilização do `break` no menu de seleção, sem ele o script vai executar pra sempre

## Usando trap

* Usado para redefinir sinais
* Exemplo: CTRL+C ou de outros jeitos é um sinal dado para matar o script(pode ser desligado)
* Consulte `man 7 signal` para ver a lista de sinais disponíveis
