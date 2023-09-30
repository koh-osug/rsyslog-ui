#!/bin/bash
# run once or after updates
docker-compose build
xterm -e docker-compose up --remove-orphans rsyslogdb &
sleep 10
# 2nd terminal
xterm -e docker-compose up --remove-orphans rsyslogserver &
# 3rd terminal
xterm -e docker-compose up --remove-orphans rsyslogwebui &