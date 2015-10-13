FROM php:5.6-apache

RUN apt-get update && apt-get install -y \
      wget

ENV PMWIKI_VERSION 2.2.80

RUN wget -O /tmp/pmwiki-${PMWIKI_VERSION}.tgz http://www.pmwiki.org/pub/pmwiki/pmwiki-${PMWIKI_VERSION}.tgz && \
    tar -xvzC /tmp/ -f /tmp/pmwiki-${PMWIKI_VERSION}.tgz && \
    cp -r /tmp/pmwiki-${PMWIKI_VERSION}/* /var/www/html/ && \
    mkdir /var/www/html/wiki.d/ &&  \
    chmod 2777 /var/www/html/wiki.d/ && \
    rm /var/www/html/index.html

COPY index.php /var/www/html/

VOLUME ["/var/www/html/wiki.d/","/var/www/html/local/","/var/www/html/cookbook/"]
