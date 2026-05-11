FROM docker.io/library/centos:8
EXPOSE 8080
USER root
RUN dnf -y install httpd && dnf clean all -y
RUN sed -i 's/Listen 80/Listen 8080/' /etc/httpd/conf/httpd.conf
RUN echo "Welcome to Myfirstapp1" > /var/www/html/index.html
RUN chmod -R a+rwx /run/httpd /etc/httpd/logs
USER 1001
CMD /bin/bash -c 'echo webserver...; /usr/sbin/httpd -DFOREGROUND || echo Apache webserver startup failed: $?'

