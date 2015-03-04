# docker-piwik

Build with

    # docker build -t priorist/piwik .

Ensure MySQL container is running and run with:

    # docker run -d -p 80:80 -p 443:443 --link mysql:mysql --name piwik priorist/piwik
