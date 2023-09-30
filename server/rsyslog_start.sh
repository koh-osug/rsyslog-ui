#!/bin/bash
cat > /etc/rsyslog.d/mysql.conf << EOL
module (load="ommysql")
*.* action(type="ommysql" server="$MARIADB_HOST" serverport="$MARIADB_PORT" db="Syslog" uid="$MARIADB_USER" pwd="$MARIADB_PASSWORD")
EOL

pidfile="/var/run/rsyslogd.pid"
rm -f "${pidfile}"
cat >> /etc/rsyslog.conf << EOL
module(load="imtcp")
input(type="imtcp" port="514")
EOL

exec rsyslogd -n -f /etc/rsyslog.conf -i "${pidfile}"
