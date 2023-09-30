FROM webdevops/php-apache:8.2

LABEL maintainer="karsten@bloxtel.com"

RUN apt update
RUN apt install -y git

COPY 01-rsyslogwebui.sh /opt/docker/provision/entrypoint.d/
RUN chmod +x /opt/docker/provision/entrypoint.d/01-rsyslogwebui.sh
