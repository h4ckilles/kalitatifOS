#/bin/sh

# This script remove a launcher from his desktop file reference

### i are all $1 plugin type instances
### j are all the plugin $i-associated panel desktop files
### k is the plugin number	
for i in $(xfconf-query -c xfce4-panel -lv | grep launcher | awk '{print $1}')
do
	for j in $(xfconf-query -c xfce4-panel -p $i/items | tail -1)
	do
		k=$(echo $i | sed -e 's/.*plugin//g')
		if [ $(cat ~/.config/xfce4/panel/launcher$k/$j | grep X-XFCE-Source | sed -e 's/.*\///g') = "$1" ]
		then
			xfconf-query --channel 'xfce4-panel' --property "/plugins/plugin$k" -rR
			# just restart the panel. The proper way would be to read the panel's plugin-ids array and
			#		remove the id ($k) from the array list. Unfortunately, xfconf-query does not provide
			#		array manipulation routines so you will need some extra bash-foo to get it done.
			xfce4-panel -r
		fi
	done
done
