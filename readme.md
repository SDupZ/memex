# Memex

### To run the project 22/02/2017

`docker-compose build`
`docker-compose up`

Link to documentation:
https://github.com/SDupZ/memex/wiki/

### For sass compilation

https://github.com/sass/node-sass/blob/master/README.md

`curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh`
`source ~/.profile`
`nvm install 6.5.0`
`npm install node-sass`
`node compile.js`


### Database commands

`pg_dump -Udocker docker > latest_database_backup.sql`
`dropdb -Udocker docker`
`createdb -Odocker -Udocker docker`
`psql -Udocker {% database_name | local %} < latest_database_backup.sql`

<!-- Outdated Information  -->
### OUTDATED INFORMATION

<!-- Windows -->
`docker run -it -v c:/Users/Simon/development/memex:/srv/www/memex/memex -p 8000-8050:80 -e VIRTUAL_HOST=memex.dev --name memex sdupz/memex`

<!-- Mac -->
`docker run -it -v ~/sdup/memex:/srv/www/memex/memex -p 8000-8050:80 -e VIRTUAL_HOST=memex.dev --name memex sdupz/memex`

<!-- memex.sdup.nz -->
`docker run -it -v ~/development/django/memex:/srv/www/memex/memex -p 8005 --name memex sdupz/memex`


docker run -d -p 80:80 -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
