FROM registry.access.redhat.com/rhscl/nginx-18-rhel7

RUN mkdir -p /opt/app-root/log /opt/app-root/src/html && chmod 777 /opt/app-root/log && chmod 777 /opt/app-root/src/html
COPY nginx.conf $NGINX_CONFIGURATION_PATH
COPY html/* /opt/app-root/src/html 

CMD /bin/sh -c "$STI_SCRIPTS_PATH/run & sleep 3 && tail -f /opt/app-root/log/access.log"
