#!/bin/bash

# Dockerイメージをビルド
docker-compose build

# Dockerコンテナを起動
docker-compose up -d