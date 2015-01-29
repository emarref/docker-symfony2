Boot a Debian Wheezy container, running Nginx, PHP-FPM, and MySQL.

### Prerequisites

1. Docker
2. The virtual machine software of your choice

### Installation

1. Clone this repository `git clone https://github.com/emarref/docker-symfony2.git`
2. CD into the dir `cd docker-symfony2`
3. Build the container `docker build -t symfony2 .`

### Usage

1. Boot the vm of your choice that has docker available as a service
    1.1. Map your application source directory to /var/www on the vm
2. On your host, configure the VM as your docker host `export DOCKER_HOST=<vm_ip_address>:4243`
3. Run the container `docker run -d -p 80:80 -v /var/www:/var/www symfony2`

### Info

- Web server logs are in /var/log/nginx.log
- PHP logs are in /var/log/php-fpm.log
