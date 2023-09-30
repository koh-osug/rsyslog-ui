FROM debian:bookworm-slim

LABEL maintainer="karsten@bloxtel.com"

RUN apt update
RUN apt install -y rsyslog debconf-utils
RUN echo 'rsyslog-mysql	rsyslog-mysql/dbconfig-install	boolean	false' | debconf-set-selections -v && apt install -y rsyslog-mysql
RUN apt install -y curl

COPY rsyslog_start.sh /opt/
RUN chmod 755 /opt/rsyslog_start.sh
CMD /opt/rsyslog_start.sh
