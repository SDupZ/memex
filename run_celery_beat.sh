#!/bin/sh

# wait for RabbitMQ server to start
sleep 10

cd /srv/www/memex/memex

celery beat -A memex.celeryconf

/bin/bash
