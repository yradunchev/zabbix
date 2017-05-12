# Zabbix stuff

### Template_OS_Linux.xml
  *what*: Default OS Linux template with modifications   
          - added **filesystem.ro.check** key for fscheck.sh

### fscheck.sh   
  *what*: Check all ext filesystems are in rw mode. Uses zabbix_sender to send result to Zabbix   
  *issue*: [KB VMWare: Linux based file systems become read-only (51306)](http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=51306)   
  *script source*: [Zabbix Forums](https://www.zabbix.com/forum/showpost.php?p=161217&postcount=11)

### ssl_check.sh
  *what*: Check ssl certification expiration. Returns day till expiration date.
  *script source*: [Hurme Antti](https://www.null-byte.org/development/monitoring-ssl-certificates-with-zabbix/)
