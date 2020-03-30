#!/usr/bin/env bash

# Entry point for the 'server' container
# don't forget to rebuild if you change this file (docker-compose up --build)

set -e
echo "entrypoint.sh"

echo "migrating"
./manage.py migrate --settings=tutorial.settings_migrator

echo "collectstatic"
./manage.py collectstatic --no-input

echo "loading fixtures"
./manage.py loaddata users

echo "starting server"
./manage.py runserver 0.0.0.0:8000

echo "server listening on port 8000"
