#!/bin/bash

# Generate Sentry secret key and update docker-compose.yaml
SENTRY_SECRET_KEY=$(docker run --rm sentry config generate-secret-key)
echo ${SENTRY_SECRET_KEY}
export SENTRY_SECRET_KEY=${SENTRY_SECRET_KEY}

# Databases
docker-compose up -d redis postgres sentry

# Initial setup
docker exec -it my-sentry sentry upgrade

# Run the remaining containers (Celery)
docker-compose up -d
