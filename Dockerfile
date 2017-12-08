FROM csepely/lighttpd:latest
ADD https://github.com/poweradmin/poweradmin/archive/v2.1.7.tar.gz /var/www/html/
COPY poweradmin.sh /docker.init/modules.available/poweradmin.sh
RUN ln -rs /docker.init/modules.available/poweradmin.sh /docker.init/modules.enabled/003-poweradmin.sh

