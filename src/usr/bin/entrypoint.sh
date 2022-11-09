#!/bin/bash
GAME_LOG='/7days_data/7DaysToDieServer_Data/output_log_*.txt'
cd '/root/Steam/steamapps/common/7 Days to Die Dedicated Server'
cron
echo "* * * * * cp ${GAME_LOG} /7days_saves/Logs/. >&- 2>&-" | crontab -
config_7days
startserver_keepalive.sh &
while true; do
    sleep 10
    tail -f /7days_data/7DaysToDieServer_Data/*.txt
done