# Dockerfile for wwdl
#FROM php:5.6-fpm-alpine
FROM alpine:3.8

# Install base packages
RUN apk --no-cache update && \
  apk add --no-cache bash \
    bash-completion \
    curl \
    memcached \
    nginx \
    php5 \
    php5-bcmath \
    php5-cli \
    php5-common \
    php5-dba \
    php5-dev \
    php5-fpm \
    php5-gd \
    php5-mysql \
    php5-mysqli \
    php5-odbc \
    php5-opcache \
    php5-pdo \
    php5-pear \
    php5-snmp \
    php5-soap \
    php5-xml \
    php5-xmlrpc \
    supervisor \
    vim && \
  mkdir -p /var/www/html /run/nginx /run/php-fpm && rm -rf /etc/nginx/conf.d


# Copy in the source code to /app
COPY . /var/www/html/

# Copy configuration customizations
COPY ./conf/php-fpm.conf /etc/php5/php-fpm.conf
COPY ./conf/php.ini /etc/php5/php.ini
COPY ./conf/supervisord.conf /etc/supervisord.conf
COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/nginx.ini /etc/supervisor.d/nginx.ini
COPY ./conf/php-fpm.ini /etc/supervisor.d/php-fpm.ini
COPY ./conf/memcached.ini /etc/supervisor.d/memcached.ini

# Remove junk
RUN rm -rf /var/www/html/.git /var/www/html/Dockerfile /var/www/html/build.sh \
  /var/www/html/conf

# Expose our TCP port
EXPOSE 80/tcp

STOPSIGNAL SIGTERM

# Run supervisord
CMD ["supervisord", "-n"]
