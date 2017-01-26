FROM ubuntu

# ************************ From Django Base ************************

RUN rm /bin/sh && ln -s /bin/bash /bin/sh


RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys B97B0AFCAA1A47F044F244A07FCC7D46ACCC4CF8
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list


RUN apt-get update
RUN apt-get install -y build-essential python-software-properties software-properties-common postgresql-9.4 postgresql-client-9.4 postgresql-contrib-9.4 libpq-dev
RUN apt-get install -y nginx curl git vim nano
RUN apt-get install -y python-dev python-setuptools
RUN easy_install pip
RUN pip install --upgrade pip
RUN pip install uwsgi virtualenvwrapper


# PostgreSQL stuff
USER postgres
RUN /etc/init.d/postgresql start && psql --command "CREATE USER docker WITH SUPERUSER PASSWORD 'docker';" && createdb -O docker docker
RUN sed -i '1s/^/local all docker trust\n/' /etc/postgresql/9.4/main/pg_hba.conf


USER root

RUN mkdir /srv/www
WORKDIR /srv/www


RUN touch /var/log/uwsgi.log

ADD uwsgi.conf /etc/init/uwsgi.conf
RUN chmod 755 /etc/init/uwsgi.conf

# ************************ Project Config ************************

# Virtual Envinronment
ENV WORKON_HOME /srv/www
RUN source /usr/local/bin/virtualenvwrapper.sh && mkvirtualenv --no-site-packages --distribute memex


# create some necessary directories.
# RUN mkdir $VENV
RUN mkdir $VENV/src
RUN mkdir $VENV/public-www && mkdir $VENV/public-www/media && mkdir $VENV/public-www/static
RUN mkdir $VENV/logs && touch $VENV/logs/info.log


ENV PYTHONUNBUFFERED 1
ADD requirements.txt /tmp/
RUN source $VENV/bin/activate pip install -Ur /tmp/requirements.txt


# startup scripts/configurations
ADD configurations/uwsgiconfig.ini /etc/uwsgi/vassals/memex.ini


ADD configurations/nginx.conf /etc/nginx/sites-available/memex
RUN ln -s /etc/nginx/sites-available/memex /etc/nginx/sites-enabled/memex


RUN chmod +x /etc/uwsgi/vassals/memex.ini
RUN chmod +x /root/runsite.sh


ADD start.sh /root/start.sh
RUN chmod +x /root/start.sh

RUN cd /srv/www/habitat/public-www && find . -type d -exec chmod 775 {} \;

WORKDIR /srv/www/memex/memex

ENTRYPOINT ["/root/start.sh"]
