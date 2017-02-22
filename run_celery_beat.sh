#!/bin/sh

# wait for RabbitMQ server to start
sleep 10

cd /srv/www/memex/memex

su -m myuser -c "celery beat -A memex.celeryconf"

/bin/bash
