#!/bin/sh
echo "PORT=$PORT"
git fetch origin && git reset --hard origin/main && git clean -f -d
git submodule update --remote
GATEWAY_PORT=$PORT COMPOSE_PROJECT_NAME=staging docker-compose -f docker-compose.prod.yml up --build -d
