#!/bin/sh

#Read Config
INI=/home/pi/bin/temper.conf

if [ ! -f ${INI} ]
then
  logger -t [temper][Error] Config Not Found
  exit 1
fi

. ${INI}

#Debug
#set -x

#Main
logger -t [temper] TemperatureGetShell.Started

echo -n $(date '+ %m/%d %H:%M:%S') >> $DIR$DATEFILE
echo -n " Current Temperature: " >> $DIR$DATEFILE
/tmp/temper/temper | awk -F , '{print substr($2,1,5)}' >> $DIR$DATEFILE

logger -t [temper] TemperatureGetShell.Finished
