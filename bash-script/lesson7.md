# Lição 7: Analisando e debugando o script

## Considerações de design

Escreva legível:
* Inclua espaços nas linhas
* inclua comentários
* Não escreva para você, e sim de maneira clara para qualquer pessoal que for trabalhar nele depois
* Utilize `exit` para identificar erros específicos

## Dicas e ferramentas de análise comum

* Utilize *Syntax highlighting* nos editores que você utiliza
* No script, utilize `echo` ou `read` nos pontos criticos
* Use `bash -v` para mostrar uma saida verbosa(incluindo mensagens de erro)
* Use `bash -n` para checar erros de *syntax*
* Use `bash -x` para mostrar *Trace* do script
* Use `DEBUG` trap para mostrar informações de bebug sobre tudo no script 
