#!/bin/bash

git clone "https://github.com/Tiny-Lama/rsyslog-webui.git" /app || true
cd /app
cp config-template.php config.php

cat > config.php << EOL
<?php

	date_default_timezone_set( 'UTC' );

	// Mysql syslog database config
	\$mysql_server = '$MARIADB_HOST';
	\$mysql_database = 'Syslog';
	\$mysql_user = '$MARIADB_USER';
	\$mysql_password = '$MARIADB_PASSWORD';

	// Site Settings
	\$site_name = 'System Logs';

	// Database Settings
	\$keep_logs_for_days = 90;

?>
EOL

# cron for cleanup
# 1 0 * * * cd /app/maintenance; /usr/bin/php ./db-maintenance.php
