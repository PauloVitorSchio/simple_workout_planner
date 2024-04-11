#!/bin/bash
set -e
set -x

echo "Creating migrations..."
python manage.py makemigrations
echo "Migrations created!"

echo "Migrating models..."
python manage.py migrate
echo "Models migrated!"

echo "Starting server... as `whoami`"
python manage.py runserver 0.0.0.0:${DJANGO_PORT:-8000}
