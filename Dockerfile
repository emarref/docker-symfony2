FROM debian:wheezy

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E9C74FEEA2098A6E
RUN echo "deb http://packages.dotdeb.org/ wheezy-php55 all" > /etc/apt/sources.list.d/php.list

RUN apt-get update
RUN apt-get -y install \
    nginx curl procps htop\
    php5-fpm php5-cli php5-intl curl php5-curl php5-gd php5-mcrypt php5-mysql
RUN apt-get clean
VOLUME ["/var/www"]

RUN rm -rf /etc/php5/fpm/pool.d
RUN sed -i -e "s/;date.timezone =/date.timezone = UTC/g" /etc/php5/fpm/php.ini

ADD etc /etc

EXPOSE 80

CMD service php5-fpm start && nginx

# docker build -t php-webapp .
