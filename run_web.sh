#!/bin/sh

# wait for PSQL server to start
sleep 10

cd /srv/www/memex/memex

python manage.py migrate

python manage.py loadMemeModels

python manage.py collectstatic --noinput

/etc/init.d/nginx start

uwsgi --ini /srv/www/memex/memex/docker/server/memex_uwsgi.ini --logto /var/log/uwsgi.log
