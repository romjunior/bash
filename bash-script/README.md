# Bash Script

## Lesson 1

### Por que Bash? 

* /bin/sh é padrão desde os primeiros dias do UNIX
* /bin/bash é o padrão dos sistemas Linux
* Bash scripts compõem sistemas UNIX/Linux.

### O que é um script?

* Simples programa que não deve ser compilado.
* Script por que ser uma mera lista de comandos que são executados.
* Pode utilizar algo mais elaborado nos scripts: variáveis, estruturas condicionais, e user input processing

### Primeiro script
```sh
#!/bin/bash
#this is a comment
echo hello world
```

### Ingredientes do bash script:

* "shebang" #!/bin/bash
  * '#' Não é um comentário nesse caso.
* Use comentário pra facilitar o entendimento do script.
* Use White Lines e outros componentes estruturais pra manter o script legível.
* scripts possuem exit status code.

OBS: echo $? mostra o exit status code do ultimo comando no terminal

### Onde armazenar os scripts:

* O atual diretório do linux não é o $PATH var.
* Considere armazenar o script no diret[orio que esteja no $PATH, como '/usr/local/bin' ou '$USER/bin'
  * Dica: use `echo $PATH` para saber os diretórios que o $PATH olha.

### Como executar os scripts:

* Dar a permissão de execução `chmod +x myscript` e executar o script `./myscript`
* Pode usar outra alternativa que seria o `bash myscript`, nesse caso não precisa da permissão de execução.
* Se você colocar o mesmo script em dois $PATH ele executa o script que achar o primeiro $PATH.

OBS: para verificar que o nome do script j[a existe e já é usado use o comando `which nomescript`, se existir ele vai te mostrar a localização.

### Internal e External Commands

* Internal Commands é parte do bash shell
  * Não precisa ser carregado do disco, portanto é mais rápido.
  * Utilize `help` para ver a lista de Internal Commands.
* External Commands é um comando carregado de um arquivo executável do disco.
  * Normalmente são mais lentos

OBS: use `type command` para verificar se o command é um internal command e que ele não está pegando de algum external file shell.

OBS: Internal Commands sempre tem prioridade sobre External Commands. 


### Ajuda sobre Scripting Components

* `man bash` contém toda ajuda que você precisa, mas é muito largo.
* `help command` pode ser usado pra obter informação sobre o Bash Internals
* Recursos na internet e no guia tldp.org

### Exercício 1

Crie um script que copie o conteúdo do log file /var/log/messages para o /var/log/messages.old e delete o conteúdo do /var/log/messages

```sh
#!/bin/bash

/var/log/messages >> /var/log/messages.old
> /var/log/messages
echo log file copied and cleaned up

exit 0
```

```sh
#!/bin/bash
# Esse script copia o /var/log contents e limpa o atual
#Utilização: ./clearlogs

cp /var/logs/messages /var/log/messages.old
cat /dev/null >> /var/log/messages
echo log file copied and cleaned up

exit 0
```

## Lesson 2

### Usando Variáveis.

* Faz o script ficar flexível.
* Permite um script dinâmico e que pode ser modificado por diferentes valores.

Exemplo:

```sh
#!/bin/bash
# Esse script copia o /var/log contents e limpa o atual
#Utilização: ./clearlogs

LOGFILE=/var/logs/messages

cp $LOGFILE $LOGFILE.old
cat /dev/null >> $LOGFILE
echo log file copied and cleaned up

exit 0
```

### Maneiras de definir variáveis.

* Static: VARNAME=value
* como um argumento usando o o cifrão $1, $2 etc.
* Interativo, usando `read`

OBS: se precisar deixar as variáveis fora do script, use `export` antes da declaração da variável.

### Definindo variável usando `read`

Exemplo de bash:
```sh
#!/bin/bash
#
#Pergunta qual o processo matar

echo which process do you want to kill?
read TOKILL

kill $(ps aux | grep $TOKILL | grep -v grep | awk '{ print $2 }')
```

O `read` espera uma entrada do usuário e após digitar o valor e pressionar Enter ele guarda o valor na variável e continua.

* read da um stop no programa
* usamos o `read -a somename` para escrever todas as palavras em uma array com o somename.

OBS: Caso você tome erros no bash, para debug, use o `bash -x [script]` para que ele rode no modo debug.

Usando Sourcing:

* Usando sourcing os conteúdos de um script podem ser incluídos em outro script.
* É um método comum de separar código estático do dinâmico.
  * Código dinâmico consiste em vars e funções.
* Use o `source` ou . command para dar um source nos scripts.
* Não use exit no final de um script que precisa ser sourced.

Exemplo:

Script Principal:
```sh
#!/bin/bash
# Example script to show how sourcing works

. /root/sourceme

echo the value of the var '$COLOR' is $COLOR

exit 0
```

script no /root/sourceme:
```sh
COLOR=red
```

### Lidando com script args

* Use $1, $2 e etc para lidar com o primeiro, segundo arg...
* $0 se refere ao nome do proprio script.
* Use ${nn} or `shift` para lidar com args que passem além de 9 args.
* Argumentos que são armazenados do $1 em diante não somente leitura.

Lidando com args do jeito inteligente

* Podemos usar o for para avaliar todos os args possíveis.
* Use $@ para referir a todos args providos, onde todos args são tratados um por um.
* Use $# para contar o N de args providos.
* Use $* para trazer todos os args em uma string(casos específicos)

```sh
#!/bin/bash
# Script que mostra como os args são usados.

echo "\$* giver $*"
echo "\$# giver $#"
echo "\$@ giver $@"
echo "\$0 giver $0"

#motra a intrepretação do \$*
for i in "$*"
do
  echo $i
done

#Mostra a interpretação do \$@
for j in "$@"
do 
  echo $i
done
exit 0
```

OBS: Params além do $9 para ter maior compatibilidade com todos os shells use o `shift` e pega o próximo valor e colocar no primeiro arg $1

### Command Substitution

* Permite usar o resultado de um comando no script.
* Útil e provem uma flexibilidade incrível.
* Duas sintaxes permitidas:
  * \`command\` (Depreciado)
  * $(command) (Preferível)
* ls -l $(which passwd)

String verification

* É bom testar o input para verificar a viabilidade
* Use `test -z` para verificar se a não é vazia.
  * test -z $1 && exit 1
* Use [[...]] para verificar padrões específicos.
  * [[  $1=='[a-z]*'  ]] || echo $1 does not start with a letter


## Here Document

* Alterativa para o `echo` para textos longos
* Ou para execução de vários comandos usando `lftp`

Exemplo:
```sh
...
cat <<End-of-Message
frase1
frase2
frase3
frase4
End-of-Message
...
```

Exemplo `lftp`:
```sh
...
lftp localhost <<EndOfSession
ls
get hosts
bye
EndOfSession
...
```

### Exercício 2

Crie um programa para copiar todos os arquivos passados como arg pra o $HOME, se não for passado nenhum arg use o read e copie os arquivos passados por lá.

```sh
#!/bin/bash
# Script que mostra como ter certeza que o input será passado

if [ -z $1 ]
then
  echo provide filenames
  read FILENAMES
else
  FILENAMES="$@"
fi

echo the following filenames have benn provided: $FILENAMES
for i in $FILENAMES
do
  cp $i $HOME
done
```