# Ubuntuベースのイメージを使用
FROM ubuntu:latest

# Apacheと必要なパッケージをインストール
RUN apt-get update && \
    apt-get install -y vim && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*