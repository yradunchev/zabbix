##################################
# File System Read Only Check
##################################

#Build File List array
FSROEXTRACT=`cat /etc/fstab| egrep "ext" | grep -v "^#"| awk '{ print  $2 }'`
FSROLIST=(
        $FSROEXTRACT
        )

#Check if each file system is writeable
count=0
FSROCHECKTOTAL=0
while [ "x${FSROLIST[count]}" != "x" ]
do
        FSROCHECK=`touch ${FSROLIST[count]}/test.txt 2> /dev/null && { rm ${FSROLIST[count]}/test.txt 2> /dev/null; echo "0"; } || echo "1"`
        FSROCHECKTOTAL=$(( $FSROCHECKTOTAL + $FSROCHECK ))
        if [ "$FSROCHECK" == 1 ] && [ -d "${FSROLIST[count]}" ]; then
                echo $CURDATE ${FSROLIST[count]} is read only. >> /tmp/fsrocheck.log
        fi
        count=$(( $count + 1 ))
done

if [ "$FSROCHECKTOTAL" == 0 ]; then
        echo $CURDATE all file systems are writeable. >> /tmp/fsrocheck.log
fi

#Send the fsrochecktotal to zabbix
/usr/bin/zabbix_sender -c /etc/zabbix/zabbix_agentd.conf -s $HOSTNAME -k filesystem.ro.check -o $FSROCHECKTOTAL
