/system script 
add name="dlford-blocklist-dl" source={/tool fetch dst-path=sd1/dlf_blocklist.rsc url="https://raw.githubusercontent.com/dlford/blocklist/master/routeros.rsc" mode=https}
add name="dlford-blocklist-replace" source {/ip firewall address-list remove [find where list="dlford-blocklist"]; /import file-name=sd1/dlf_blocklist.rsc; /file remove sd1/dlf_blocklist.rsc}
/system scheduler 
add interval=7d name="dl-dlford-blocklist" start-date=Jan/01/2000 start-time=00:05:00 on-event=dlford-blocklist-dl
add interval=7d name="ins-dlford-blocklist" start-date=Jan/01/2000 start-time=00:10:00 on-event=dlford-blocklist-replace
/file remove install.rsc
