FROM anthonyolazabal/modbus-production-line-emulator:1.0

RUN apt-get update && apt-get install -y apache2 && rm -rf /var/lib/apt/lists/*
RUN mkdir -p /var/www/html/web
RUN echo "<h1>Bienvenue sur Apache !</h1>" > /var/www/html/web/index.html
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

EXPOSE 80

CMD [ "/bin/sh", "-c", "apachectl start & python3 modbus-server-production-line.py"]
