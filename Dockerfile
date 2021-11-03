FROM golang:1.12-alpine AS build_base

# Faz a inicialização do diretório de trabalho
WORKDIR /opt/app

# Faz a cópia dos dados para build da aplicação.
COPY . .

# Build da aplicação utilizando parâmetros para diminuir o tamanho do compilado
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -installsuffix cgo -ldflags="-w -s" -o /opt/app/hello

# Multi stage para utilizar uma imagem muito pequena
FROM scratch 

# Faz a cópia do compilado criado no stage anterior para uma pasta do stage atual.
COPY --from=build_base /opt/app/hello /app/

# Roda o compilado
ENTRYPOINT ["/app/hello"]