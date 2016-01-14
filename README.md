# Zabbix stuff

### Template_OS_Linux.xml
  *what*: Default OS Linux template with modifications   
          - added filesystem.ro.check key for fscheck.sh

### fscheck.sh   
  *what*: Check all ext* filesystems are in rw mode. Uses zabbix_sender to send result to Zabbix   
  *issue*: http://kb.vmware.com/selfservice/microsites/search.do?language=en_US&cmd=displayKC&externalId=51306   
  *script source*: https://www.zabbix.com/forum/showpost.php?p=161217&postcount=11
  
