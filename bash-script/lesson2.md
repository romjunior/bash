# Lição 2: Trabalhando com parâmetros e variáveis

## Terminologia

* Qualquer coisa que pode ser utilizada após um comando
    * `ls -l /etc` tem dois argumentos
* Uma opção é um argumento que foi desenvolvido especificamente para mudar o comportamento do comando.
* Parâmetro é um nome definido no script no qual o valor é atribuído.
* Variável é uma label que é armazenado na memória e contém um valor específico.

## Definindo e usando variáveis

* Usando variáveis fazem um script flexível
* Eles permitem que scripts dinâmicos podem ser facilmente modificados para agir em diferentes 

Ex: [variables-1](scripts/lesson2/variables1.sh)

### 3 maneiras de definir variáveis

* Estáticos: VARNAME=value
* Como um argumento para um script, usamos ele $1, $2 e etc. Dentro do script
* Ou pode usar de forma interativa, usando o `read`, ex: [Utilizando o read](scripts/lesson2/process-kill.sh)
* Melhores práticas: Use *uppercase* somente nos nomes das variáveis

**OBS: para debugar o script, execute ele usando `bash -x [nomedoscript]` colocando os sinais de + para mostra os shells e subshells**

### Anotações sobre read

* `read` vai parar o script
* O argumento será tratado como variável e o valor será armazenado na variável
    * Multiplos argumentos podem ser colocados em multiplas variáveis
    * Use `read -a somename` para escrever todas as palavras em um array com o nome provido
* Se nenhum input pro provido, o script vai pausar até o usuário pressionar a tecla Enter

## Entendendo variáveis e Subshells

* Variável só é efetiva no shell em que ela foi definida
* Para deixar as variáveis disponíveis no subshell, utilizamos o `export` antes da variável e do valor
* Não existe outra maneira de fazer variáveis disponíveis nos *parent shells*

**OBS: todas as vezes que executamos scripts, o próprio script é um subshell, é um ambiente a parte para executar o script, e após isso, volta para o *parent shell***

### Como deixar variáveis disponíveis para os subshells

* `/etc/profile` é processado quando aberto no login
    * todas as variáveis definidas aqui ficam disponíveis para todos os subshells daquele usuário
    * Uma versão específica do usuário pode ser usad em `~/.bash_profile`
* `etc/bashrc` é processado quando aberto um subshell
    * variáveis definidas aqui são incluídas nos subshells daqui pra frente
    * Para o usuário em específico, utilize o `~/.bashrc`

## Utilizando o source

* Utilizando o `sourcing` os conteúdos de um script podem ser incluídos em outro script
* Esse é um método comum de separar script estático de dinâmico
    * Dinâmico consiste em variáveis e funções
* Utilize o comando `source` ou . para incluir os scripts
* Não utilize `exit` no fim de um script que será incluído 

[Exemplo](scripts/lesson2/master.sh)