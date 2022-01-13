# Dockerfile for wwdl
FROM php:5.6-fpm-alpine

# Install base packages
RUN apk --no-cache update && \
  apk add --no-cache bash \
    bash-completion \
    curl \
    vim

# Remove junk from nginx install
# Create /app directory tree
RUN rm -rf /etc/nginx/http.d && mkdir -p /app

# Copy in the source code to /app
COPY . /app/
COPY ./conf/php-fpm.conf /usr/local/etc/php-fpm.conf
COPY ./conf/www.conf /usr/local/etc/php-fpm.d/www.conf

RUN rm -rf /app/.git /app/Dockerfile /app/build.sh /app/conf

# Expose our TCP port
EXPOSE 9000/tcp

# Run php-fpm
CMD ["php-fpm", "-F"]
