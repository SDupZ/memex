#!/bin/sh

# wait for RabbitMQ server to start
sleep 10

cd /srv/www/memex/memex
# run Celery worker for our project memex with Celery configuration stored in Celeryconf
su -m myuser -c "celery worker -A memex.celeryconf -Q default -n default@%h"
