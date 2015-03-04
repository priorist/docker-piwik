# docker-piwik

## Build

Build with

    $ sudo docker build -t priorist/piwik .


## Deploy

Ensure MySQL container is running and run with:

    $ sudo docker run -d -p 80:80 --link mysql:mysql -v /var/piwik-data:/var/piwik-data --name piwik priorist/piwik

You may use a data volume at */var/piwik-data* for config persistence.


## Deploy with dokku-alt

After you push-deployed the app, create a database container and link it:

    $ sudo dokku mariadb:create piwik-db
    $ sudo dokku mariadb:link piwik piwik-db

Now create a data volume to store Piwik config and link it to the app:

    $ sudo dokku volume:create piwik-data /var/piwik-data
    $ sudo dokku volume:link piwik piwik-data

Write down the database credentials for initial setup:

    $ dokku config piwik
