FROM ubuntu
RUN apt-get update -y
RUN apt-get install wget -y
RUN mkdir /workspace
WORKDIR /workspace
RUN wget https://github.com/ekzhang/bore/releases/download/v0.5.0/bore-v0.5.0-x86_64-unknown-linux-musl.tar.gz
RUN tar -xzvf bore-v0.5.0-x86_64-unknown-linux-musl.tar.gz
EXPOSE 1024-65535
CMD [ "./bore", "server" ]