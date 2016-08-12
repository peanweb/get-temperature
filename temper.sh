########################################################################
# 機能名称：室温測定処理
# 作成者：松崎新
# 【入力】     なし
# 【出力】     
# 【更新履歴】
#   修正日     更新者   内容
#  2016.08.11  松崎 新  新規作成
#  2016.08.12  松崎 新  Configを読み込むよう変更
########################################################################

#!/bin/sh

#Read Config
INI=/home/pi/def/temper.conf

if [[ ! -f ${INI} ]]
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
