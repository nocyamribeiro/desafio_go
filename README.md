# Desafio

Esse desafio é muito empolgante principalmente se você nunca trabalhou com a linguagem Go!
Você terá que publicar uma imagem no docker hub. Quando executarmos:

docker run <seu-user>/codeeducation

Temos que ter o seguinte resultado: Code.education Rocks!

## Proposta de solução

Para atender os requisitos foi utilizado o esquema de multi stage build do docker. No primeiro stage foi criado uma estrutura a partir de uma 
imagem preparada para build do go. Neste stage também foi acrescentado alguns parâmetros para diminuir o tamanho do compilado. E no segundo stage, 
foi utilizado uma estratégia parecida com [o Dockerfile do Hello World](https://github.com/docker-library/hello-world/blob/master/amd64/hello-world/Dockerfile),
onde ser monta a execução do ``ENTRYPOINT`` a partir de uma imagem scratch, que tem um tamanho muito reduzido.

## Imagem publicada

A imagem deste desafio foi publicada no repositório do Docker Hub e pode ser baixada a partir deste comando:

```
  docker pull nocyamribeiro/desafio_go
```
 Para verificar maiores detalhes acessar o [link](https://hub.docker.com/r/nocyamribeiro/desafio_go).
