# Lição 1: Criando o seu primeiro script

* `/bin/sh` é o shell padrão do UNIX
* Muitos shells alternativos foram desenvolvidos e estão disponíveis
* `/bin/bash` é o shell padrão do Linux
* Grandes partes do sistema e aplicações são escritas em bash(Olhe `/etc/init.d`, `/etc/profile` e etc)

## O que é um script

* É um programa simples que não precisa ser compilado
* Script pode ser uma lista de comandos que são executados sequencialmente
* Ou mais espertos, uitilizando elementos mais dinâmicos
    * variáveis
    * condicionais
    * input de usuário

## Ingredientes core do bash

* Inicia com "shebang"; `#!/bin/bash`
    * Nesse caso o # não é um comentário
    * Define o tipo de script que você está criando, ex: `/bin/sh` para UNIX, `/bin/perl` Perl Script.
* Para comentário e documentação use #, script são meio difíceis de ler.
* Utilize identação e espaços no script, como linhas em branco para manter leitura fácil no script
* Utilize `exit` se você não quer que o script termina com o status do último comando.

**OBS: para saber o status do último comando é só executar `echo $?` e ele vai mostrar.**

## Armazenar e executar scripts

* Olhar os diretórios disponíveis no `$PATH` do Linux e armazenar o script lá, o próprio nome pode ser usado para chamar ele no terminal(Utilize os diretórios `/usr/local/bin` ou `$USER/bin`)
*  Ou execute o script no diretório atual `./myuscript.sh` ou ex: `bash myscript`
* Para executar o script, ele precisa ter a permissão de escrita `chmod +x myscript`
* O script não precisa de permissão de execução caso seja iniciado como argumento do shell script `bash myscript`
* O comando `which` pode ser utilizado para ver se existe algum executável nos diretórios `$PATH` com o nome que você passa como parâmetro. ex: `which test`

**OBS: Se você colocar scripts com mesmo nome em diretórios diferentes eles vai olhar a a ordem dos diretórios no $PATH pra saber qual script vai executar**

## Entendendo os comandos internos e externos

* Comando interno faz parte do shell bash
    * Não precisa ser carregado do disco, por isso é mais rápido
    * Utilize **help** para saber a lista
    * Utilize `type [nomedocomando]` para saber se ele é interno
* Comando externo é um comando que é carregado de um arquivo executável no disco
    * São lentos, por que são carregados do disco.

**OBS: se tiver conflito entre comandos internos e externos(Ex: mesmo nome) o comando interno é executado**

## Encontrando ajuda 

* `man bash` tem toda ajuda, mas é muito grande
* `help [nomedocomando]` pode ser utilizado para mostra informação sobre o comando que você precisa
* Existe a internet, e também o guia *Advanced Bash-Scripting Guide* no tldp.ord, é grande.

