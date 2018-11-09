#!/bin/sh

if [ -z "$SECRET_KEY" ]; then
    echo "Create SECRET_KEY"
    export SECRET_KEY=$(LC_ALL=C tr -dc A-Za-z0-9_ </dev/urandom | head -c 32)
fi 

python3 manage.py migrate
python3 manage.py collectstatic --clear --no-input

exec "$@"