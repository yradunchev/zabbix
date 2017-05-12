#!/bin/bash - 
#===============================================================================
#
#          FILE: ssl_check.sh
# 
#         USAGE: ./ssl_check.sh HOST PORT
# 
#   DESCRIPTION: Check ssl cert expiration; returns number of days till exp date
# 
#       OPTIONS: HOST - host name to check; PORT - port to check
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Yordan Radunchev (), yordan@radunchev.com
#  ORGANIZATION: 
#       CREATED: 2017-05-12 07:09
#      REVISION: 001
#===============================================================================

HOST=$1
TOUT=25
RETV=0
STMP=`echo | date`
LOGF=./ssl_check.log

if [ -z "$2" ]
  then
    PORT=443;
  else
    PORT=$2;
fi

EDAT=`echo | openssl s_client -connect $HOST:$PORT 2>/dev/null | openssl x509 -noout -dates 2>/dev/null | grep notAfter | cut -d'=' -f2`
ESEC=`date -d "${EDAT}" +%s`
ETIM=$(( ${ESEC} - `date +%s` ))

if test $ETIM -lt 0
  then
    RETV=0
  else
    RETV=$(( ${ETIM} / 24 / 3600 ))
fi

echo "$STMP | $HOST:$PORT expires in $RETV days" >> ssl_check.log
echo ${RETV}
