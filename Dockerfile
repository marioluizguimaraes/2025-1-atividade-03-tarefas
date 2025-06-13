# Define a imagem base (Fedora)
FROM fedora:latest

# Atualiza os pacotes e instala utilitários e compilador C
RUN dnf -y update && \
    dnf -y install findutils fish gcc && \
    dnf clean all

# Cria um diretório para a aplicação
RUN mkdir -p /app

# Copia o código C para o container
COPY main.c /app/main.c

# Define o diretório de trabalho
WORKDIR /app

# Compila o código C
RUN gcc main.c -o meu_programa

# Define o comando padrão para abrir o fish shell
CMD ["fish"]
