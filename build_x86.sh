#! /usr/bin/env bash

docker build --platform linux/amd64 -t flutter-pi-sdk .
docker tag flutter-pi-sdk:latest seyriz/flutter-pi-sdk:latest
docker push seyriz/flutter-pi-sdk:latest
