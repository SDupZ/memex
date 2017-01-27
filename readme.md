# Memex

### New Container

<!-- Windows -->
`docker run -it -v c:/Users/Simon/development/memex:/srv/www/memex/memex -p 8003 --name memex sdupz/memex`

<!-- Mac -->
`docker run -it -v ~/sdup/memex:/srv/www/memex/memex -p 8000-8050:80 -e VIRTUAL_HOST=memex.dev --name memex sdupz/memex`

<!-- memex.sdup.nz -->
`docker run -it -v ~/development/django/memex:/srv/www/memex/memex -p 8005 --name memex sdupz/memex`
### Sass Compiler

https://github.com/sass/node-sass/blob/master/README.md

`curl https://raw.githubusercontent.com/creationix/nvm/v0.16.1/install.sh | sh`
`source ~/.profile`
`nvm install 6.5.0`
`npm install node-sass`
`node compile.js`
